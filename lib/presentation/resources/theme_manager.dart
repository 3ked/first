import 'styles_manager.dart';
import 'values_manager.dart';
import 'package:flutter/material.dart';
import 'color_manager.dart';
import 'font_manager.dart';

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColor: Colors.black,
    colorScheme: ColorScheme.dark(
      primaryContainer: ColorManager.white,
    ),
    iconTheme: IconThemeData(color: Colors.purple.shade400, opacity: 0.8),

    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(
          fontSize: FontSize.s18,
          color: ColorManager.white,
        ),
        //primary: ColorManager.lightPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s12R)),
      ),
    ),

    // text theme
    textTheme: TextTheme(
      displayLarge: getSemiBoldStyle(
        fontSize: FontSize.s22,
        color: ColorManager.white,
      ),
      bodyLarge: getRegularStyle(
        fontSize: FontSize.s20,
        color: ColorManager.white,
      ),
      bodySmall: getRegularStyle(
        fontSize: FontSize.s18,
        color: ColorManager.white,
      ),
    ),

    // input decoration theme(text form field)
    inputDecorationTheme: InputDecorationTheme(
      alignLabelWithHint: true,
      // content padding//
      contentPadding: EdgeInsets.all(AppPadding.p8SP),
      // hint style//
      hintStyle: getRegularStyle(
        fontSize: FontSize.s20,
        color: Colors.purple.shade200,
      ),
      // label style//
      labelStyle: getMediumStyle(
        fontSize: FontSize.s20,
        color: Colors.purple.shade200,
      ),
      // error style//
      errorStyle: getRegularStyle(
        fontSize: FontSize.s20,
        color: ColorManager.error,
      ),
      // enable border style//
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.purple.shade200,
          width: AppSize.s1_5W,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s8R),
        ),
      ),
      // focused border style//
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.purple.shade200,
          width: AppSize.s1_5W,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s8R),
        ),
      ),
      // error border style//
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.error,
          width: AppSize.s1_5W,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s8R),
        ),
      ),
      // focused error border style//
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.purple.shade200,
          width: AppSize.s1_5W,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s8R),
        ),
      ),
    ),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: ColorManager.primary,
    primaryColor: Colors.white,
    colorScheme: ColorScheme.light(
        primary: ColorManager.primary,
        secondary: ColorManager.lightPrimary,
        primaryContainer: ColorManager.white,
        secondaryContainer: ColorManager.lightPrimary),
    iconTheme: IconThemeData(color: ColorManager.primary, opacity: 0.8),

    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(
          fontSize: FontSize.s18,
          color: ColorManager.white,
        ),
        primary: ColorManager.lightPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s12R)),
      ),
    ),

    // text theme
    textTheme: TextTheme(
      titleLarge: getSemiBoldStyle(
        fontSize: FontSize.s30,
        color: ColorManager.black,
      ),
      displayLarge: getSemiBoldStyle(
        fontSize: FontSize.s22,
        color: ColorManager.black,
      ),
      bodyLarge: getRegularStyle(
        fontSize: FontSize.s20,
        color: ColorManager.black,
      ),
      bodySmall: getRegularStyle(
        fontSize: FontSize.s18,
        color: ColorManager.black,
      ),
      labelSmall: getRegularStyle(
        fontSize: FontSize.s14,
        color: ColorManager.grey,
      ),
    ),

    // input decoration theme(text form field)
    inputDecorationTheme: InputDecorationTheme(
      alignLabelWithHint: true,
      // content padding//
      contentPadding: EdgeInsets.all(AppPadding.p8SP),
      // hint style//
      hintStyle: getRegularStyle(
        fontSize: FontSize.s20,
        color: ColorManager.primary,
      ),
      // label style//
      labelStyle: getMediumStyle(
        fontSize: FontSize.s20,
        color: ColorManager.primary,
      ),
      // error style//
      errorStyle: getRegularStyle(
        fontSize: FontSize.s20,
        color: ColorManager.error,
      ),
      // enable border style//
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primary,
          width: AppSize.s1_5W,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s8R),
        ),
      ),
      // focused border style//
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primary,
          width: AppSize.s1_5W,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s8R),
        ),
      ),
      // error border style//
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.error,
          width: AppSize.s1_5W,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s8R),
        ),
      ),
      // focused error border style//
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primary,
          width: AppSize.s1_5W,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s8R),
        ),
      ),
    ),
  );
}

// ThemeData getApplicationTheme() {
//   return ThemeData(
//     // main colors
//     primaryColor: ColorManager.primary,
//     primaryColorLight: ColorManager.lightPrimary,
//     primaryColorDark: ColorManager.darkPrimary,
//     disabledColor: ColorManager.grey1,
//     splashColor: ColorManager.lightPrimary, // ripple effect color

