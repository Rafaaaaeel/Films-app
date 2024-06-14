import 'package:article_app/src/core/shared/exceptions/server_exception.dart';
import 'package:article_app/src/features/home/domain/entities/movie_params_entity.dart';
import 'package:article_app/src/features/home/domain/entities/movies_response_entity.dart';
import 'package:dartz/dartz.dart';

abstract interface class MoviesRepository {
  Future<Either<Failure, MoviesReponseEntity>> fetchMovies(
      MovieParamasEntity params);
}
