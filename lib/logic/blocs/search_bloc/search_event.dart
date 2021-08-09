part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class FeatchSearch extends SearchEvent {
  final String _endPoint;
  final String _value;
  final Map<String, dynamic> _query;

  FeatchSearch(this._endPoint, this._value, this._query);

  Map<String, dynamic> get getUrl => _query;
  String get getValue => _value;
  String get getEndPoint => _endPoint;

  @override
  List<Object> get props => [_query, _value, _endPoint];
}
