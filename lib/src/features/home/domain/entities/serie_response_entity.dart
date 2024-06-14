import 'package:article_app/src/features/home/domain/entities/serie_entity.dart';

class SerieResponseEntity {
  final int page;
  final List<SerieEntity> results;
  final int totalPages;
  final int totalResults;

  SerieResponseEntity(
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  );
}