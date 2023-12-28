// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bloc.dart';

sealed class PropertyState extends Equatable {
  const PropertyState();

  @override
  List<Object> get props => [];
}

final class PropertyInitial extends PropertyState {}

final class PropertyLoading extends PropertyState {}

final class PropertyFailure extends PropertyState {
  final String msg;
  const PropertyFailure(this.msg);
  @override
  List<Object> get props => [msg];
}

final class PropertySuccess extends PropertyState {
  final DemoDataModel data;

  const PropertySuccess({required this.data});

  @override
  List<Object> get props => [data];
}
