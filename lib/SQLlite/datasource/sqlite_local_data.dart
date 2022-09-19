import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:spare_parts/SQLlite/models/sqlite_model.dart';
import 'package:sqflite/sqflite.dart';

class SQLiteLocalDb {
  Future<Database> init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path,"sqlitedata.db");

    return await openDatabase(
        path,
        version: 1,
        onCreate: (Database db,int version) async{
          await db.execute("""
          CREATE TABLE User(
          id TEXT PRIMARY KEY,
          fullName TEXT,
          phone TEXT,
          email TEXT,
          passwordHash TEXT,
          defaultPlateNumber TEXT
          )"""
          );
        });
  }

  Future<int> addUser(SQLiteModel user) async{ //returns number of items inserted as an integer
    final db = await init(); //open database

    return db.insert("User", user.toJson(), //toMap() function from MemoModel
      conflictAlgorithm: ConflictAlgorithm.ignore, //ignores conflicts due to duplicate entries
    );
  }

  Future<int> updateUsers(String id, Map<String, dynamic> update) async{ // returns the number of rows updated

    final db = await init();

    int result = await db.update(
        "User",
        update,
        where: "id = ?",
        whereArgs: [id]
    );
    return result;
  }

  Future deleteUsers() async {
    final db = await init();
    // return db.delete("delete from "+ TABLE_NAME);
    int deleted = await db.rawDelete("Delete from User");
    print(deleted);
    return deleted;
  }

  Future<List<SQLiteModel>> getAllUsers() async {

    final db = await init();
    final maps = await db.query("User");

    List<SQLiteModel> contents = [];

    // var dbClient = await db;
    // // specify the column names you want in the result set
    // List<Map> maps =
    // await dbClient.query(TABLE, columns: [ID, TITLE, URL, THUMBNAIL_URL]);
    // Albums allAlbums = Albums();
    // List<Album> albums = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        contents.add(SQLiteModel.fromJson(maps[i]));
      }
    }
    return contents;
  }

  Future<SQLiteModel> getUser() async{ //returns the memos as a list (array)

    final db = await init();
    final maps = await db.query("User"); //query all the rows in a table as an array of maps

    return SQLiteModel(
        id: maps[0]['id'].toString(),
        fullName: maps[0]['fullName'].toString(),
        phone: maps[0]['phone'].toString(),
        email: maps[0]['email'].toString(),
        passwordHash: maps[0]['passwordHash'].toString(),
        defaultPlateNumber: maps[0]['defaultPlateNumber'].toString()
    );
  }
}