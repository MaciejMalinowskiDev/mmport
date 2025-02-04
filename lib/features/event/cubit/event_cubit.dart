import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:mmport/domain/models/event_model.dart';
import 'package:mmport/domain/repositories/event_repository.dart';

part 'event_state.dart';

class EventCubit extends Cubit<EventState> {
  EventCubit(this._itemsRepository) : super(const EventState());

 final ItemsRepository _itemsRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    _streamSubscription = _itemsRepository.getItemsStream()
        .listen(
      (items) {
        emit(EventState(items: items));
      },
    )..onError(
        (error) {
          emit(const EventState(loadingErrorOccured: true));
        },
      );
  }

  Future<void> remove({required String documentID}) async {
    try {
     await _itemsRepository.delete(id: documentID);
    } catch (error) {
      emit(
        const EventState(removingErrorOccured: true),
      );
      start();
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}