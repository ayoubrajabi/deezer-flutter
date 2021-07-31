import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'foryou_index_state.dart';

class ForyouIndexCubit extends Cubit<ForyouIndexState> {
  ForyouIndexCubit() : super(ForYouChangeIndex(0));

  void forYouChanegeIndex(int index) => emit(ForYouChangeIndex(index));
}
