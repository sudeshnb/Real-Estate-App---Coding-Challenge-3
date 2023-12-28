import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proplink/src/features/home/domain/usecases/usecases.dart';

import '../../data/models/demo.dart';

part 'event.dart';
part 'state.dart';

class PropertyBloc extends Bloc<PropertyEvent, PropertyState> {
  PropertyBloc() : super(PropertyInitial()) {
    on<FetchProperties>(execute);
  }

  Future<void> execute(event, emit) async {
    GetPropertyUseCase useCase = GetPropertyUseCase();
    emit(PropertyLoading());

    final responsProperties = await useCase.fetchProperties();
    responsProperties.fold(
      (data) => emit(PropertySuccess(data: data)),
      (fail) => emit(PropertyFailure(fail)),
    );
  }
}
