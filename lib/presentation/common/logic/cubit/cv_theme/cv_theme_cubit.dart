import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'cv_theme_state.dart';

class CvThemeCubit extends HydratedCubit<CvThemeState> {
  CvThemeCubit()
      : super(
          CvThemeState(
            pageValue: const Color(0xFF3A3A3A).value,
            fontValue: Colors.white.value,
          ),
        );
  void togglePageColor({required int newPageValue}) {
    emit(state.copyWith(pageValue: newPageValue));
  }

  void toggleFontColor({required int newFontValue}) {
    emit(state.copyWith(fontValue: newFontValue));
  }

  @override
  CvThemeState? fromJson(Map<String, dynamic> json) {
    return CvThemeState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(CvThemeState state) {
    return state.toMap();
  }
}
