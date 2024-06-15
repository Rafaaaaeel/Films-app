import 'package:article_app/src/features/home/data/models/watch_later/watch_later_model.dart';

abstract interface class WatchLaterRepository {
  Future<void> addToWatchList(WatchLaterModel show);
  Future<void> removeFromWatchList(int id);
}
