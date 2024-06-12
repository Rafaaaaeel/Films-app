import 'package:article_app/src/core/network/exceptions/server_exception.dart';
import 'package:article_app/src/core/utils/usecase.dart';
import 'package:article_app/src/features/movies/domain/entities/movie_params_entity.dart';
import 'package:article_app/src/features/movies/domain/repositories/movies_repository.dart';
import 'package:article_app/src/features/movies/domain/usecases/now_playing_movies_usecase.dart';
import 'package:dartz/dartz.dart';

class UpcomingMoviesUsecase implements Usecase<Movies, MovieParamasEntity> {
  final MoviesRepository _repository;

  const UpcomingMoviesUsecase(this._repository);

  @override
  Future<Either<Failure, Movies>> call(MovieParamasEntity params) async {
    final response = await _repository.fetchMovies(params);

    return response.fold(
      (l) => left(l),
      (r) => right(r.results),
    );
  }
}
