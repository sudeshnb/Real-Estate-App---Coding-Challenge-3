part of 'bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchNotFound extends SearchState {}

class SearchFound extends SearchState {
  final List<Property> properties;
  const SearchFound({required this.properties});
}

class SearchError extends SearchState {
  final String msg;
  const SearchError(this.msg);
  @override
  List<Object> get props => [msg];
}
