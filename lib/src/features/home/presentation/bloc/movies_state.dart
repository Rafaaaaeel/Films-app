import 'package:article_app/src/features/home/domain/entities/movie_entity.dart';

abstract class MoviesState {
  const MoviesState();
}

class LoadingMoviesState extends MoviesState {}

class SucceededMoviesState extends MoviesState {
  final List<MovieEntity> nowPlaying;
  final List<MovieEntity> popular;
  final List<MovieEntity> upcoming;
  final List<MovieEntity> topRated;

  const SucceededMoviesState(
    this.nowPlaying,
    this.popular,
    this.upcoming,
    this.topRated,
  );
}

class FailedMoviesState extends MoviesState {
  final String message;

  const FailedMoviesState(this.message);
}
