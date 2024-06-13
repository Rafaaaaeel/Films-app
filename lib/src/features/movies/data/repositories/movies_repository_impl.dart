import 'package:article_app/src/core/network/exceptions/server_exception.dart';
import 'package:article_app/src/core/shared/settings/settings.dart';
import 'package:article_app/src/features/movies/data/sources/local/movies_local_datasource.dart';
import 'package:article_app/src/features/movies/data/sources/remote/movies_channel.dart';
import 'package:article_app/src/features/movies/domain/entities/movie_params_entity.dart';
import 'package:article_app/src/features/movies/domain/entities/movies_response_entity.dart';
import 'package:article_app/src/features/movies/domain/repositories/movies_repository.dart';
import 'package:dartz/dartz.dart';

class MoviesRepositotyImpl implements MoviesRepository {
  final Settings _settings;
  final MoviesChannelDataSource _moviesChannelDataSource;
  final MoviesLocalDataSource _moviesLocalDataSource;

  const MoviesRepositotyImpl(
    this._settings,
    this._moviesChannelDataSource,
    this._moviesLocalDataSource,
  );

  @override
  Future<Either<Failure, MoviesReponseEntity>> fetchMovies(
      MovieParamasEntity params) async {
    return await _settings.selectRepository(
      local: () => _moviesLocalDataSource.fetchMovies(),
      remote: () => _moviesChannelDataSource.fetchMovies(params),
    );
  }
}
