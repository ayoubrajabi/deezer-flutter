part of 'album_bloc.dart';

abstract class AlbumState extends Equatable {
  const AlbumState();

  @override
  List<Object> get props => [];
}

class AlbumIsLoading extends AlbumState {}

class AlbumIsLoaded extends AlbumState {
  final AlbumModel _album;

  AlbumIsLoaded(this._album);

  AlbumModel get album => _album;

  @override
  List<Object> get props => [_album];
}

class AlbumNotLoaded extends AlbumState {}

class AlbumError extends AlbumState {}
