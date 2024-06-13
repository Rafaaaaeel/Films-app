import 'package:article_app/main.dart';
import 'package:article_app/src/core/utils/injections/injections.dart';
import 'package:article_app/src/features/movies/data/repositories/movies_repository_impl.dart';
import 'package:article_app/src/features/movies/data/sources/local/movies_local_datasource.dart';
import 'package:article_app/src/features/movies/data/sources/remote/movies_channel.dart';
import 'package:article_app/src/features/movies/domain/repositories/movies_repository.dart';
import 'package:article_app/src/features/movies/domain/usecases/now_playing_movies_usecase.dart';
import 'package:article_app/src/features/movies/domain/usecases/popular_usecase.dart';
import 'package:article_app/src/features/movies/domain/usecases/top_rated_movies_usecase.dart';
import 'package:article_app/src/features/movies/domain/usecases/upcoming_movies_usecase.dart';
import 'package:article_app/src/features/movies/presentation/bloc/movies_bloc.dart';

Future<void> binding() async {
  sl.registerSingleton<MoviesChannel>(MoviesChannel(sl()));

  sl.registerSingleton<MoviesChannelDataSource>(
    MoviesChannelDataSource(sl(), settings),
  );
  sl.registerSingleton<MoviesLocalDataSource>(MoviesLocalDataSource());
  sl.registerSingleton<MoviesRepository>(
    MoviesRepositotyImpl(
      sl(),
      sl(),
      sl(),
    ),
  );
  sl.registerSingleton<NowPlayingMoviesUsecase>(NowPlayingMoviesUsecase(sl()));
  sl.registerSingleton<PopularMoviesUsecase>(PopularMoviesUsecase(sl()));
  sl.registerSingleton<TopRatedMoviesUsecase>(TopRatedMoviesUsecase(sl()));
  sl.registerSingleton<UpcomingMoviesUsecase>(UpcomingMoviesUsecase(sl()));
  sl.registerFactory(
    () => MoviesBloc(
      sl(),
      sl(),
      sl(),
      sl(),
    ),
  );
}
