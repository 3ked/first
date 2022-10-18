import 'package:cv_pdf/presentation/common/logic/cubit/cv_theme/cv_theme_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import '../../resources/font_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/values_manager.dart';

class CvThemePage extends StatefulWidget {
  const CvThemePage({Key? key}) : super(key: key);

  @override
  State<CvThemePage> createState() => _CvThemePageState();
}

class _CvThemePageState extends State<CvThemePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.cvTheme.tr()),
        actions: [
          Padding(
            padding: EdgeInsets.all(AppPadding.p8SP),
            child: ElevatedButton(
              onPressed: () {
                context
                    .read<CvThemeCubit>()
                    .togglePageColor(newPageValue: const Color(0xFF3A3A3A).value);
                context.read<CvThemeCubit>().toggleFontColor(newFontValue: Colors.white.value);
              },
              child: Text(AppStrings.reset.tr()),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  pickColor(
                      context: context,
                      value: context.read<CvThemeCubit>().state.pageValue,
                      onColorChanged: (color) {
                        context.read<CvThemeCubit>().togglePageColor(newPageValue: color.value);
                      });
                },
                child: Text(
                  AppStrings.pageColor.tr(),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  pickColor(
                      context: context,
                      value: context.read<CvThemeCubit>().state.fontValue,
                      onColorChanged: (color) {
                        context.read<CvThemeCubit>().toggleFontColor(newFontValue: color.value);
                      });
                },
                child: Text(AppStrings.fontColor.tr()),
              ),
            ],
          ),
          BlocBuilder<CvThemeCubit, CvThemeState>(
            builder: (context, state) {
              return Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    height: AppSize.s235H,
                    width: AppSize.s235W,
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, color: Color(state.pageValue)),
                  ),
                  Text(
                    AppStrings.fontColor.tr(),
                    style: TextStyle(
                        color: Color(state.fontValue),
                        fontSize: FontSize.s22,
                        fontWeight: FontWeightManager.bold),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }

  void pickColor(
          {required BuildContext context,
          required int value,
          required Function(Color) onColorChanged}) =>

//       child: ColorPicker(
//         pickerColor: pickerColor,
//         onColorChanged: changeColor,
//       ),
//       // Use Material color picker:
//       //
//       // child: MaterialPicker(
//       //   pickerColor: pickerColor,
//       //   onColorChanged: changeColor,
//       //   showLabel: true, // only on portrait mode
//       // ),
//       //
//       // Use Block color picker:
//       //
//       // child: BlockPicker(
//       //   pickerColor: currentColor,
//       //   onColorChanged: changeColor,
//       // ),
//       //
//       // child: MultipleChoiceBlockPicker(
//       //   pickerColors: currentColors,
//       //   onColorsChanged: changeColors,
//       // ),
//     ),
//     actions: <Widget>[
//       ElevatedButton(
//         child: const Text('Got it'),
//         onPressed: () {
//           setState(() => currentColor = pickerColor);
//           Navigator.of(context).pop();
//         },
//       ),
//     ],
//   ),
// )

      showDialog(
        context: context,
        builder: (context) => SingleChildScrollView(
          child: AlertDialog(
            title: Center(child: Text(AppStrings.pickColor.tr())),
            content: SingleChildScrollView(
              child: buildColorPicker(value: value, onColorChanged: onColorChanged),
            ),
            actions: [
              ElevatedButton(
                child: Text(AppStrings.ok.tr()),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
            actionsAlignment: MainAxisAlignment.center,
          ),
        ),
      );

  Widget buildColorPicker({required int value, required Function(Color) onColorChanged}) =>
      ColorPicker(
          pickerColor: Color(value),
          labelTypes: const [],
          enableAlpha: false,
          onColorChanged: onColorChanged);
}
