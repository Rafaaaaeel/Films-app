import 'package:article_app/src/core/network/exceptions/server_exception.dart';
import 'package:dartz/dartz.dart';

abstract interface class Usecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