//     // cardview theme
//     cardTheme: CardTheme(
//       color: ColorManager.white,
//       shadowColor: ColorManager.grey,
//       elevation: AppSize.s4SP,
//     ),

//     // app bar theme
//     appBarTheme: AppBarTheme(
//       centerTitle: true,
//       color: ColorManager.primary,
//       elevation: AppSize.s4SP,
//       shadowColor: ColorManager.lightPrimary,
//       titleTextStyle: getRegularStyle(
//         fontSize: FontSize.s20.sp,
//         color: ColorManager.white,
//       ),
//     ),

//     //button theme

//     buttonTheme: ButtonThemeData(
//       shape: const StadiumBorder(),
//       disabledColor: ColorManager.grey1,
//       buttonColor: ColorManager.primary,
//       splashColor: ColorManager.lightPrimary,
//     ),

//     // elevated button theme
//     elevatedButtonTheme: ElevatedButtonThemeData(
//       style: ElevatedButton.styleFrom(
//         textStyle: getRegularStyle(
//           fontSize: FontSize.s18.sp,
//           color: ColorManager.white,
//         ),
//         primary: ColorManager.primary,
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(AppSize.s12R)),
//       ),
//     ),

//     // text theme
//     textTheme: TextTheme(
//       displayLarge: getSemiBoldStyle(
//         fontSize: FontSize.s22,
//         color: ColorManager.darkGrey,
//       ),
//       headlineLarge: getSemiBoldStyle(
//         fontSize: FontSize.s18,
//         color: ColorManager.darkGrey,
//       ),
//       headlineMedium: getRegularStyle(
//         fontSize: FontSize.s18,
//         color: ColorManager.darkGrey,
//       ),
//       titleMedium: getMediumStyle(
//         fontSize: FontSize.s20,
//         color: ColorManager.primary,
//       ),
//       titleSmall: getRegularStyle(
//         fontSize: FontSize.s18,
//         color: ColorManager.white,
//       ),
//       bodyLarge: getRegularStyle(
//         fontSize: FontSize.s20,
//         color: ColorManager.grey1,
//       ),
//       bodySmall: getRegularStyle(
//         fontSize: FontSize.s18,
//         color: ColorManager.grey,
//       ),
//       labelSmall: getBoldStyle(
//         fontSize: FontSize.s18,
//         color: ColorManager.primary,
//       ),
//       bodyMedium: getRegularStyle(
//         fontSize: FontSize.s18,
//         color: ColorManager.grey2,
//       ),
//     ),

//     // input decoration theme(text form field)
//     inputDecorationTheme: InputDecorationTheme(
//       // content padding//
//       contentPadding: EdgeInsets.all(AppPadding.p8SP),
//       // hint style//
//       hintStyle: getRegularStyle(
//         fontSize: FontSize.s20,
//         color: ColorManager.grey,
//       ),
//       // label style//
//       labelStyle: getMediumStyle(
//         fontSize: FontSize.s20,
//         color: ColorManager.grey,
//       ),
//       // error style//
//       errorStyle: getRegularStyle(
//         fontSize: FontSize.s20,
//         color: ColorManager.error,
//       ),
//       // enable border style//
//       enabledBorder: OutlineInputBorder(
//         borderSide: BorderSide(
//           color: ColorManager.grey,
//           width: AppSize.s1_5W,
//         ),
//         borderRadius: BorderRadius.all(
//           Radius.circular(AppSize.s8R),
//         ),
//       ),
//       // focused border style//
//       focusedBorder: OutlineInputBorder(
//         borderSide: BorderSide(
//           color: ColorManager.primary,
//           width: AppSize.s1_5W,
//         ),
//         borderRadius: BorderRadius.all(
//           Radius.circular(AppSize.s8R),
//         ),
//       ),
//       // error border style//
//       errorBorder: OutlineInputBorder(
//         borderSide: BorderSide(
//           color: ColorManager.error,
//           width: AppSize.s1_5W,
//         ),
//         borderRadius: BorderRadius.all(
//           Radius.circular(AppSize.s8R),
//         ),
//       ),
//       // focused error border style//
//       focusedErrorBorder: OutlineInputBorder(
//         borderSide: BorderSide(
//           color: ColorManager.primary,
//           width: AppSize.s1_5W,
//         ),
//         borderRadius: BorderRadius.all(
//           Radius.circular(AppSize.s8R),
//         ),
//       ),
//     ),
//   );
// }
