import 'package:article_app/src/core/network/constants/network_constants.dart';
import 'package:article_app/src/core/network/exceptions/server_exception.dart';
import 'package:article_app/src/features/movies/data/sources/remote/movies_channel.dart';
import 'package:article_app/src/features/movies/domain/entities/movie_params_entity.dart';
import 'package:article_app/src/features/movies/domain/entities/movies_response_entity.dart';
import 'package:article_app/src/features/movies/domain/repositories/movies_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class MoviesRepositotyImpl implements MoviesRepository {
  final MoviesChannel _moviesChannel;

  const MoviesRepositotyImpl(this._moviesChannel);

  @override
  Future<Either<Failure, MoviesReponseEntity>> fetchMovies(
      MovieParamasEntity params) async {
    try {
      final response = await _moviesChannel.fetchMovies(
        endpoint: params.endpoint,
        apiKey: apiKey,
        language: language,
      );

      return Right(response.data);
    } on DioException catch (e) {
      return Left(Failure(e.message, 500));
    }
  }
}
