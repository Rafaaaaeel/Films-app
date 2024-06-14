import 'package:article_app/src/core/shared/settings/settings.dart';
import 'package:article_app/src/features/home/home_biding.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> injections(Settings settings) async {
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
  await binding(settings);
}
