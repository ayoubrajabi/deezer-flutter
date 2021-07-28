part of 'artist_bloc.dart';

abstract class ArtistState extends Equatable {
  const ArtistState();

  @override
  List<Object> get props => [];
}

class ArtistIsLoading extends ArtistState {}

class ArtistIsLoaded extends ArtistState {
  final ArtistModel _artist;

  ArtistIsLoaded(this._artist);

  ArtistModel get getRadio => _artist;

  @override
  List<Object> get props => [_artist];
}

class ArtistIsNotLoaded extends ArtistState {}

class ArtistError extends ArtistState {}
