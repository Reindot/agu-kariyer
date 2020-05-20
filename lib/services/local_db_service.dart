import 'dart:async';

import 'package:agucareer/models/message_model.dart';
import 'package:agucareer/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

class LocalDBService {
  static Database _db;
  String _path;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  initDb() async {
    var databasesPath = await getDatabasesPath();
    _path = databasesPath + '\\local.db';
    debugPrint("dp createdd >>>>>> " + _path);
    return await openDatabase(_path, onCreate: _onCreate, version: 1);
  }

  Future<FutureOr<void>> _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE MESSAGES "
        "(id INTEGER PRIMARY KEY,"
        "receiver TEXT, "
        "date TEXT, "
        "message TEXT, "
        "isMine TEXT, "
        "on_db TEXT);");

    await db.execute("CREATE TABLE USER "
        "(userID TEXT, "
        "email TEXT, "
        "profileURL TEXT, "
        "type TEXT, "
        "name TEXT, "
        "bio TEXT, "
        "professional TEXT, "
        "company TEXT);");

  }

  /*

  Future<List<Message>> queryMessages() async{
    var dbClient = await db;
    var result = await dbClient.query("MESSAGES", orderBy: "date");
    debugPrint(">>>>>>>>>> $result");
    return result.map((data) => Message.fromMap(data)).toList();
  }

  @override
  Stream<List<Message>>  getMessages(String fromID, String toID) {
    return Stream.fromFuture(queryMessages());
  }

   */

  @override
  Future<bool> signOut() async {
    deleteDatabase(_path);
    return true;
  }

  @override
  Future<bool> saveUser(User user) async {
    var dbClient = await db;
    await dbClient.insert("USER", user.toMap());
  }

  @override
  Future<User> getUser(String userID) async {
    var dbClient = await db;
    var result = await dbClient.query("USER");
    List<User> user = result.map((data) => User.fromMap(data)).toList();
    debugPrint(">>> local_db_service >>> getUser() >>> ${user[0].toString()}");
    return user[0];
  }

  @override
  Future<bool> sendMessage(Message message) async {
    var dbClient = await db;
    int id = await dbClient.rawInsert(
        'INSERT INTO MESSAGES(receiver, date, message, isMine, on_db) '
            'VALUES("${message.receiver}", "${message.date}", "${message.message}", "${message.isMine}", "false")');
    if(id != null)
      return true;
    return null;
  }

}
