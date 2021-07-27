part of 'music_bloc.dart';

abstract class MusicState extends Equatable {
  const MusicState();

  @override
  List<Object> get props => [];
}

class MusicIsLoading extends MusicState {}

class MusicIsLoaded extends MusicState {
  final MusicModel _music;

  MusicIsLoaded(this._music);

  MusicModel get getMusic => _music;

  @override
  List<Object> get props => [_music];
}

class MusicIsNotLoaded extends MusicState {}

class MusicError extends MusicState {}
