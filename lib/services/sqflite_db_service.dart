import 'dart:async';

import 'package:agucareer/models/chats_model.dart';
import 'package:agucareer/models/message_model.dart';
import 'package:agucareer/models/user_model.dart';
import 'package:agucareer/services/db_service.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteDBService implements DBService {
  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  initDb() async {
    var dbFolder = await getDatabasesPath();
    String path = dbFolder + "\\local.db";
    return await openDatabase(path, onCreate: _onCreate, version: 1);
  }

  Future<FutureOr<void>> _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE MESSAGES(id INTEGER PRIMARY KEY, receiver INTEGER, message TEXT)");
  }

  /*
  Future<List<Chats>> getChats() async{
    var dbClient = await db;
    var result = await dbClient.query("MESSAGES");
    debugPrint("adadfd" + result.toString());
    return null;
  }
  */

  @override
  Stream<List<Message>> getMessages(String fromID, String toID) {
    // TODO: implement getMessages
    return null;
  }

  @override
  Future<DateTime> getTime(String userID) {
    // TODO: implement getTime
    return null;
  }

  @override
  Future<User> getUser(String userID) {
    // TODO: implement getUser
    return null;
  }

  @override
  Future<List<User>> getUserList() {
    // TODO: implement getUserList
    return null;
  }

  @override
  Future<bool> saveUser(User user) {
    // TODO: implement saveUser
    return null;
  }

  @override
  Future<bool> sendMessage(Message message) {
    // TODO: implement sendMessage
    return null;
  }

  @override
  Future<bool> updateUser(String userID, Map<String, dynamic> map) {
    // TODO: implement updateUser
    return null;
  }

  @override
  Future<List<Chats>> getChats(String userID) {
    // TODO: implement getChats
    return null;
  }

}
