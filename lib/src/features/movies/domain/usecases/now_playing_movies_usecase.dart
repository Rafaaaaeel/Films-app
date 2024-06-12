import 'package:article_app/src/core/network/exceptions/server_exception.dart';
import 'package:article_app/src/core/utils/usecase.dart';
import 'package:article_app/src/features/movies/domain/entities/movie_entity.dart';
import 'package:article_app/src/features/movies/domain/entities/movie_params_entity.dart';
import 'package:article_app/src/features/movies/domain/repositories/movies_repository.dart';
import 'package:dartz/dartz.dart';

typedef Movies = List<MovieEntity>;

class NowPlayingMoviesUsecase implements Usecase<Movies, MovieParamasEntity> {
  final MoviesRepository _repository;

  const NowPlayingMoviesUsecase(this._repository);

  @override
  Future<Either<Failure, Movies>> call(MovieParamasEntity params) async {
    final response = await _repository.fetchMovies(params);

    return response.fold(
      (l) => left(l),
      (r) => right(r.results),
    );
  }
}
