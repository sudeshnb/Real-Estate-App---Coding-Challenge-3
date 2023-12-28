import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScrollDetectCubit extends Cubit<ScrollDetectState> {
  ScrollDetectCubit() : super(const ScrollDetectState());

  void challenge(bool value) {
    emit(state.copyWith(isChallenge: value));
  }
}

class ScrollDetectState extends Equatable {
  final bool isScroll;

  const ScrollDetectState({this.isScroll = false});

  @override
  List<Object?> get props => [isScroll];

  ScrollDetectState copyWith({bool? isChallenge}) {
    return ScrollDetectState(isScroll: isChallenge ?? isScroll);
  }
}
