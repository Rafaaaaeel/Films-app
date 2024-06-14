import 'package:article_app/src/core/shared/exceptions/server_exception.dart';
import 'package:article_app/src/core/shared/settings/settings.dart';
import 'package:article_app/src/features/home/data/models/series_response_model.dart';
import 'package:article_app/src/features/home/data/sources/remote/channel/series_channel.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SeriesChannelDatasource {
  final Settings _settings;
  final SeriesChannel _seriesChannel;

  const SeriesChannelDatasource(this._seriesChannel, this._settings);

  Future<Either<Failure, SeriesResponseModel>> fetchMovies() async {
    try {
      final response = await _seriesChannel.fetchSeries(
        apiKey: _settings.apiKey,
        sorted: 'popular',
      );

      return Right(response.data);
    } on DioException catch (e) {
      return Left(Failure(e.message!, 500));
    }
  }
}
