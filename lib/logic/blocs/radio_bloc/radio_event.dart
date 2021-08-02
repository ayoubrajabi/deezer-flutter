part of 'radio_bloc.dart';

abstract class RadioEvent extends Equatable {
  const RadioEvent();

  @override
  List<Object> get props => [];
}

class FeatchRadio extends RadioEvent {
  final String _query;
  final String _value;

  FeatchRadio(this._query, this._value);

  String get getUrl => _query;
  String get getValue => _value;

  @override
  List<Object> get props => [_query, _value];
}
