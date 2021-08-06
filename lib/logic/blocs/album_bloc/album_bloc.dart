import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:deezer_flutter/data/models/models.dart';
import 'package:deezer_flutter/data/repositores/music_repo.dart';
import 'package:equatable/equatable.dart';

part 'album_event.dart';
part 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  MusicRepo? musicRepo;
  AlbumBloc({this.musicRepo}) : super(AlbumIsLoading());

  @override
  Stream<AlbumState> mapEventToState(
    AlbumEvent event,
  ) async* {
    if (event is FeatchAlbum) {
      try {
        yield AlbumIsLoading();

        AlbumModel _album =
            await musicRepo!.get(endpoint: event._query, value: event._value);
        yield AlbumIsLoaded(_album);
      } catch (_) {
        print(_);
        yield AlbumError();
      }
    }
  }
}
