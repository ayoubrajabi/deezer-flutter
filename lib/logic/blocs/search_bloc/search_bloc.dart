import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:deezer_flutter/data/models/models.dart';
import 'package:deezer_flutter/data/repositores/music_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  MusicRepo? musicRepo;
  SearchBloc({this.musicRepo}) : super(SearchIsLoading());

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is FeatchSearch) {
      try {
        yield SearchIsLoading();

        SearchModel search = await musicRepo!.get(
          endpoint: event._endPoint,
          value: event._value,
          query: event._query,
        );
        yield SearchIsLoaded(search);
      } catch (_) {
        print(_);
        yield SearchError();
      }
    } else if (event is DisposeSearch) {
      yield SearchNotLoaded();
    }
  }
}
