import 'package:article_app/src/core/shared/database/tables/watch_later_table.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._();
  static Database? _database;

  DatabaseService._();

  factory DatabaseService() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    return _database = await _initialize();
  }

  Future<String> get fullPath async {
    const name = 'app_database.db';
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
    await WatchLaterTable().createTable(db);
  }
}
