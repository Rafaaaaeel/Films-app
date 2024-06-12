import 'package:article_app/src/features/movies/domain/entities/content_entity.dart';

class MovieEntity extends ContentEntity {
  MovieEntity(super.id, super.title, super.posterPath, super.backdropPath,
      super.genreIds, super.genreNames);
}
