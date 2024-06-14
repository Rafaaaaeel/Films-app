import 'package:article_app/src/features/home/domain/usecases/now_playing_movies_usecase.dart';
import 'package:article_app/src/features/home/domain/usecases/series_popular_usecase.dart';

abstract class MoviesState {
  const MoviesState();
}

class LoadingMoviesState extends MoviesState {}

class SucceededMoviesState extends MoviesState {
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

class FailedMoviesState extends MoviesState {
  final String message;

  const FailedMoviesState(this.message);
}
