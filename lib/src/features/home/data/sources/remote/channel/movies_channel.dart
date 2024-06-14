import 'package:article_app/src/core/shared/constants/network_constants.dart';
import 'package:article_app/src/features/home/data/models/movies_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'movies_channel.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class MoviesChannel {
  factory MoviesChannel(Dio dio) = _MoviesChannel;

  @GET("movie/{endpoint}")
  Future<HttpResponse<MoviesResponsModel>> fetchMovies({
    @Path('endpoint') required String endpoint,
    @Query('api_key') String? apiKey,
    @Query('language') String? language,
  });
}
