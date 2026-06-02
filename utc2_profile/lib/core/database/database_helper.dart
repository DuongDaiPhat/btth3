import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const _databaseName = "profile_app.db";
  static const _databaseVersion = 2; // Incremented version

  static const tableAboutMe = 'about_me';
  static const tableSkill = 'skill';
  static const tableLanguage = 'language';
  static const tableWorkExperience = 'work_experience';
  static const tableEducation = 'education';
  static const tableAppreciation = 'appreciation';

  static const columnId = 'id';
  static const columnTitle = 'title'; // for work, edu, app
  static const columnDescription = 'description'; // for about, work, edu, app
  static const columnName = 'name'; // for skill, language

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
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $tableAboutMe (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnDescription TEXT NOT NULL
          )
          ''');

    await db.execute('''
          CREATE TABLE $tableSkill (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnName TEXT NOT NULL
          )
          ''');

    await db.execute('''
          CREATE TABLE $tableLanguage (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnName TEXT NOT NULL
          )
          ''');

    final profileItemTables = [tableWorkExperience, tableEducation, tableAppreciation];
    for (var table in profileItemTables) {
      await db.execute('''
            CREATE TABLE $table (
              $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
              $columnTitle TEXT NOT NULL,
              $columnDescription TEXT NOT NULL
            )
            ''');
    }
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    await db.execute('DROP TABLE IF EXISTS $tableAboutMe');
    await db.execute('DROP TABLE IF EXISTS $tableSkill');
    await db.execute('DROP TABLE IF EXISTS $tableLanguage');
    await db.execute('DROP TABLE IF EXISTS $tableWorkExperience');
    await db.execute('DROP TABLE IF EXISTS $tableEducation');
    await db.execute('DROP TABLE IF EXISTS $tableAppreciation');
    await _onCreate(db, newVersion);
  }
}
