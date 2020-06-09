import 'dart:io';

import 'package:agucareer/locator.dart';
import 'package:agucareer/models/chats_model.dart';
import 'package:agucareer/models/file_model.dart';
import 'package:agucareer/models/meeting_model.dart';
import 'package:agucareer/models/message_model.dart';
import 'package:agucareer/models/notification_model.dart';
import 'package:agucareer/models/user_model.dart';
import 'package:agucareer/services/auth_service.dart';
import 'package:agucareer/services/db_service.dart';
import 'package:agucareer/services/fireabase_storage_service.dart';
import 'package:agucareer/services/firebase_auth_service.dart';
import 'package:agucareer/services/firestore_db_service.dart';
import 'package:agucareer/services/local_db_service.dart';
import 'package:agucareer/services/storage_service.dart';
import 'package:flutter/cupertino.dart';

enum AuthMode { FIREBASE, LOCAL }
enum DBMode { FIRESTORE, LOCAL }
enum StorageMode { FIREBASE }
enum AppMode { BUILD, RELEASE}

class UserRepository implements AuthService, DBService, StorageService {
  FirebaseAuthService _firebaseAuthService = locator<FirebaseAuthService>();
  FirestoreDBService _firestoreDBService = locator<FirestoreDBService>();
  LocalDBService _localDBService = locator<LocalDBService>();
  FirebaseStorageService _firebaseStorageService =
      locator<FirebaseStorageService>();

  AuthMode _authMode = AuthMode.FIREBASE;
  DBMode _dbMode = DBMode.FIRESTORE;
  StorageMode _storageMode = StorageMode.FIREBASE;
  AppMode _appMode = AppMode.BUILD;

  List<User> userList = [];

  @override
  Future<User> currentUser() async {
    if(_appMode == AppMode.RELEASE){
      User _user = await _localDBService.getUser("local");
      if(_user != null)
        return _user;
    }

    if(_appMode == AppMode.BUILD){
      if(_authMode == AuthMode.LOCAL){
        User _user = await _localDBService.getUser("local");
        debugPrint("user_repository >>> currentUser >>> ${_user.toString()}");
        return _user;
      }
      if (_authMode == AuthMode.FIREBASE) {
        User _user = await _firebaseAuthService.currentUser();
        debugPrint("user_repository >>> currentUser >>> ${_user.toString()}");
        if (_user != null) {
          return await _firestoreDBService.getUser(_user.userID);
        }
      }
    }

    return null;
  }

  @override
  Future<User> signIn(String email, String password) async {
    if(_appMode == AppMode.RELEASE){
      User _user = await _firebaseAuthService.signIn(email, password);
      User _saveToDb = await _firestoreDBService.getUser(_user.userID);
      var value = await _localDBService.saveUser(_saveToDb);
      return _saveToDb;
    }

    if(_appMode == AppMode.BUILD){
      if(_authMode == AuthMode.LOCAL)
        return _localDBService.getUser("local");
      if (_authMode == AuthMode.FIREBASE) {
        User _user = await _firebaseAuthService.signIn(email, password);
        return await _firestoreDBService.getUser(_user.userID);
      }
    }

    return null;
  }

  @override
  Future<bool> signOut() async {
    if(_appMode == AppMode.RELEASE){
      await _firebaseAuthService.signOut();
      return await _localDBService.signOut();
    }

    if(_appMode == AppMode.BUILD){
      if(_authMode == AuthMode.LOCAL)
        await _localDBService.signOut();
      if (_authMode == AuthMode.FIREBASE)
        return await _firebaseAuthService.signOut();
    }

    return false;
  }

  @override
  Future<bool> resetPassword(String email) async {
    if (_authMode == AuthMode.FIREBASE)
      return await _firebaseAuthService.resetPassword(email);
    return false;
  }

  @override
  Future<User> createUser(String email, String password) async {
    if (_authMode == AuthMode.FIREBASE) {
      User _user = await _firebaseAuthService.createUser(email, password);
      bool _value = await _firestoreDBService.saveUser(_user);
      if (_value) {
        return await _firestoreDBService.getUser(_user.userID);
      } else
        return null;
    }
    return null;
  }

  @override
  Future<User> getUser(String userID) {
    return null;
  }

  @override
  Future<bool> saveUser(User user) {
    return null;
  }

