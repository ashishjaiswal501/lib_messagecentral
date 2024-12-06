import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messagecentral/core/language/utils/app_language.dart';



part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc(Locale locale) : super(AppState(locale: locale)) {
    on<LanguageChanged>(_onLanguageChanged);
  }

  void _onLanguageChanged(LanguageChanged event, Emitter<AppState> emit) {
    final appLanguage = AppLanguage();
    appLanguage.changeLanguage(event.locale);
    emit(
        state.copyWith(
          locale: event.locale,
        )
    );
  }
}