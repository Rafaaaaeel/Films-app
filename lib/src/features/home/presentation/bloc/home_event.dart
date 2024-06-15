import 'package:article_app/src/features/home/domain/entities/content/content_entity.dart';

abstract class HomeEvent {
  const HomeEvent();
}

class OnFetchingMoviesEvent extends HomeEvent { }

class AddToWatchListEvent extends HomeEvent {
  final ContentEntity show;

  AddToWatchListEvent(this.show);
}