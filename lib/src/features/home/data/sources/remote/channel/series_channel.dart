import 'package:article_app/src/core/shared/constants/network_constants.dart';
import 'package:article_app/src/features/home/data/models/series_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'series_channel.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class SeriesChannel {
  factory SeriesChannel(Dio dio) = _SeriesChannel;

  @GET("discover/tv")
  Future<HttpResponse<SeriesResponseModel>> fetchSeries({
    @Query('api_key') String? apiKey,
    @Query('sort_by') required String sorted,
    @Query('language') String? language,
  });
}
