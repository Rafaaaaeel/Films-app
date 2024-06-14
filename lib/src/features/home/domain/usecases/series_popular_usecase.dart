import 'package:article_app/src/core/shared/exceptions/server_exception.dart';
import 'package:article_app/src/core/utils/usecase.dart';
import 'package:article_app/src/features/home/domain/entities/series/serie_entity.dart';
import 'package:article_app/src/features/home/domain/repositories/series_repository.dart';
import 'package:dartz/dartz.dart';

typedef Series = List<SerieEntity>;

class SeriesPopularUsecase implements Usecase<Series, void> {
  final SeriesRepository _repository;

  const SeriesPopularUsecase(this._repository);

  @override
  Future<Either<Failure, Series>> call(void params) async {
    final response = await _repository.fetchSeries();

    return response.fold(
      (l) => left(l),
      (r) => right(r.results),
    );
  }
}
