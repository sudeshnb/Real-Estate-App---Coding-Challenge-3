import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proplink/src/features/home/data/implements/onboard.implement.dart';
import 'package:proplink/src/features/home/data/models/onboard.models.dart';

class OnboardPageViewState extends Equatable {
  final int index;
  final List<OnBoardModel> onboards;
  final bool isLast;
  final PageController imageController;
  final PageController textController;

  const OnboardPageViewState({
    required this.index,
    required this.onboards,
    this.isLast = false,
    required this.imageController,
    required this.textController,
  });

  @override
  List<Object> get props =>
      [index, onboards, isLast, imageController, textController];

  OnboardPageViewState copyWith({
    int? index,
    List<OnBoardModel>? onboards,
    bool? isLast,
    PageController? imageController,
    PageController? textController,
  }) {
    return OnboardPageViewState(
      index: index ?? this.index,
      onboards: onboards ?? this.onboards,
      isLast: isLast ?? this.isLast,
      imageController: imageController ?? this.imageController,
      textController: textController ?? this.textController,
    );
  }
}

///
class OnboardPageViewCubit extends Cubit<OnboardPageViewState> {
  OnboardPageViewCubit()
      : super(OnboardPageViewState(
          index: 0,
          onboards: const [],
          imageController: isNextController,
          textController: isPreviousController,
        ));

  static PageController isNextController = PageController();
  static PageController isPreviousController = PageController();

  ///
  void fetchData() {
    final response = OnBoardRepositoryImpl().getOnBoardData();
    emit(state.copyWith(onboards: response, index: 0));
  }

  ///
  void clickNext() {
    if (state.onboards.length - 1 > state.index) {
      // state.imageController.animateToPage(
      //   state.index + 1,
      //   curve: Curves.easeInQuad,
      //   duration: const Duration(milliseconds: 500),
      // );
      state.imageController.jumpToPage(state.index + 1);

      state.textController.jumpToPage(state.index + 1);
      emit(state.copyWith(index: state.index + 1));
    } else {
      emit(state.copyWith(isLast: true));
    }
  }

  void clickBack() {
    if (!(state.index > 0)) return;

    // state.imageController.animateToPage(
    //   state.index - 1,
    //   curve: Curves.easeInQuad,
    //   duration: const Duration(milliseconds: 500),
    // );
    state.imageController.jumpToPage(state.index - 1);

    state.textController.jumpToPage(state.index - 1);
    emit(state.copyWith(index: state.index - 1));
  }

  ///
  void clickSkip() {
    emit(state.copyWith(isLast: true));
  }
}
