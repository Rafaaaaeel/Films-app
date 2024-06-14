import 'package:article_app/src/core/shared/exceptions/server_exception.dart';
import 'package:article_app/src/core/shared/settings/settings.dart';
import 'package:article_app/src/features/home/data/models/series_response_model.dart';
import 'package:article_app/src/features/home/data/sources/local/series_local_datasource.dart';
import 'package:article_app/src/features/home/data/sources/remote/series_channel_datasource.dart';
import 'package:article_app/src/features/home/domain/repositories/series_repository.dart';
import 'package:dartz/dartz.dart';

class SeriesRepositoryImpl implements SeriesRepository {
  final SeriesChannelDatasource _seriesChannelDatasource;
  final SeriesLocalDatasource _seriesLocalDatasource;
  final Settings _settings;

  SeriesRepositoryImpl(this._seriesChannelDatasource,
      this._seriesLocalDatasource, this._settings);
  @override
  Future<Either<Failure, SeriesResponseModel>> fetchSeries() async {
    return await _settings.selectRepository(
      local: () => _seriesLocalDatasource.fetchMovies(),
      remote: () => _seriesChannelDatasource.fetchMovies(),
    );
  }
}
