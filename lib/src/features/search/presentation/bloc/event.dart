part of 'bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
  @override
  List<Object> get props => [];
}

class Search extends SearchEvent {
  final String text;
  const Search({required this.text});
  @override
  List<Object> get props => [text];
}
