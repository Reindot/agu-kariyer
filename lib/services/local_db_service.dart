import 'dart:async';

import 'package:agucareer/models/message_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

class LocalDBService {
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
    String path = databasesPath + '\\local.db';
    debugPrint("dp createdd >>>>>> " + path);
    return await openDatabase(path, onCreate: _onCreate, version: 1);
  }

  Future<FutureOr<void>> _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE MESSAGES "
        "(id INTEGER PRIMARY KEY,"
        "receiver TEXT, "
        "date TEXT, "
        "message TEXT, "
        "isMine TEXT, "
        "on_db TEXT);");
  }

  void getMessages() async {
    var dbClient = await db;
    var result = await dbClient.query("MESSAGES", orderBy: "date").asStream();
  }

  Future<int> sendMessage(Message message) async {
    var dbClient = await db;
    int id1 = await dbClient.rawInsert(
        'INSERT INTO MESSAGES(receiver, date, message, isMine, on_db) '
            'VALUES("${message.receiver}", "${message.date}", "${message.message}", "${message.isMine}", "false")');
    debugPrint("insterted into db >>>>>>>>$id1" );
    return id1;

  }
}
