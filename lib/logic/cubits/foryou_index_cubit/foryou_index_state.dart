part of 'foryou_index_cubit.dart';

// ignore: must_be_immutable
abstract class ForyouIndexState extends Equatable {
  int? _index;

  int get index => _index!;
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class ForYouChangeIndex extends ForyouIndexState {
  int? _index;

  ForYouChangeIndex(this._index);

  @override
  int get index => _index!;

  @override
  List<Object> get props => [this._index!];
}
