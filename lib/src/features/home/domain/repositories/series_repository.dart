import 'package:article_app/src/core/shared/exceptions/server_exception.dart';
import 'package:article_app/src/features/home/data/models/series/series_response_model.dart';
import 'package:dartz/dartz.dart';

abstract interface class SeriesRepository {
  Future<Either<Failure, SeriesResponseModel>> fetchSeries();
}
