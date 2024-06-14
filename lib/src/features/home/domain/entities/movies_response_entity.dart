import 'package:article_app/src/features/home/domain/entities/movie_entity.dart';

class MoviesReponseEntity {
  final int page;
  final List<MovieEntity> results;
  final int totalPages;
  final int totalResults;

  MoviesReponseEntity(
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  );
}
