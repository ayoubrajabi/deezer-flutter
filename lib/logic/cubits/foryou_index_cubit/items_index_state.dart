part of 'items_index_cubit.dart';

// ignore: must_be_immutable
abstract class ItemsIndexState extends Equatable {
  int? _index;

  int get index => _index!;
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class ItemsIndex extends ItemsIndexState {
  int? _index;

  ItemsIndex(this._index);

  @override
  int get index => _index!;

  @override
  List<Object> get props => [this._index!];
}
