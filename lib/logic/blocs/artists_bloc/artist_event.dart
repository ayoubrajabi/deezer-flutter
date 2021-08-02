part of 'artist_bloc.dart';

abstract class ArtistEvent extends Equatable {
  const ArtistEvent();

  @override
  List<Object> get props => [];
}

class FeatchArtist extends ArtistEvent {
  final String _query;
  final String _value;

  FeatchArtist(this._query, this._value);

  String get getUrl => _query;
  String get getValue => _value;

  @override
  List<Object> get props => [_query, _value];
}
