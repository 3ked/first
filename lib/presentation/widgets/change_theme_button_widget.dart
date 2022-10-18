import 'package:cv_pdf/presentation/common/logic/cubit/theme/theme_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../resources/strings_manager.dart';
import '../resources/values_manager.dart';

class ChangeThemeButtonWidget extends StatefulWidget {
  const ChangeThemeButtonWidget({Key? key}) : super(key: key);

  @override
  State<ChangeThemeButtonWidget> createState() => _ChangeThemeButtonWidgetState();
}

class _ChangeThemeButtonWidgetState extends State<ChangeThemeButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p28W),
          child: SwitchListTile.adaptive(
              title: state
                  ? Text(
                      AppStrings.darkTheme.tr(),
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  : Text(
                      AppStrings.lightTheme.tr(),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
              value: state,
              onChanged: (value) {
                BlocProvider.of<ThemeCubit>(context).toggleTheme(value: value);
              }),
        );
      },
    );
  }
}
