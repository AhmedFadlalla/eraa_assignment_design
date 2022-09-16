import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
class DatabaseHelper {
  static final _databasename = "note.db";
  static final _databaseversion = 1;
  static final table = "note";
  static final columnID = "id";
  static final columnName1="title";
  static final columnName2="description";
  static Database? _database;
  // privateconstructor
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  Future<Database?> get databse async {
    if (_database != null) return _database;

    // create a database if one doesn't exist
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentdirecoty = await getApplicationDocumentsDirectory();
    String path = documentdirecoty.path+_databasename;
    return await openDatabase(path,
        version: _databaseversion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('CREATE TABLE $table('
        '$columnID INTEGER PRIMARY KEY AUTOINCREMENT,'
        ' $columnName1 TEXT, '
        '$columnName2 TEXT)');


  }

  Future <int?> insert(Map<String,dynamic> note ) async{
    Database? db = await instance.databse;
    return await db!.insert(table, note);
  }

  Future <int?> deleteTodo(int id) async{
    Database? db = await instance.databse;
    return await db?.delete(table, where: "id = ?", whereArgs: [id]);
  }

  Future <List<Map<String,dynamic>>> queryAll() async{
    Database? db = await instance.databse;
    return await db!.query(table);
  }

  Future<int> updateNote(Map<String,dynamic> note,id) async {
    Database? db = await instance.databse;
    var result = await db!.update(table, note,
        where: '$columnID = ?', whereArgs: [id]);
    return result;
  }




}