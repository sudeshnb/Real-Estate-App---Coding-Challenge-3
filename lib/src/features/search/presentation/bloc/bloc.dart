import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:proplink/src/features/home/data/models/property.dart';

import '../../domain/usecases/usecases.dart';

part 'event.dart';
part 'state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<Search>(execute);
  }
  Future<void> execute(Search event, emit) async {
    GetSearchUseCase useCase = GetSearchUseCase();
    final respons = await useCase.fetchProperties();
    return respons.fold(
      (list) {
        emit(SearchLoading());
        final found = list
            .where((item) =>
                item.address!
                    .toLowerCase()
                    .contains(event.text.toLowerCase()) ||
                item.area!.toLowerCase().contains(event.text.toLowerCase()) ||
                item.listingName!
                    .toLowerCase()
                    .contains(event.text.toLowerCase()))
            .toList();

        if (found.isNotEmpty) emit(SearchFound(properties: found));
        if (found.isEmpty) emit(SearchNotFound());
        // emit(SearchInitial());
      },
      (error) => emit(SearchError(error)),
    );
  }
}
