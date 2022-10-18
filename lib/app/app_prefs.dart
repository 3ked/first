// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:typed_data';
import 'package:cv_pdf/domain/models/models.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../presentation/resources/values_manager.dart';

const String prefsKeyImage = "PREFS_KEY_IMAGE";
const String prefsKeyList = "PREFS_KEY_LIST";

class AppPreferences {
  static Future<bool> saveList(List<String> value) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setStringList(prefsKeyList, value);
  }

  static Future<List<String>?> getList() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getStringList(prefsKeyList);
  }

  static String base64String(Uint8List bytes) {
    return base64Encode(bytes);
  }

  static Image imageFromBase64String(String source) {
    return Image.memory(
      base64Decode(source),
      fit: BoxFit.contain,
      width: AppSize.s300R,
      height: AppSize.s300R,
    );
  }

  static Future<List<Cvfile>> getListCvFile() async {
    List<String>? myList = await AppPreferences.getList().then((value) => value);
    if (myList != null) {
      List<Cvfile> newList = myList.map((e) => Cvfile.fromJson(e)).toList();
      return newList;
    } else {
      return [];
    }
  }
}
