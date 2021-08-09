part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class FeatchSearch extends SearchEvent {
  final String _query;
  final String _value;

  FeatchSearch(this._query, this._value);

  String get getUrl => _query;
  String get getValue => _value;

  @override
  List<Object> get props => [_query, _value];
}
