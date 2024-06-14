import 'package:article_app/src/core/shared/exceptions/server_exception.dart';
import 'package:article_app/src/core/shared/settings/settings.dart';
import 'package:article_app/src/features/home/data/sources/remote/channel/movies_channel.dart';
import 'package:article_app/src/features/home/domain/entities/movies/movie_params_entity.dart';
import 'package:article_app/src/features/home/domain/entities/movies/movies_response_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class MoviesChannelDataSource {
  final Settings _settings;
  final MoviesChannel _moviesChannel;

  MoviesChannelDataSource(this._moviesChannel, this._settings);

  Future<Either<Failure, MoviesReponseEntity>> fetchMovies(
      MovieParamasEntity params) async {
    try {
      final response = await _moviesChannel.fetchMovies(
        endpoint: params.endpoint,
        apiKey: _settings.apiKey,
        language: _settings.language,
      );

      return Right(response.data);
    } on DioException catch (e) {
      return Left(Failure(e.message, 500));
    }
  }
}
