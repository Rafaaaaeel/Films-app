import 'package:article_app/src/features/movies/movies_biding.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> injections() async {
  Dio dio = Dio();

  dio.interceptors.add(LogInterceptor(
    request: true,
    requestHeader: false,
    requestBody: false,
    responseHeader: false,
    responseBody: true,
    error: true,
  ));

  sl.registerSingleton<Dio>(dio);
  await binding();
}
