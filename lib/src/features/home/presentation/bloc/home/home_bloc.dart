import 'package:article_app/src/core/shared/constants/network_constants.dart';
import 'package:article_app/src/features/home/domain/entities/movies/movie_entity.dart';
import 'package:article_app/src/features/home/domain/entities/movies/movie_params_entity.dart';
import 'package:article_app/src/features/home/domain/usecases/now_playing_movies_usecase.dart';
import 'package:article_app/src/features/home/domain/usecases/popular_usecase.dart';
import 'package:article_app/src/features/home/domain/usecases/series_popular_usecase.dart';
import 'package:article_app/src/features/home/domain/usecases/top_rated_movies_usecase.dart';
import 'package:article_app/src/features/home/domain/usecases/upcoming_movies_usecase.dart';
import 'package:article_app/src/features/home/presentation/bloc/home/home_event.dart';
import 'package:article_app/src/features/home/presentation/bloc/home/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomesState> {
  final NowPlayingMoviesUsecase _nowPlayingMoviesUsecase;
  final PopularMoviesUsecase _popularMoviesUsecase;
  final UpcomingMoviesUsecase _upcomingMoviesUsecase;
  final TopRatedMoviesUsecase _topRatedMoviesUsecase;
  final SeriesPopularUsecase _seriesPopularUsecase;

  HomeBloc(
    this._nowPlayingMoviesUsecase,
    this._popularMoviesUsecase,
    this._upcomingMoviesUsecase,
    this._topRatedMoviesUsecase,
    this._seriesPopularUsecase,
  ) : super(LoadingMoviesState()) {
    on<OnFetchingMoviesEvent>(_onFetchingMoviesEvent);
  }

  Future<void> _onFetchingMoviesEvent(
      OnFetchingMoviesEvent event, Emitter<HomesState> emmiter) async {
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

    final seriesPopular = await _seriesPopularUsecase.call(null);

    List<MovieEntity> nowPlayingResults = [];
    List<MovieEntity> popularResults = [];
    List<MovieEntity> upcomingResults = [];
    List<MovieEntity> topRatedResults = [];
    Series seriesPopularResults = [];

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

    seriesPopular.fold(
      (failure) {
        emmiter(
          FailedMoviesState(failure.message!),
        );
      },
      (data) {
        seriesPopularResults = data;
      },
    );

    emmiter(
      SucceededMoviesState(
        nowPlayingResults,
        popularResults,
        upcomingResults,
        topRatedResults,
        seriesPopularResults,
      ),
    );
  }

  // Future<void> _onAddToWatchListEvent(
  //     AddToWatchListEvent event, Emitter<HomesState> emitter) async {
  //   await _addShowToWatchListUsecase.call(event.show);

  //   emitter(SuccessAddingToWatchListState());
  // }

}
