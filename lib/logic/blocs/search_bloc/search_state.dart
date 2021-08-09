part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchIsLoading extends SearchState {}

class SearchIsLoaded extends SearchState {
  final SearchModel _search;

  SearchIsLoaded(this._search);

  SearchModel get getRadio => _search;

  @override
  List<Object> get props => [_search];
}

class SearchNotLoaded extends SearchState {}

class SearchError extends SearchState {}
