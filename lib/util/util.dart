// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_font_picker/flutter_font_picker.dart';

class FontPickerPage extends StatefulWidget {
  const FontPickerPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  _FontPickerPageState createState() => _FontPickerPageState();
}

class _FontPickerPageState extends State<FontPickerPage> {
  String _selectedFont = "Roboto";
  TextStyle? _selectedFontTextStyle;
  final List<String> _myGoogleFonts = [
    "Abril Fatface",
    "Aclonica",
    "Alegreya Sans",
    "Architects Daughter",
    "Archivo",
    "Archivo Narrow",
    "Bebas Neue",
    "Bitter",
    "Bree Serif",
    "Bungee",
    "Cabin",
    "Cairo",
    "Coda",
    "Comfortaa",
    "Comic Neue",
    "Cousine",
    "Croissant One",
    "Faster One",
    "Forum",
    "Great Vibes",
    "Heebo",
    "Inconsolata",
    "Josefin Slab",
    "Lato",
    "Libre Baskerville",
    "Lobster",
    "Lora",
    "Merriweather",
    "Montserrat",
    "Mukta",
    "Nunito",
    "Offside",
    "Open Sans",
    "Oswald",
    "Overlock",
    "Pacifico",
    "Playfair Display",
    "Poppins",
    "Raleway",
    "Roboto",
    "Roboto Mono",
    "Source Sans Pro",
    "Space Mono",
    "Spicy Rice",
    "Squada One",
    "Sue Ellen Francisco",
    "Trade Winds",
    "Ubuntu",
    "Varela",
    "Vollkorn",
    "Work Sans",
    "Zilla Slab"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  child: const Text('Pick a font (with a screen)'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FontPicker(
                              recentsCount: 10,
                              onFontChanged: (font) {
                                setState(() {
                                  _selectedFont = font.fontFamily;
                                  _selectedFontTextStyle = font.toTextStyle();
                                });
                                debugPrint(
                                    "${font.fontFamily} with font weight ${font.fontWeight} and font style ${font.fontStyle}. FontSpec: ${font.toFontSpec()}");
                              },
                              googleFonts: _myGoogleFonts)),
                    );
                  }),
              ElevatedButton(
                  child: const Text('Pick a font (with a dialog)'),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                            content: SingleChildScrollView(
                          child: SizedBox(
                            width: double.maxFinite,
                            child: FontPicker(
                                showInDialog: true,
                                initialFontFamily: 'Anton',
                                onFontChanged: (font) {
                                  setState(() {
                                    _selectedFont = font.fontFamily;
                                    _selectedFontTextStyle = font.toTextStyle();
                                  });
                                  debugPrint(
                                      "${font.fontFamily} with font weight ${font.fontWeight} and font style ${font.fontStyle}. FontSpec: ${font.toFontSpec()}");
                                },
                                googleFonts: _myGoogleFonts),
                          ),
                        ));
                      },
                    );
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Expanded(
                      child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Pick a font: ',
                        textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.w700)),
                  )),
                  Expanded(
                    child: TextField(
                      readOnly: true,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.arrow_drop_down_sharp),
                          hintText: _selectedFont,
                          border: InputBorder.none),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FontPicker(
                                  onFontChanged: (font) {
                                    setState(() {
                                      _selectedFont = font.fontFamily;
                                      _selectedFontTextStyle = font.toTextStyle();
                                    });
                                    debugPrint(
                                        "${font.fontFamily} with font weight ${font.fontWeight} and font style ${font.fontStyle}. FontSpec: ${font.toFontSpec()}");
                                  },
                                  googleFonts: _myGoogleFonts)),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.blueGrey, width: 2.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Center(
                          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                        Text('Font: $_selectedFont', style: _selectedFontTextStyle),
                        Text('The quick brown fox jumped', style: _selectedFontTextStyle),
                        Text('over the lazy dog', style: _selectedFontTextStyle),
                      ])),
                    ),
                  ),
                ),
              )
            ],
          ),
        )));
  }
}

  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  // @override
  // void initState() {
  //   setState(() {
  //     AppPreferences.getList().then((value) => myList = value);
  //     if (myList != null) {
  //       var newList = myList!.map((e) => Cvfile.fromJson(e)).toList();
  //       BlocProvider.of<CvCubitCubit>(context).toggleCVFiles(newList);
  //     }
  //   });

  //   super.initState();
  // }

////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////
///////////////////////////////////
// List<String>? myList;
//     myList = await AppPreferences.getList().then((value) => value);
//     print("my : $myList");
//     if (myList != null) {
//       List<Cvfile> newList = myList.map((e) => Cvfile.fromJson(e)).toList();
//       BlocProvider.of<CvCubitCubit>(context).toggleCVFiles(newList);
//       print("new : ${newList.length}");
//       print(
//           "Bloc : ${BlocProvider.of<CvCubitCubit>(context).state.files.length}");
//     }

// <queries>

//         <!-- If your app opens https URLs -->
//         <intent>
//             <action android:name="android.intent.action.VIEW" />

//             <data android:schemas="https" />
//         </intent>
//         <!-- If your app makes call -->
//         <intent>
//             <action android:name="android.intent.action.DIAL" />

//             <data android:schemas="tel" />
//         </intent>
//         <!-- If your app opens emails -->
//         <intent>
//             <action android:name="android.intent.action.SEND" />

//             <data android:mimeType="*/*" />
//         </intent>
//         <intent>
//             <action android:name="android.intent.action.GET_CONTENT" />

//             <data android:mimeType="*/*" />
//         </intent>
//     </queries>

    // implementation 'com.google.android.gms:play-services-base:17.5.0'
    // implementation 'com.google.firebase:firebase-analytics:18.0.0'