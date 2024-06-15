import 'package:article_app/src/core/shared/database/database_service.dart';
import 'package:article_app/src/core/shared/database/tables/watch_later_table.dart';
import 'package:article_app/src/features/home/data/models/watch_later/watch_later_model.dart';
import 'package:article_app/src/features/home/domain/repositories/watch_later_repository.dart';
import 'package:sqflite/sqflite.dart';

class WatchLaterRepositoryImpl implements WatchLaterRepository {
  final DatabaseService _databaseService;

  const WatchLaterRepositoryImpl(this._databaseService);

  @override
  Future<void> addToWatchList(WatchLaterModel show) async {
    final db = await _databaseService.database;
    db.insert(
      WatchLaterTable().tableName,
      show.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> removeFromWatchList(int id) async {
    final db = await _databaseService.database;
    await db.delete(
      WatchLaterTable().tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
