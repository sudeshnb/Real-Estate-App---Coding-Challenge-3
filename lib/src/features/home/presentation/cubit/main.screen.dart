import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../pages/favorite.screen.dart';
import '../pages/home.screen.dart';
import '../pages/profile.screen.dart';

class MainPageState extends Equatable {
  final List<Widget> pages;
  final PageController controller;
  final int id;

  const MainPageState({
    required this.pages,
    required this.controller,
    this.id = 0,
  });

  @override
  List<Object> get props => [pages, controller, id];

  MainPageState copyWith({
    List<Widget>? pages,
    PageController? controller,
    int? id,
  }) {
    return MainPageState(
      pages: pages ?? this.pages,
      controller: controller ?? this.controller,
      id: id ?? this.id,
    );
  }
}

class MainPageCubit extends Cubit<MainPageState> {
  MainPageCubit() : super(MainPageState(pages: pages, controller: controller));

  static PageController controller = PageController();
  static List<Widget> pages = [
    const HomePage(),
    const FavoritePage(),
    const ProfilePage(),
    const Center(child: Text('Settings')),
  ];

  void click(int index) {
    state.controller.jumpToPage(index);
    emit(state.copyWith(id: index));
  }
}
