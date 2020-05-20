import 'dart:async';

import 'package:agucareer/models/chats_model.dart';
import 'package:agucareer/models/message_model.dart';
import 'package:agucareer/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteDBService {
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
    var databasesPath = await getDatabasesPath();
    String path = databasesPath + '\\demo.db';
    debugPrint("dp createdd >>>>>> " +  path);
    return await openDatabase(path, onCreate: _onCreate, version: 1);
  }

  Future<FutureOr<void>> _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE MESSAGES"
            "(to TEXT PRIMARY KEY, "
            "date TIMESTAMP, "
            "message TEXT, "
            "isMine TEXT, "
            "on_db TEXT)");
  }

  /*
  @override
  Stream<List<Message>> getMessages(String fromID, String toID) {
    var dbClient = db;
    var result =  dbClient.query("MESSAGES", orderBy: "date").asStream();
    return result.map((messageList) =>
        messageList.documents.map((m) => Message.fromMap(m.data)).toList());

  }
  */

}
