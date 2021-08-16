import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:deezer_flutter/data/models/models.dart';
import 'package:deezer_flutter/data/repositores/music_repo.dart';
import 'package:equatable/equatable.dart';

part 'artist_event.dart';
part 'artist_state.dart';

class ArtistsBloc extends Bloc<ArtistEvent, ArtistState> {
  MusicRepo? musicRepo;
  ArtistsBloc({this.musicRepo}) : super(ArtistIsLoading());

  @override
  Stream<ArtistState> mapEventToState(
    ArtistEvent event,
  ) async* {
    if (event is FeatchArtist) {
      try {
        yield ArtistIsLoading();

        ArtistModel artist =
            await musicRepo!.get(endpoint: event._query, value: event._value);
        yield ArtistIsLoaded(artist);
      } catch (_) {
        yield ArtistError();
      }
    }
  }
}
