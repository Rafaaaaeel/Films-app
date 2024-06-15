import 'package:article_app/src/features/home/domain/repositories/watch_later_repository.dart';

class RemoveShowFromWatchListUsecase {
  final WatchLaterRepository _watchLaterRepository;

  const RemoveShowFromWatchListUsecase(this._watchLaterRepository);

  Future<void> call(int param) async {
    await _watchLaterRepository.removeFromWatchList(param);
  }
}
