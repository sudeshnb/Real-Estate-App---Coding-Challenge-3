part of 'bloc.dart';

sealed class PropertyEvent extends Equatable {
  const PropertyEvent();

  @override
  List<Object> get props => [];
}

class FetchProperties extends PropertyEvent {}
