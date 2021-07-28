part of 'radio_bloc.dart';

abstract class RadioState extends Equatable {
  const RadioState();

  @override
  List<Object> get props => [];
}

class RadioIsLoading extends RadioState {}

class RadioIsLoaded extends RadioState {
  final RadioModel _radio;

  RadioIsLoaded(this._radio);

  RadioModel get getRadio => _radio;

  @override
  List<Object> get props => [_radio];
}

class RadioIsNotLoaded extends RadioState {}

class RadioError extends RadioState {}
