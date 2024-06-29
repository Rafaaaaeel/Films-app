import 'package:article_app/src/features/home/domain/entities/database/watch_later_entity.dart';

abstract class WatchLaterEvent {
  const WatchLaterEvent();
}

class AddToWatchLaterList extends WatchLaterEvent {
  final WatchLaterEntity show;

  const AddToWatchLaterList({required this.show});
}

class RemoveFromWatchList extends WatchLaterEvent {
  final int id;

  const RemoveFromWatchList({required this.id});
}
