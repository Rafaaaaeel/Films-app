import 'package:article_app/src/core/shared/database/database_service.dart';
import 'package:article_app/src/core/shared/settings/settings.dart';
import 'package:article_app/src/core/utils/injections/injections.dart';
import 'package:article_app/src/features/home/data/repositories/movies_repository_impl.dart';
import 'package:article_app/src/features/home/data/repositories/series_repository_impl.dart';
import 'package:article_app/src/features/home/data/repositories/watch_later_repository_impl.dart';
import 'package:article_app/src/features/home/data/sources/local/movies_local_datasource.dart';
import 'package:article_app/src/features/home/data/sources/local/series_local_datasource.dart';
import 'package:article_app/src/features/home/data/sources/remote/channel/movies_channel.dart';
import 'package:article_app/src/features/home/data/sources/remote/channel/series_channel.dart';
import 'package:article_app/src/features/home/data/sources/remote/movies_channel_datasource.dart';
import 'package:article_app/src/features/home/data/sources/remote/series_channel_datasource.dart';
import 'package:article_app/src/features/home/domain/repositories/movies_repository.dart';
import 'package:article_app/src/features/home/domain/repositories/series_repository.dart';
import 'package:article_app/src/features/home/domain/repositories/watch_later_repository.dart';
import 'package:article_app/src/features/home/domain/usecases/add_show_to_watch_list_usecase.dart';
import 'package:article_app/src/features/home/domain/usecases/now_playing_movies_usecase.dart';
import 'package:article_app/src/features/home/domain/usecases/popular_usecase.dart';
import 'package:article_app/src/features/home/domain/usecases/series_popular_usecase.dart';
import 'package:article_app/src/features/home/domain/usecases/top_rated_movies_usecase.dart';
import 'package:article_app/src/features/home/domain/usecases/upcoming_movies_usecase.dart';
import 'package:article_app/src/features/home/presentation/bloc/home/home_bloc.dart';

Future<void> binding(Settings settings) async {
  sl.registerSingleton<MoviesChannel>(MoviesChannel(sl()));
  sl.registerSingleton<SeriesChannel>(SeriesChannel(sl()));
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

  sl.registerSingleton<SeriesChannelDatasource>(SeriesChannelDatasource(
    sl(),
    settings,
  ));
  sl.registerSingleton<SeriesLocalDatasource>(SeriesLocalDatasource());
  sl.registerSingleton<SeriesRepository>(
    SeriesRepositoryImpl(
      sl(),
      sl(),
      settings,
    ),
  );

  sl.registerSingleton<WatchLaterRepository>(
    WatchLaterRepositoryImpl(DatabaseService()),
  );
  sl.registerSingleton<NowPlayingMoviesUsecase>(NowPlayingMoviesUsecase(sl()));
  sl.registerSingleton<PopularMoviesUsecase>(PopularMoviesUsecase(sl()));
  sl.registerSingleton<TopRatedMoviesUsecase>(TopRatedMoviesUsecase(sl()));
  sl.registerSingleton<UpcomingMoviesUsecase>(UpcomingMoviesUsecase(sl()));
  sl.registerSingleton<SeriesPopularUsecase>(SeriesPopularUsecase(sl()));
  sl.registerSingleton<AddShowToWatchListUsecase>(
      AddShowToWatchListUsecase(sl()));
  sl.registerFactory(
    () => HomeBloc(
      sl(),
      sl(),
      sl(),
      sl(),
      sl(),
    ),
  );
}
