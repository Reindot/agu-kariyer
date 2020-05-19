import 'dart:io';

import 'package:agucareer/locator.dart';
import 'package:agucareer/models/chats_model.dart';
import 'package:agucareer/models/message_model.dart';
import 'package:agucareer/models/user_model.dart';
import 'package:agucareer/repository/user_repository.dart';
import 'package:agucareer/services/auth_service.dart';
import 'package:agucareer/services/db_service.dart';
import 'package:agucareer/services/storage_service.dart';
import 'package:flutter/cupertino.dart';

enum ViewState { IDLE, BUSY }

class UserModel with ChangeNotifier implements AuthService, DBService, StorageService {
  ViewState _state = ViewState.IDLE;
  UserRepository _userRepository = locator<UserRepository>();
  User _user;

  ViewState get state => _state;
  User get user => _user;

  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  UserModel() {
    currentUser();
  }

  @override
  Future<User> currentUser() async {
    try {
      state = ViewState.BUSY;
      _user = await _userRepository.currentUser();
      return _user;
    } finally {
      _state = ViewState.IDLE;
    }
  }

  @override
  Future<User> signIn(String email, String password) async {
    try {
      state = ViewState.BUSY;
      _user = await _userRepository.signIn(email, password);
      return _user;
    } finally {
      _state = ViewState.IDLE;
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      state = ViewState.BUSY;
      bool value = await _userRepository.signOut();
      _user = null;
      return value;
    } finally {
      _state = ViewState.IDLE;
    }
  }

  @override
  Future<bool> resetPassword(String email) async {
    try {
      state = ViewState.BUSY;
      bool value = await _userRepository.resetPassword(email);
      _user = null;
      return value;
    } finally {
      _state = ViewState.IDLE;
    }
  }

  @override
  Future<User> createUser(String email, String password) async {
    try {
      state = ViewState.BUSY;
      _user = await _userRepository.createUser(email, password);
      return _user;
    } finally {
      _state = ViewState.IDLE;
    }
  }

  @override
  Future<User> getUser(String userID) {
    // TODO: implement getUser
    return null;
  }

  @override
  Future<bool> saveUser(User user) {
    // TODO: implement saveUser
    return null;
  }

  @override
  Future<bool> updateUser(String userID, Map<String, dynamic> map) async {
    try {
      state = ViewState.BUSY;
      await _userRepository.updateUser(userID, map);
      return true;
    } finally {
      _state = ViewState.IDLE;
    }
  }

  @override
  Future<String> uploadProfilePhoto(String userID, File file) async {
    try {
      state = ViewState.BUSY;
      return await _userRepository.uploadProfilePhoto(userID, file);
    } finally {
      _state = ViewState.IDLE;
    }
  }

  @override
  Future<List<User>> getUserList() async{
    try {
      state = ViewState.BUSY;
      return await _userRepository.getUserList();
    } finally {
      _state = ViewState.IDLE;
    }
  }

  @override
  Stream<List<Message>> getMessages(String fromID, String toID) {
    try {
      state = ViewState.BUSY;
      return _userRepository.getMessages(fromID, toID);
    } finally {
      _state = ViewState.IDLE;
    }
  }

  @override
  Future<bool> sendMessage(Message message) async{
    try {
      state = ViewState.BUSY;
      return await _userRepository.sendMessage(message);
    } finally {
      _state = ViewState.IDLE;
    }
  }

  @override
  Future<List<Chats>> getChats(String userID) async{
    try {
      state = ViewState.BUSY;
      //return await _userRepository.getChats(userID);
      var test = await _userRepository.getChats(userID);
      debugPrint("||||||||||||||||||||||" + test.first.name);
      return test;
    } finally {
      _state = ViewState.IDLE;
    }
  }

  @override
  Future<DateTime> getTime(String userID) async {
    try {
      state = ViewState.BUSY;
      return await _userRepository.getTime(userID);
    } finally {
      _state = ViewState.IDLE;
    }
  }

}
