import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proplink/src/features/home/data/models/property.dart';

class FavoriteState extends Equatable {
  final List<Property> properties;

  const FavoriteState({required this.properties});

  @override
  List<Object> get props => [properties];

  FavoriteState copyWith({List<Property>? properties}) {
    return FavoriteState(properties: properties ?? this.properties);
  }
}

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(const FavoriteState(properties: []));

  void fetchData(Property property) {
    emit(state.copyWith(properties: [...state.properties, property]));
  }

  void add(Property property) {
    if (!state.properties.contains(property)) {
      emit(state.copyWith(properties: [...state.properties, property]));
    } else {
      emit(state.copyWith(properties: [...state.properties]..remove(property)));
    }
  }
}
