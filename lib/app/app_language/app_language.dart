// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../logic/cubit/language_app_cubit.dart';
// import '../../presentation/resources/language_manager.dart';

const String prefsKeyLang = "PREFS_KEY_LANG";
const String prefsKeyOnBoardingScreenViewd =
    "PREFS_KEY_ONBOARDING_SCREEN_VIEWD";
const String prefsKeyIsUserLoggedIn = "PREFS_KEY_IS_USER_LOGGED_IN";

class AppLanguage {
  // Future<String> getAppLanguage(BuildContext context) async {
  //   String? language =
  //       BlocProvider.of<LanguageAppCubit>(context).state.appLanguage;
  //   if (language.isNotEmpty) {
  //     return language;
  //   } else {
  //     // return default language
  //     return LanguageType.english.getValue();
  //   }
  // }

  // Future<void> changeLanguage(BuildContext context) async {
  //   String currrentLang = await getAppLanguage(context);

  //   if (currrentLang == LanguageType.arabic.getValue()) {
  //     // set english
  //     BlocProvider.of<LanguageAppCubit>(context).state.appLanguage =
  //         LanguageType.english.getValue();
  //   } else {
  //     // set arabic
  //     BlocProvider.of<LanguageAppCubit>(context).state.appLanguage =
  //         LanguageType.arabic.getValue();
  //   }
  // }

  // Future<Locale> getLocale(BuildContext context) async {
  //   String currrentLang = await getAppLanguage(context);

  //   if (currrentLang == LanguageType.arabic.getValue()) {
  //     return arabicLocale;
  //   } else {
  //     return englishLocale;
  //   }
  // }

  // Future<String> getAppLanguage() async {
  //   String? language = ;

  //   if (language != null && language.isNotEmpty) {
  //     return language;
  //   } else {
  //     // return default language
  //     return LanguageType.english.getValue();
  //   }
  // }

  // Future<void> changeLanguage() async {
  //   String currrentLang = await getAppLanguage();

  //   if (currrentLang == LanguageType.arabic.getValue()) {
  //     // set english
  //     _sharedPreferences.setString(
  //         prefsKeyLang, LanguageType.english.getValue());
  //   } else {
  //     // set arabic
  //     _sharedPreferences.setString(
  //         prefsKeyLang, LanguageType.arabic.getValue());
  //   }
  // }

  // Future<Locale> getLocale() async {
  //   String currrentLang = await getAppLanguage();

  //   if (currrentLang == LanguageType.arabic.getValue()) {
  //     return arabicLocale;
  //   } else {
  //     return englishLocale;
  //   }
  // }
}
