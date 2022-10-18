import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../resources/strings_manager.dart';
import '../resources/values_manager.dart';

void showSnackBar(BuildContext context, String msg, {VoidCallback? onPressed}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(
      content: Row(
        children: [
          const Icon(Icons.info_outline),
          SizedBox(
            width: AppSize.s10W,
          ),
          Expanded(child: Text(msg.tr())),
        ],
      ),
      duration: const Duration(seconds: 2),
      shape: const StadiumBorder(),
      behavior: SnackBarBehavior.floating,
      action: onPressed != null
          ? SnackBarAction(label: AppStrings.undo.tr(), onPressed: onPressed)
          : null,
    ));
}
