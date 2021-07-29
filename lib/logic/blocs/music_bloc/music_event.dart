part of 'music_bloc.dart';

abstract class MusicEvent extends Equatable {
  const MusicEvent();

  @override
  List<Object> get props => [];
}

class FeatchMusic extends MusicEvent {
  final String _query;
  final String _value;

  FeatchMusic(this._query, this._value);

  String get getUrl => _query;
  String get getValue => _value;

  @override
  List<Object> get props => [_query, _value];
}
