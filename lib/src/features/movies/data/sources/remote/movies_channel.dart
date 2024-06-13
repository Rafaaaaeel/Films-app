import 'package:article_app/src/core/network/constants/network_constants.dart';
import 'package:article_app/src/core/network/exceptions/server_exception.dart';
import 'package:article_app/src/core/shared/settings/settings.dart';
import 'package:article_app/src/features/movies/data/models/movies_response_model.dart';
import 'package:article_app/src/features/movies/domain/entities/movie_params_entity.dart';
import 'package:article_app/src/features/movies/domain/entities/movies_response_entity.dart';
import 'package:dartz/dartz.dart';
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

class MoviesChannelDataSource {
  final Settings _settings;
  final MoviesChannel _moviesChannel;

  MoviesChannelDataSource(this._moviesChannel, this._settings);

  Future<Either<Failure, MoviesReponseEntity>> fetchMovies(
      MovieParamasEntity params) async {
    try {
      final response = await _moviesChannel.fetchMovies(
        endpoint: params.endpoint,
        apiKey: _settings.apiKey,
        language: _settings.language,
      );

      return Right(response.data);
    } on DioException catch (e) {
      return Left(Failure(e.message, 500));
    }
  }
}
