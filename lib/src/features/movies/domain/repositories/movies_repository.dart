import 'package:article_app/src/core/network/exceptions/server_exception.dart';
import 'package:article_app/src/features/movies/domain/entities/movie_params_entity.dart';
import 'package:article_app/src/features/movies/domain/entities/movies_response_entity.dart';
import 'package:dartz/dartz.dart';

abstract interface class MoviesRepository {
  Future<Either<Failure, MoviesReponseEntity>> fetchMovies(
      MovieParamasEntity params);
}
