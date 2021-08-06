import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'items_index_state.dart';

class ItemsIndexCubit extends Cubit<ItemsIndexState> {
  ItemsIndexCubit() : super(ItemsIndex(0));

  void itemsIndex(int index) => emit(ItemsIndex(index));
}
