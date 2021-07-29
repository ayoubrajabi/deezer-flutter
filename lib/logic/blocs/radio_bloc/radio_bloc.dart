import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:deezer_flutter/data/models/models.dart';
import 'package:deezer_flutter/data/repositores/music_repo.dart';
import 'package:equatable/equatable.dart';

part 'radio_event.dart';
part 'radio_state.dart';

class RadioBloc extends Bloc<RadioEvent, RadioState> {
  MusicRepo? musicRepo;
  RadioBloc({this.musicRepo}) : super(RadioIsLoading());

  @override
  Stream<RadioState> mapEventToState(
    RadioEvent event,
  ) async* {
    if (event is FeatchRadio) {
      try {
        yield RadioIsLoading();

        RadioModel radio = await musicRepo!.get(endpoint: event._query);
        yield RadioIsLoaded(radio);
      } catch (_) {
        print(_);
        yield RadioError();
      }
    }
  }
}
