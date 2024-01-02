import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proplink/src/core/services/storage.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(const LanguageState());

  Future<void> setLanguage(String value) async {
    await StorageService.setString('_language_', value);
    emit(LanguageState(code: value));
  }

  Future<void> execute() async {
    final String value = StorageService.getString('_language_');
    emit(LanguageState(code: value.isEmpty ? 'en' : value));
  }
}

class LanguageState extends Equatable {
  final String code;

  const LanguageState({this.code = 'en'});

  @override
  List<Object> get props => [code];
}
