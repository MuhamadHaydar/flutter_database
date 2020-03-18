import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DatabaseHelper{
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

}