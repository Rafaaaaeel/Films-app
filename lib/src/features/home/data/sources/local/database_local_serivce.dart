import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseLocalService {
  static final DatabaseLocalService _instance = DatabaseLocalService._();
  static Database? _database;

  DatabaseLocalService._();

  factory DatabaseLocalService() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    return _database = await _initialize();
  }

  Future<String> get fullPath async {
    const name = 'app_database.dbb';
    final path = await getDatabasesPath();
    return join(path, name);
  }

  Future<Database> _initialize() async {
    String path = await fullPath;

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      singleInstance: true,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE watch_later (
        id INTEGER PRIMARY KEY,
        title TEXT,
        description TEXT,
        posterPath TEXT,
        backdropPath TEXT,
        genreIds TEXT,
        genreNames TEXT
      )
    ''');
  }
}
