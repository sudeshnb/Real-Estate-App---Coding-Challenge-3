import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proplink/src/core/services/storage.dart';

import 'package:proplink/src/core/theme/theme.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(theme: themeData));
  static ThemeData themeData = AppTheme.light;

  Future<void> execute() async {
    final bool value = StorageService.getBool('_theme_');
    emit(
      state.copyWith(
        isDark: value,
        theme: value ? AppTheme.dark : AppTheme.light,
      ),
    );
  }

  void change(bool value) async {
    await StorageService.setBool('_theme_', value);

    emit(
      state.copyWith(
        isDark: value,
        theme: value ? AppTheme.dark : AppTheme.light,
      ),
    );
  }
}

class ThemeState extends Equatable {
  final ThemeData theme;
  final bool isDark;
  const ThemeState({required this.theme, this.isDark = false});

  @override
  List<Object> get props => [theme, isDark];

  ThemeState copyWith({
    ThemeData? theme,
    bool? isDark,
  }) {
    return ThemeState(
      theme: theme ?? this.theme,
      isDark: isDark ?? this.isDark,
    );
  }
}
