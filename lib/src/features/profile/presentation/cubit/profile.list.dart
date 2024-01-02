import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proplink/src/features/home/data/models/property.dart';
import 'package:proplink/src/features/profile/domain/usecases/usecases.dart';

class ProfileTabViewState extends Equatable {
  final int index;
  final List<Property> transaction;
  final List<Property> listings;
  final List<Property> sold;

  const ProfileTabViewState({
    required this.index,
    this.transaction = const [],
    this.listings = const [],
    this.sold = const [],
  });

  @override
  List<Object> get props => [index, transaction, listings, sold];

  ProfileTabViewState copyWith({
    int? index,
    List<Property>? transaction,
    List<Property>? listings,
    List<Property>? sold,
  }) {
    return ProfileTabViewState(
      index: index ?? this.index,
      transaction: transaction ?? this.transaction,
      listings: listings ?? this.listings,
      sold: sold ?? this.sold,
    );
  }
}

///
class ProfileTabViewCubit extends Cubit<ProfileTabViewState> {
  ProfileTabViewCubit() : super(const ProfileTabViewState(index: 0));

  ///
  void click(int index) {
    emit(state.copyWith(index: index));
  }

  Future<void> execute() async {
    GetProfileUseCase useCase = GetProfileUseCase();
    final responsProperties = await useCase.fetchProperties();

    responsProperties.fold(
      (data) => emit(state.copyWith(
        listings: data.listings,
        sold: data.sold,
        transaction: data.transaction,
      )),
      (fail) => log('message: $fail'),
    );
  }
}
