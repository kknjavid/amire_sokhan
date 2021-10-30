import 'dart:io';

import 'sokhan_model.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static DbHelper dbHelper = DbHelper._();
  DbHelper._();
  Database? _database;
  static const String _dbName = "amiresokhan.db";
  static const String _table = "sokhan";
  static const String _colID = "id";
  static const String _colArabic = "arabic";
  static const String _colFarsi = "farsi";
  // static String _colRef = "refrence";
  static const String _colFav = "favourit";

  Future<Database> get _db async => _database ??= await _initDb();

  _initDb() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, _dbName);
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
      ByteData data = await rootBundle.load(join("assets", _dbName));
      List<int> bytes =
          data.buffer.asInt8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
      // ignore: avoid_print
      print("db copied ...");
      return await openDatabase(path);
    }
  }

  Future<List<Sokhan>> getAllSokhan() async {
    Database _dbClient = await _db;
    var allSokhan = await _dbClient.query(_table, orderBy: _colID);
    List<Sokhan> allSokhanList = allSokhan.isNotEmpty
        ? allSokhan.map((e) => Sokhan.fromMap(e)).toList()
        : [];
    return allSokhanList;
  }

  Future<List<Sokhan>> getAllFavSokhan() async {
    Database _dbClient = await _db;
    var allFavSokhan =
        await _dbClient.rawQuery("SELECT * FROM $_table WHERE $_colFav=?", [1]);
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
    Database _dbClient = await _db;
    return await _dbClient
        .update(_table, sokhan.toMap(), where: "id=?", whereArgs: [sokhan.id]);
  }

  Future<List<Sokhan>> searchInAllSokhan(String query) async {
    Database _dbClient = await _db;
    var res = await _dbClient.query(_table,
        where: "$_colArabic LIKE ? OR $_colFarsi LIKE ?",
        whereArgs: ['%$query%','%$query%']);
    List<Sokhan> allResult =
        res.isNotEmpty ? res.map((e) => Sokhan.fromMap(e)).toList() : [];
    return allResult;
  }
}
