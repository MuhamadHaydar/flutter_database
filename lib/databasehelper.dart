import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final _databaseName = 'Dog.db';
  static final _databaseVersion = 1;

  static final dogTable = 'dogs';

  static final columnId = '_id';
  static final columnName = 'name';
  static final columnAge = 'age';

  // make this a singleton class.
  DatabaseHelper._privateConstructor();

  // make an instance of the class with the private constructor.
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database.
  static Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // this openss the database (and creates it if it does'n exist)
  _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  //SQL code to create the database table.
  Future _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $dogTable( $columnId INTEGER PRIMARY KEY, $columnName TEXT NOT NULL, $columnAge INTEGER NOT NULL)');
  }

  //Helper Methods
  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.

  Future<int> insert(Map<String,dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(dogTable, row);
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Map<String,dynamic>>> queryAllRows ()async{
    Database db = await instance.database;
    return await db.query(dogTable);
  }


}
