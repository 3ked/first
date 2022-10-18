import 'package:cv_pdf/presentation/common/logic/cubit/language_app/language_app_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../resources/language_manager.dart';
import '../resources/strings_manager.dart';

class ChangeLanguageApp extends StatefulWidget {
  const ChangeLanguageApp({Key? key}) : super(key: key);

  @override
  State<ChangeLanguageApp> createState() => _ChangeLanguageAppState();
}

class _ChangeLanguageAppState extends State<ChangeLanguageApp> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageAppCubit, LanguageType>(
      builder: (context, state) {
        return Column(
          children: <Widget>[
            RadioListTile<LanguageType>(
              title: Text(
                AppStrings.arabicLanguage.tr(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
              value: LanguageType.arabic,
              groupValue: state,
              onChanged: (LanguageType? value) {
                BlocProvider.of<LanguageAppCubit>(context).toggleLanguage(language: value!);
                context.setLocale(arabicLocale);
              },
            ),
            RadioListTile<LanguageType>(
              title: Text(
                AppStrings.englishLanguage.tr(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
              value: LanguageType.english,
              groupValue: state,
              onChanged: (LanguageType? value) {
                context.read<LanguageAppCubit>().toggleLanguage(language: value!);
                context.setLocale(englishLocale);
              },
            ),
          ],
        );
      },
    );
  }
}
