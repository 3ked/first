import 'package:cv_pdf/presentation/common/logic/cubit/cv_theme/cv_theme_cubit.dart';
import 'package:cv_pdf/presentation/common/logic/cubit/font/font_cubit.dart';
import 'package:cv_pdf/presentation/resources/assets_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import '../../resources/font_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/values_manager.dart';

enum Menu {
  itemOne,
  itemTwo,
  itemThree,
  itemFour,
  itemFive,
  itemSex,
  itemSeven,
  itemEight,
}

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
                context.read<FontCubit>().toggleFont(font: FontAssets.hacenTunisia);
              },
              child: Text(AppStrings.reset.tr()),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
          ),
          const Divider(),
          Container(
            child: Column(
              children: [
                PopupMenuButton<Menu>(
                  child: Container(
                      width: AppSize.s120W,
                      color: Theme.of(context).colorScheme.primary,
                      child: Center(child: Text(AppStrings.pickFont.tr()))),
                  onSelected: (Menu item) async {
                    if (item == Menu.itemOne) {
                      context.read<FontCubit>().toggleFont(font: FontAssets.hacenTunisia);
                    }
                    if (item == Menu.itemTwo) {
                      context.read<FontCubit>().toggleFont(font: FontAssets.helveticaWorld);
                    }
                    if (item == Menu.itemThree) {
                      context.read<FontCubit>().toggleFont(font: FontAssets.bonaNova);
                    }
                    if (item == Menu.itemFour) {
                      context.read<FontCubit>().toggleFont(font: FontAssets.notoKufiArabic);
                    }
                    if (item == Menu.itemFive) {
                      context.read<FontCubit>().toggleFont(font: FontAssets.mansalva);
                    }
                    if (item == Menu.itemSex) {
                      context.read<FontCubit>().toggleFont(font: FontAssets.openSans);
                    }
                    if (item == Menu.itemSeven) {
                      context.read<FontCubit>().toggleFont(font: FontAssets.eBGaramond);
                    }
                    if (item == Menu.itemEight) {
                      context.read<FontCubit>().toggleFont(font: FontAssets.gFSDidot);
                    }
                  },
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
                    PopupMenuItem(
                        value: Menu.itemOne,
                        child: Expanded(
                            child: Text("Hacen Tunisia",
                                style: Theme.of(context).textTheme.bodySmall))),
                    PopupMenuItem(
                        value: Menu.itemTwo,
                        child: Expanded(
                            child: Text("Helvetica World",
                                style: Theme.of(context).textTheme.bodySmall))),
                    PopupMenuItem(
                        value: Menu.itemThree,
                        child: Expanded(
                            child:
                                Text("Bona Nova", style: Theme.of(context).textTheme.bodySmall))),
                    PopupMenuItem(
                        value: Menu.itemFour,
                        child: Expanded(
                            child: Text("Noto Kufi Arabic",
                                style: Theme.of(context).textTheme.bodySmall))),
                    PopupMenuItem(
                        value: Menu.itemFive,
                        child: Expanded(
                            child: Text("Mansalva English",
                                style: Theme.of(context).textTheme.bodySmall))),
                    PopupMenuItem(
                        value: Menu.itemSex,
                        child: Expanded(
                            child: Text("Open Sans English",
                                style: Theme.of(context).textTheme.bodySmall))),
                    PopupMenuItem(
                        value: Menu.itemSeven,
                        child: Expanded(
                            child: Text("EB Garamond English",
                                style: Theme.of(context).textTheme.bodySmall))),
                    PopupMenuItem(
                        value: Menu.itemEight,
                        child: Expanded(
                            child: Text("GFS Didot English",
                                style: Theme.of(context).textTheme.bodySmall))),
                  ],
                ),
                BlocBuilder<FontCubit, String>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        Text(
                          "السيرة الذاتية",
                          style: TextStyle(fontFamily: getFontFamily(state: state)),
                        ),
                        Text(
                          "Curriculum Vitae",
                          style: TextStyle(fontFamily: getFontFamily(state: state)),
                        ),
                      ],
                    );
                  },
                )
              ],
            ),
          ),
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

  String getFontFamily({required String state}) {
    switch (state) {
      case FontAssets.hacenTunisia:
        return FontFamily.hacenTunisia;
      case FontAssets.helveticaWorld:
        return FontFamily.helveticaWorld;
      case FontAssets.bonaNova:
        return FontFamily.bonaNova;
      case FontAssets.notoKufiArabic:
        return FontFamily.notoKufiArabic;
      case FontAssets.mansalva:
        return FontFamily.mansalva;
      case FontAssets.openSans:
        return FontFamily.openSans;
      case FontAssets.eBGaramond:
        return FontFamily.eBGaramond;
      case FontAssets.gFSDidot:
        return FontFamily.gFSDidot;
      default:
        return FontFamily.hacenTunisia;
    }
  }
}
