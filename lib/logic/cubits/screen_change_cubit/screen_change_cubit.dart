import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'screen_change_state.dart';

class ScreenChangeCubit extends Cubit<ScreenChangeState> {
  ScreenChangeCubit() : super(ScreenChangeIndex(0));

  void screenChanegeIndex(int index) => emit(ScreenChangeIndex(index));
}