  @override
  Future<bool> updateUser(String userID, Map<String, dynamic> map) async {
    if (_dbMode == DBMode.FIRESTORE) {
      await _firestoreDBService.updateUser(userID, map);
      return true;
    }
    return null;
  }

  @override
  Future<String> uploadProfilePhoto(String userID, File file) async {
    if (_storageMode == StorageMode.FIREBASE) {
      var url = await _firebaseStorageService.uploadProfilePhoto(userID, file);
      await _firestoreDBService.updateUser(userID, {'profileURL': url});
      return url;
    }
    return null;
  }

  @override
  Future<List<User>> getConnections(User user) async {
    if (_dbMode == DBMode.FIRESTORE) {
      userList = await _firestoreDBService.getConnections(user);
      return userList;
    }
    return null;
  }

  @override
  Stream<List<Message>> getMessages(String fromID, String toID) {
    /*
    if(_dbMode == DBMode.LOCAL)
      return _localeDBService.getMessages(fromID, toID);
     */

    if (_dbMode == DBMode.FIRESTORE)
      return _firestoreDBService.getMessages(fromID, toID);
    return null;

  }

  @override
  Future<bool> sendMessage(Message message) async {
    if(_dbMode == DBMode.LOCAL)
        return _localDBService.sendMessage(message);
    if (_dbMode == DBMode.FIRESTORE)
      return await _firestoreDBService.sendMessage(message);
    return null;
  }

  @override
  Future<List<Chats>> getChats(String userID) async {
    if (_dbMode == DBMode.FIRESTORE) {
      var chatList = await _firestoreDBService.getChats(userID);
      for(var chat in chatList){
        var moreInfo = findUserInList(chat.receiver);
        if(moreInfo != null){
          chat.name = moreInfo.name;
          chat.profileURL = moreInfo.profileURL;
        } else{
          var infoFromDB = await _firestoreDBService.getUser(chat.receiver);
          chat.name = infoFromDB.name;
          chat.profileURL = infoFromDB.profileURL;
        }
      }
      debugPrint(">>> user_repository >>> getChats >>> ${chatList.length}");
      return chatList;
    }
    return null;
  }

  User findUserInList(String userID) {
    for(int i = 0; i < userList.length; i++){
      if(userList[i].userID == userID){
        return userList[i];
      }
    }
    return null;
  }

  @override
  Future<DateTime> getTime(String userID) async {
    if (_dbMode == DBMode.FIRESTORE)
      return await _firestoreDBService.getTime(userID);
    return null;
  }

  @override
  Future<bool> markAsSeen(String me, String it) async{
    if (_dbMode == DBMode.FIRESTORE)
      return await _firestoreDBService.markAsSeen(me, it);
    return null;
  }

  @override
  Future<String> uploadFile(File file) async{
    if (_storageMode == StorageMode.FIREBASE) {
      var url = await _firebaseStorageService.uploadFile(file);
      Files add = Files(url: url, name: 'Name');
      await _firestoreDBService.addFileData(add);
      return url;
    }
    return null;
  }

  @override
  Future<List<Files>> getFileList() async{
    if (_storageMode == StorageMode.FIREBASE) {
      return await _firestoreDBService.getFileList();
    }
  }

  @override
  Future<bool> makeAnnouncement(Notifications notification) async{
    if (_storageMode == StorageMode.FIREBASE) {
      return await _firestoreDBService.makeAnnouncement(notification);
    }
  }

  @override
  Future<List<Notifications>> getNotifications(User user) async{
    if (_storageMode == StorageMode.FIREBASE) {
      return await _firestoreDBService.getNotifications(user);
    }
  }

  @override
  Future<bool> createMeeting(Meetings meeting) async{
    if (_storageMode == StorageMode.FIREBASE) {
      var ret = await _firestoreDBService.createMeeting(meeting);
      if(ret){
        var not1 = Notifications(type: "MEETING_CREATED", text: "${meeting.itName} ile görüşmek için talebte bulundun!");
        var not2 = Notifications(type: "CONFIRM_MEETING", text: "${meeting.meName} seninle bir buluşma talebinde bulundu!");
        await _firestoreDBService.sendPersonalNotification(meeting.meID, not1);
        await _firestoreDBService.sendPersonalNotification(meeting.itID, not2);
      }
    }
  }

  @override
  Future<bool> sendPersonalNotification(String userID, Notifications notification) async{
    if (_storageMode == StorageMode.FIREBASE) {
      return await _firestoreDBService.sendPersonalNotification(userID, notification);
    }
  }
}