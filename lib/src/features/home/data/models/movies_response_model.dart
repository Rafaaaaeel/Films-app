import 'package:article_app/src/features/home/data/models/movie_model.dart';
import 'package:article_app/src/features/home/domain/entities/movies/movies_response_entity.dart';

class MoviesResponsModel extends MoviesReponseEntity {
  MoviesResponsModel(
      super.page, super.results, super.totalPages, super.totalResults);

  factory MoviesResponsModel.fromJson(Map<String, dynamic> json) {
    return MoviesResponsModel(
      json['page'],
      List<MovieModel>.from(
        json['results'].map(
          (movieJson) => MovieModel.fromJson(movieJson),
        ),
      ),
      json['total_pages'],
      json['total_results'],
    );
  }
}
