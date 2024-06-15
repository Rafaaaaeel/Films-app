import 'package:article_app/src/features/home/data/models/watch_later/watch_later_model.dart';
import 'package:article_app/src/features/home/domain/entities/content/content_entity.dart';
import 'package:article_app/src/features/home/domain/repositories/watch_later_repository.dart';

class AddShowToWatchListUsecase {
  final WatchLaterRepository _watchLaterRepository;

  const AddShowToWatchListUsecase(this._watchLaterRepository);

  Future<void> call(ContentEntity param) async {
    await _watchLaterRepository.addToWatchList(
      WatchLaterModel(
        param.id,
        param.title,
        param.description,
        param.posterPath,
        param.backdropPath,
        param.genreIds,
        param.genreNames,
      ),
    );
  }
}
