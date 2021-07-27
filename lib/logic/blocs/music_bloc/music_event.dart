part of 'music_bloc.dart';

abstract class MusicEvent extends Equatable {
  const MusicEvent();

  @override
  List<Object> get props => [];
}

class FeatchMusic extends MusicEvent {
  final String _query;

  FeatchMusic(this._query);

  String get getUrl => _query;

  @override
  List<Object> get props => [_query];
}
