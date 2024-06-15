import 'package:article_app/src/features/home/data/models/series/serie_model.dart';
import 'package:article_app/src/features/home/domain/entities/series/serie_response_entity.dart';

class SeriesResponseModel extends SerieResponseEntity {
  SeriesResponseModel(
      super.page, super.results, super.totalPages, super.totalResults);

  factory SeriesResponseModel.fromJson(Map<String, dynamic> json) {
    return SeriesResponseModel(
      json['page'],
      List<SerieModel>.from(
        json['results'].map(
          (movieJson) => SerieModel.fromJson(movieJson),
        ),
      ),
      json['total_pages'],
      json['total_results'],
    );
  }
}
