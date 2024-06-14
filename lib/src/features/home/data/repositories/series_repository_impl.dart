import 'package:article_app/src/core/shared/exceptions/server_exception.dart';
import 'package:article_app/src/features/home/data/models/series_response_model.dart';
import 'package:article_app/src/features/home/domain/repositories/series_repository.dart';
import 'package:dartz/dartz.dart';

class SeriesRepositoryImpl implements SeriesRepository {
  @override
  Future<Either<Failure, SeriesResponseModel>> fetchSeries() {
    // TODO: implement fetchSeries
    throw UnimplementedError();
  }

}