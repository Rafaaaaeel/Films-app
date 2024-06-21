import 'package:article_app/src/features/home/domain/entities/content/content_entity.dart';

abstract class WatchLaterEvent {
  const WatchLaterEvent();
}

class AddToWatchListEvent extends WatchLaterEvent {
  final ContentEntity show;

  AddToWatchListEvent(this.show);
}
