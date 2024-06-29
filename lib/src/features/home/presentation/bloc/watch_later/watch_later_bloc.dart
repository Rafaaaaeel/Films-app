import 'package:article_app/src/features/home/domain/usecases/add_show_to_watch_list_usecase.dart';
import 'package:article_app/src/features/home/domain/usecases/remove_show_from_watch_list_usecase.dart';
import 'package:article_app/src/features/home/presentation/bloc/watch_later/watch_later_state.dart';
import 'package:article_app/src/features/watch_later/presentation/bloc/watch_later_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WatchLaterBloc extends Bloc<WatchLaterEvent, WatchLaterState> {
  final RemoveShowFromWatchListUsecase _removeShowFromWatchListUsecase;
  final AddShowToWatchListUsecase _addShowToWatchListUsecase;

  WatchLaterBloc(
    this._addShowToWatchListUsecase,
    this._removeShowFromWatchListUsecase,
  ) : super(WatchLaterInitial());
}
