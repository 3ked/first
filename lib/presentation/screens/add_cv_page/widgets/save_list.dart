import 'dart:io';

import 'package:cv_pdf/presentation/common/logic/cubit/cv_list/cv_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/app_prefs.dart';
import '../../../../domain/models/models.dart';

void buildSaveEditList(
  CvListState state,
  file,
  BuildContext context,
  File? image,
  List<TextEditingController> myController,
  Arguments argument,
  CvFormat cvFormat,
  bool isChanged,
) {
  state.files[file.index] = Cvfile(
      CvFormat(
        fullNameFontSize: cvFormat.fullNameFontSize,
        profileLine: cvFormat.profileLine,
        languagesLines: cvFormat.languagesLines,
        achievementsLines: cvFormat.achievementsLines,
        interestsAndHobbiesLines: cvFormat.interestsAndHobbiesLines,
        workExperienceLines: cvFormat.workExperienceLines,
        educationalQualificationsLines: cvFormat.educationalQualificationsLines,
        personalExperienceAndSkillsLines: cvFormat.personalExperienceAndSkillsLines,
      ),
      image == null
          ? argument.cvfile!.image.isNotEmpty && !isChanged
              ? argument.cvfile!.image
              : ""
          : AppPreferences.base64String(image.readAsBytesSync()),
      myController[0].text,
      myController[1].text,
      myController[2].text,
      myController[3].text,
      myController[4].text,
      myController[5].text,
      myController[6].text,
      myController[7].text,
      myController[8].text,
      myController[9].text,
      myController[10].text,
      myController[11].text,
      myController[12].text);
  var newValue = state.files;
  context.read<CvListCubit>().toggleCVFiles(newValue);
  final List<String> myList = newValue.map((e) => e.toJson()).toList();
  AppPreferences.saveList(myList);
}

void buildSaveList(
  CvListState state,
  BuildContext context,
  File? image,
  List<TextEditingController> myController,
  CvFormat cvFormat,
) {
  var value = Cvfile(
      CvFormat(
        fullNameFontSize: cvFormat.fullNameFontSize,
        profileLine: cvFormat.profileLine,
        languagesLines: cvFormat.languagesLines,
        achievementsLines: cvFormat.achievementsLines,
        interestsAndHobbiesLines: cvFormat.interestsAndHobbiesLines,
        workExperienceLines: cvFormat.workExperienceLines,
        educationalQualificationsLines: cvFormat.educationalQualificationsLines,
        personalExperienceAndSkillsLines: cvFormat.personalExperienceAndSkillsLines,
      ),
      image == null ? "" : AppPreferences.base64String(image.readAsBytesSync()),
      myController[0].text,
      myController[1].text,
      myController[2].text,
      myController[3].text,
      myController[4].text,
      myController[5].text,
      myController[6].text,
      myController[7].text,
      myController[8].text,
      myController[9].text,
      myController[10].text,
      myController[11].text,
      myController[12].text);
  state.files.add(value);
  var newValue = state.files;
  context.read<CvListCubit>().toggleCVFiles(newValue);
  final List<String> myList = newValue.map((e) => e.toJson()).toList();
  AppPreferences.saveList(myList);
}
