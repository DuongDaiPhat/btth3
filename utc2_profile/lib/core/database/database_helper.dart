import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const _databaseName = "profile_app.db";
  static const _databaseVersion = 1;

  static const tableAboutMe = 'about_me';
  static const tableSkill = 'skill';

  static const columnId = 'id';
  static const columnTitle = 'title';
  static const columnDescription = 'description';

  static const columnName = 'name'; // for skill
  static const columnProficiency = 'proficiency'; // Optional, but good to have

  // Make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $tableAboutMe (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnTitle TEXT NOT NULL,
            $columnDescription TEXT NOT NULL
          )
          ''');

    await db.execute('''
          CREATE TABLE $tableSkill (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnName TEXT NOT NULL
          )
          ''');
  }
}
