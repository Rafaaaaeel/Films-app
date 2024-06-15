import 'package:sqflite/sqflite.dart';

abstract class TableDatabase {
  late final String tableName;

  Future<void> createTable(Database db) async {
    await db.execute('''
        CREATE TABLE IF NOT EXISTS $tableName (
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
