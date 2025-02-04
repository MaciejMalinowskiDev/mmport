part of 'event_cubit.dart';

class EventState {
  const EventState({
    this.items = const[],
    this.loadingErrorOccured = false,
    this.removingErrorOccured = false,
  });
  final List<ItemModel> items;
  final bool loadingErrorOccured;
  final bool removingErrorOccured;
}