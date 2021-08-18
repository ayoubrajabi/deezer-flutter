import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'miniplayer_state.dart';

class MiniPlayerCubit extends Cubit<MiniPlayerState> {
  MiniPlayerCubit()
      : super(const MiniPlayerState(
          imageUrl: '',
          name: '',
          title: '',
          isShow: false,
        ));

  void musicInfo(MiniPlayerState musicInfo) => emit(MiniPlayerState(
        imageUrl: musicInfo.imageUrl,
        name: musicInfo.name,
        title: musicInfo.title,
        isShow: musicInfo.isShow,
      ));
}
