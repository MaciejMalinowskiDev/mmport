import 'package:bloc/bloc.dart';
import 'package:mmport/domain/models/event_model.dart';
import 'package:mmport/domain/repositories/event_repository.dart';


part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit(this._itemsRepository) : super(DetailsState(itemModel: null));

  final ItemsRepository _itemsRepository;

  Future<void> getItemswithID(String id) async {
    // ignore: non_constant_identifier_names
    final ItemModel = await _itemsRepository.get(id: id);
    emit(DetailsState(itemModel: ItemModel));
  }
}
