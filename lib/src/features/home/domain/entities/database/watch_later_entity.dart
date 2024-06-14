import 'package:article_app/src/features/home/domain/entities/content/content_entity.dart';

class WatchLaterEntity extends ContentEntity {
  WatchLaterEntity(
    super.id,
    super.title,
    super.description,
    super.posterPath,
    super.backdropPath,
    super.genreIds,
    super.genreNames,
  );
}
