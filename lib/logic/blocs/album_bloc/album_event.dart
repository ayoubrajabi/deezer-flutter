part of 'album_bloc.dart';

abstract class AlbumEvent extends Equatable {
  const AlbumEvent();

  @override
  List<Object> get props => [];
}

class FeatchAlbum extends AlbumEvent {
  final String _query;
  final String _value;

  FeatchAlbum(this._query, this._value);

  String get getUrl => _query;
  String get getValue => _value;

  @override
  List<Object> get props => [_query, _value];
}
