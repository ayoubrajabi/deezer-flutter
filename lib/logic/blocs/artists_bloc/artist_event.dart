part of 'artist_bloc.dart';

abstract class ArtistEvent extends Equatable {
  const ArtistEvent();

  @override
  List<Object> get props => [];
}

class FeatchArtist extends ArtistEvent {
  final String _query;

  FeatchArtist(this._query);

  String get getUrl => _query;

  @override
  List<Object> get props => [_query];
}
