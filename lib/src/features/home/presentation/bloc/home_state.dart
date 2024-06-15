import 'package:article_app/src/features/home/domain/usecases/now_playing_movies_usecase.dart';
import 'package:article_app/src/features/home/domain/usecases/series_popular_usecase.dart';

abstract class HomesState {
  const HomesState();
}

class LoadingMoviesState extends HomesState {}

class SucceededMoviesState extends HomesState {
  final Movies nowPlaying;
  final Movies popular;
  final Movies upcoming;
  final Movies topRated;
  final Series poularSeries;

  const SucceededMoviesState(
    this.nowPlaying,
    this.popular,
    this.upcoming,
    this.topRated,
    this.poularSeries,
  );
}

class FailedMoviesState extends HomesState {
  final String message;

  const FailedMoviesState(this.message);
}

class SuccessAddingToWatchListState extends HomesState {}