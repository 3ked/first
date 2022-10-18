import 'package:bloc/bloc.dart';

import '../../../../../domain/models/models.dart';

part 'cv_format_state.dart';

class CvFormatCubit extends Cubit<CvFormatState> {
  CvFormatCubit()
      : super(CvFormatState(
            cvFormat: CvFormat(
                fullNameFontSize: 30,
                profileLine: 4,
                languagesLines: 4,
                achievementsLines: 4,
                interestsAndHobbiesLines: 4,
                workExperienceLines: 4,
                educationalQualificationsLines: 4,
                personalExperienceAndSkillsLines: 4)));
  void toggleCvFormat(CvFormat newValue) {
    emit(state.copyWith(cvFormat: newValue));
  }

  void toggleFullNameFontSize(double newValue) {
    emit(state.copyWith(cvFormat: state.cvFormat.copyWith(fullNameFontSize: newValue)));
  }

  void toggleProfileLine(double newValue) {
    emit(state.copyWith(cvFormat: state.cvFormat.copyWith(profileLine: newValue)));
  }

  void toggleLanguagesLines(double newValue) {
    emit(state.copyWith(cvFormat: state.cvFormat.copyWith(languagesLines: newValue)));
  }

  void toggleAchievements(double newValue) {
    emit(state.copyWith(cvFormat: state.cvFormat.copyWith(achievementsLines: newValue)));
  }

  void toggleInterestsAndHobbiesLines(double newValue) {
    emit(state.copyWith(cvFormat: state.cvFormat.copyWith(interestsAndHobbiesLines: newValue)));
  }

  void toggleWorkExperienceLines(double newValue) {
    emit(state.copyWith(cvFormat: state.cvFormat.copyWith(workExperienceLines: newValue)));
  }

  void toggleEducationalQualificationsLines(double newValue) {
    emit(state.copyWith(
        cvFormat: state.cvFormat.copyWith(educationalQualificationsLines: newValue)));
  }

  void togglePersonalExperienceAndSkillsLines(double newValue) {
    emit(state.copyWith(
        cvFormat: state.cvFormat.copyWith(personalExperienceAndSkillsLines: newValue)));
  }
}
