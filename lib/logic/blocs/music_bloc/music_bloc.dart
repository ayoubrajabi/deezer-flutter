import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:deezer_flutter/data/models/models.dart';
import 'package:deezer_flutter/data/repositores/music_repo.dart';
import 'package:equatable/equatable.dart';

part 'music_event.dart';
part 'music_state.dart';

class MusicBloc extends Bloc<MusicEvent, MusicState> {
  MusicRepo? musicRepo;
  MusicBloc({this.musicRepo}) : super(MusicIsLoading());

  @override
  Stream<MusicState> mapEventToState(
    MusicEvent event,
  ) async* {
    if (event is FeatchMusic) {
      try {
        yield MusicIsLoading();

        MusicModel radio =
            await musicRepo!.get(endpoint: event._query, value: event._value);
        yield MusicIsLoaded(radio);
      } catch (_) {
        yield MusicError();
      }
    }
  }
}
