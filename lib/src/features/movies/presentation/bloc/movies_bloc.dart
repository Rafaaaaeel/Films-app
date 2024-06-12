import 'package:article_app/src/core/network/constants/network_constants.dart';
import 'package:article_app/src/features/movies/domain/entities/movie_entity.dart';
import 'package:article_app/src/features/movies/domain/entities/movie_params_entity.dart';
import 'package:article_app/src/features/movies/domain/usecases/now_playing_movies_usecase.dart';
import 'package:article_app/src/features/movies/domain/usecases/popular_usecase.dart';
import 'package:article_app/src/features/movies/domain/usecases/top_rated_movies_usecase.dart';
import 'package:article_app/src/features/movies/domain/usecases/upcoming_movies_usecase.dart';
import 'package:article_app/src/features/movies/presentation/bloc/movies_event.dart';
import 'package:article_app/src/features/movies/presentation/bloc/movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final NowPlayingMoviesUsecase _nowPlayingMoviesUsecase;
  final PopularMoviesUsecase _popularMoviesUsecase;
  final UpcomingMoviesUsecase _upcomingMoviesUsecase;
  final TopRatedMoviesUsecase _topRatedMoviesUsecase;

  MoviesBloc(this._nowPlayingMoviesUsecase, this._popularMoviesUsecase,
      this._upcomingMoviesUsecase, this._topRatedMoviesUsecase)
      : super(LoadingMoviesState()) {
    on<OnFetchingMoviesEvent>(_onFetchingMoviesEvent);
  }

  Future<void> _onFetchingMoviesEvent(
      OnFetchingMoviesEvent event, Emitter<MoviesState> emmiter) async {
    final nowPlayingMovies = await _nowPlayingMoviesUsecase.call(
      const MovieParamasEntity(nowPlaying),
    );

    final popularMovies = await _popularMoviesUsecase.call(
      const MovieParamasEntity(popular),
    );

    final upcomingMovies = await _upcomingMoviesUsecase.call(
      const MovieParamasEntity(upcoming),
    );

    final topRatedMovies = await _topRatedMoviesUsecase.call(
      const MovieParamasEntity(topRated),
    );

    List<MovieEntity> nowPlayingResults = [];
    List<MovieEntity> popularResults = [];
    List<MovieEntity> upcomingResults = [];
    List<MovieEntity> topRatedResults = [];

    nowPlayingMovies.fold(
      (failure) {
        emmiter(
          FailedMoviesState(failure.message!),
        );
      },
      (data) {
        nowPlayingResults = data;
      },
    );

    popularMovies.fold(
      (failure) {
        emmiter(
          FailedMoviesState(failure.message!),
        );
      },
      (data) {
        popularResults = data;
      },
    );

    upcomingMovies.fold(
      (failure) {
        emmiter(
          FailedMoviesState(failure.message!),
        );
      },
      (data) {
        upcomingResults = data;
      },
    );

    topRatedMovies.fold(
      (failure) {
        emmiter(
          FailedMoviesState(failure.message!),
        );
      },
      (data) {
        topRatedResults = data;
      },
    );

    emmiter(
      SucceededMoviesState(
        nowPlayingResults,
        popularResults,
        upcomingResults,
        topRatedResults,
      ),
    );
  }
}
