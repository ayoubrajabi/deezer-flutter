part of 'screen_change_cubit.dart';

// ignore: must_be_immutable
abstract class ScreenChangeState extends Equatable {
  int? _index;

  int get index => _index!;
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class ScreenChangeIndex extends ScreenChangeState {
  int? _index;

  ScreenChangeIndex(this._index);

  @override
  int get index => _index!;

  @override
  List<Object> get props => [this._index!];
}
