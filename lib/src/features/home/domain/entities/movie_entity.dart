import 'package:article_app/src/features/home/domain/entities/content_entity.dart';

class MovieEntity extends ContentEntity {
  MovieEntity(super.id, super.title, super.description, super.posterPath,
      super.backdropPath, super.genreIds, super.genreNames);
}
