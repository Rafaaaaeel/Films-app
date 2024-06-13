import 'package:article_app/src/core/network/exceptions/server_exception.dart';
import 'package:dartz/dartz.dart';

abstract class Settings {
  String get repository;

  late final String apiKey;
  late final String language;

  Future<Either<Failure, T>> selectRepository<T>(
      {required Future<Either<Failure, T>> Function() local,
      required Future<Either<Failure, T>> Function() remote}) async {
    if (repository == 'mock') {
      return local();
    } else {
      return remote();
    }
  }
}

class MockSettings extends Settings {
  @override
  String get repository => "mock";
}

class ProdSettings extends Settings {
  final String apiKey;
  final String language;

  @override
  String get repository => "prod";

  ProdSettings({required this.apiKey, required this.language});
}
