import 'package:article_app/src/core/shared/settings/settings.dart';
import 'package:article_app/src/core/utils/injections/injections.dart';
import 'package:article_app/src/features/home/data/repositories/movies_repository_impl.dart';
import 'package:article_app/src/features/home/data/sources/local/movies_local_datasource.dart';
import 'package:article_app/src/features/home/data/sources/remote/movies_channel_datasource.dart';
import 'package:article_app/src/features/home/domain/repositories/movies_repository.dart';
import 'package:article_app/src/features/home/domain/usecases/now_playing_movies_usecase.dart';
import 'package:article_app/src/features/home/domain/usecases/popular_usecase.dart';
import 'package:article_app/src/features/home/domain/usecases/top_rated_movies_usecase.dart';
import 'package:article_app/src/features/home/domain/usecases/upcoming_movies_usecase.dart';
import 'package:article_app/src/features/home/presentation/bloc/movies_bloc.dart';

Future<void> binding(Settings settings) async {
  sl.registerSingleton<MoviesChannel>(MoviesChannel(sl()));

  sl.registerSingleton<MoviesChannelDataSource>(
    MoviesChannelDataSource(sl(), settings),
  );
  sl.registerSingleton<MoviesLocalDataSource>(MoviesLocalDataSource());
  sl.registerSingleton<MoviesRepository>(
    MoviesRepositotyImpl(
      settings,
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
