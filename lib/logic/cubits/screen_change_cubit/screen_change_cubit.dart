import 'package:bloc/bloc.dart';

class ScreenChangeCubit extends Cubit<int> {
  ScreenChangeCubit() : super(0);

  void screenChanegeIndex(int index) => emit(index);
}
