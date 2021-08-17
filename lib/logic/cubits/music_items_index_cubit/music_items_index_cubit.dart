import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'miniplayer_state.dart';

class MusicItemIndexCubit extends Cubit<int> {
  MusicItemIndexCubit() : super(0);

  void musicIndex(int index) => emit(index);
}
