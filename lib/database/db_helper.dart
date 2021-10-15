import 'dart:io';

import 'sokhan_model.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static DbHelper dbHelper = DbHelper._();
  DbHelper._();
  Database? _database;
  static String dbName = "amiresokhan.db";
  static String table = "sokhan";
  static String colID = "id";
  // static String _colArabic = "arabic";
  // static String _colFarsi = "farsi";
  // static String _colRef = "refrence";
  static const String colFav = "favourit";

  Future<Database> get db async => _database ??= await _initDb();

  _initDb() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, dbName);
    bool dbExist = await databaseExists(path);
    if (dbExist) {
      // ignore: avoid_print
      print('db already exist');
      return await openDatabase(path);
    } else {
      try {
        // ignore: avoid_print
        print("creating a copy from assets...");
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}
      ByteData data = await rootBundle.load(join("assets", dbName));
      List<int> bytes =
          data.buffer.asInt8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
      // ignore: avoid_print
      print("db copied ...");
      return await openDatabase(path);
    }
  }

  Future<List<Sokhan>> getAllSokhan() async {
    Database _dbClient = await db;
    var allSokhan = await _dbClient.query(table, orderBy: colID);
    List<Sokhan> allSokhanList = allSokhan.isNotEmpty
        ? allSokhan.map((e) => Sokhan.fromMap(e)).toList()
        : [];
    return allSokhanList;
  }

  Future<List<Sokhan>> getAllFavSokhan() async {
    Database _dbClient = await db;
    var allFavSokhan =
        await _dbClient.rawQuery("SELECT * FROM $table WHERE $colFav=?", [1]);
    List<Sokhan> allFavSokhanList = allFavSokhan.isNotEmpty
        ? allFavSokhan.map((e) => Sokhan.fromMap(e)).toList()
        : [];
    return allFavSokhanList;
  }

  Future<int> updateFavSokhan(Sokhan sokhan) async {
    if (sokhan.favourit == 0) {
      sokhan.favourit = 1;
    } else {
      sokhan.favourit = 0;
    }
    Database _dbClient = await db;
    return await _dbClient
        .update(table, sokhan.toMap(), where: "id=?", whereArgs: [sokhan.id]);
  }
}
