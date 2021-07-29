part of 'radio_bloc.dart';

abstract class RadioEvent extends Equatable {
  const RadioEvent();

  @override
  List<Object> get props => [];
}

class FeatchRadio extends RadioEvent {
  final String _query;

  FeatchRadio(this._query);

  String get getUrl => _query;

  @override
  List<Object> get props => [_query];
}
