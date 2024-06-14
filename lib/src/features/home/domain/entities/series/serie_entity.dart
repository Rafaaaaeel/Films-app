import 'package:article_app/src/features/home/domain/entities/content/content_entity.dart';

class SerieEntity extends ContentEntity {
  SerieEntity(
    super.id,
    super.title,
    super.description,
    super.posterPath,
    super.backdropPath,
    super.genreIds,
    super.genreNames,
  );
}
