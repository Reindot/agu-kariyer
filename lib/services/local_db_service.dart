import 'dart:async';

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
    debugPrint("dp createdd >>>>>> " +  path);
    return await openDatabase(path, onCreate: _onCreate, version: 1);
  }

  Future<FutureOr<void>> _onCreate(Database db, int version) async {

    await db.execute(
        "CREATE TABLE MESSAGES "
            "(toW TEXT PRIMARY KEY, "
            "date TEXT, "
            "message TEXT, "
            "isMine TEXT, "
            "on_db TEXT);");


  }


  void getMessages() async{
    var dbClient = await db;
    var result =  await dbClient.query("MESSAGES", orderBy: "date").asStream();

  }


}
