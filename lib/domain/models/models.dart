// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class SendMessage {
  String userSubject;
  String userMessage;
  SendMessage(this.userSubject, this.userMessage);
}

class CvFormat {
  double fullNameFontSize;
  double profileLine;
  double languagesLines;
  double achievementsLines;
  double interestsAndHobbiesLines;
  double workExperienceLines;
  double educationalQualificationsLines;
  double personalExperienceAndSkillsLines;
  CvFormat({
    required this.fullNameFontSize,
    required this.profileLine,
    required this.languagesLines,
    required this.achievementsLines,
    required this.interestsAndHobbiesLines,
    required this.workExperienceLines,
    required this.educationalQualificationsLines,
    required this.personalExperienceAndSkillsLines,
  });

  CvFormat copyWith({
    double? fullNameFontSize,
    double? profileLine,
    double? languagesLines,
    double? achievementsLines,
    double? interestsAndHobbiesLines,
    double? workExperienceLines,
    double? educationalQualificationsLines,
    double? personalExperienceAndSkillsLines,
  }) {
    return CvFormat(
      fullNameFontSize: fullNameFontSize ?? this.fullNameFontSize,
      profileLine: profileLine ?? this.profileLine,
      languagesLines: languagesLines ?? this.languagesLines,
      achievementsLines: achievementsLines ?? this.achievementsLines,
      interestsAndHobbiesLines: interestsAndHobbiesLines ?? this.interestsAndHobbiesLines,
      workExperienceLines: workExperienceLines ?? this.workExperienceLines,
      educationalQualificationsLines:
          educationalQualificationsLines ?? this.educationalQualificationsLines,
      personalExperienceAndSkillsLines:
          personalExperienceAndSkillsLines ?? this.personalExperienceAndSkillsLines,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fullNameFontSize': fullNameFontSize,
      'profileLine': profileLine,
      'languagesLines': languagesLines,
      'achievementsLines': achievementsLines,
      'interestsAndHobbiesLines': interestsAndHobbiesLines,
      'workExperienceLines': workExperienceLines,
      'educationalQualificationsLines': educationalQualificationsLines,
      'personalExperienceAndSkillsLines': personalExperienceAndSkillsLines,
    };
  }

  factory CvFormat.fromMap(Map<String, dynamic> map) {
    return CvFormat(
      fullNameFontSize: map['fullNameFontSize'] as double,
      profileLine: map['profileLine'] as double,
      languagesLines: map['languagesLines'] as double,
      achievementsLines: map['achievementsLines'] as double,
      interestsAndHobbiesLines: map['interestsAndHobbiesLines'] as double,
      workExperienceLines: map['workExperienceLines'] as double,
      educationalQualificationsLines: map['educationalQualificationsLines'] as double,
      personalExperienceAndSkillsLines: map['personalExperienceAndSkillsLines'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory CvFormat.fromJson(String source) =>
      CvFormat.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Arguments {
  Cvfile? cvfile;
  int index;
  Arguments({
    required this.cvfile,
    required this.index,
  });
}

class Cvfile {
  CvFormat cvFormat;
  String image;
  String fullName;
  String profile;
  String phoneNumber;
  String emailAddress;
  String website;
  String homeAdress;
  String ageAndMaritalStatus;
  String languages;
  String achievements;
  String interestsAndHobbies;
  String workExperience;
  String educationalQualifications;
  String personalExperienceAndSkills;
  Cvfile(
      this.cvFormat,
      this.image,
      this.fullName,
      this.profile,
      this.phoneNumber,
      this.emailAddress,
      this.website,
      this.homeAdress,
      this.ageAndMaritalStatus,
      this.languages,
      this.achievements,
      this.interestsAndHobbies,
      this.workExperience,
      this.educationalQualifications,
      this.personalExperienceAndSkills);
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cvFormat': cvFormat.toMap(),
      'image': image,
      'fullName': fullName,
      'profile': profile,
      'phoneNumber': phoneNumber,
      'emailAddress': emailAddress,
      'website': website,
      'homeAdress': homeAdress,
      'ageAndMaritalStatus': ageAndMaritalStatus,
      'languages': languages,
      'achievements': achievements,
      'interestsAndHobbies': interestsAndHobbies,
      'workExperience': workExperience,
      'educationalQualifications': educationalQualifications,
      'personalExperienceAndSkills': personalExperienceAndSkills,
    };
  }

  factory Cvfile.fromMap(Map<String, dynamic> map) {
    return Cvfile(
      CvFormat.fromMap(map['cvFormat'] as Map<String, dynamic>),
      map['image'] as String,
      map['fullName'] as String,
      map['profile'] as String,
      map['phoneNumber'] as String,
      map['emailAddress'] as String,
      map['website'] as String,
      map['homeAdress'] as String,
      map['ageAndMaritalStatus'] as String,
      map['languages'] as String,
      map['achievements'] as String,
      map['interestsAndHobbies'] as String,
      map['workExperience'] as String,
      map['educationalQualifications'] as String,
      map['personalExperienceAndSkills'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cvfile.fromJson(String source) =>
      Cvfile.fromMap(json.decode(source) as Map<String, dynamic>);

  Cvfile copyWith({
    CvFormat? cvFormat,
    String? image,
    String? fullName,
    String? profile,
    String? phoneNumber,
    String? emailAddress,
    String? website,
    String? homeAdress,
    String? ageAndMaritalStatus,
    String? languages,
    String? achievements,
    String? interestsAndHobbies,
    String? workExperience,
    String? educationalQualifications,
    String? personalExperienceAndSkills,
  }) {
    return Cvfile(
      cvFormat ?? this.cvFormat,
      image ?? this.image,
      fullName ?? this.fullName,
      profile ?? this.profile,
      phoneNumber ?? this.phoneNumber,
      emailAddress ?? this.emailAddress,
      website ?? this.website,
      homeAdress ?? this.homeAdress,
      ageAndMaritalStatus ?? this.ageAndMaritalStatus,
      languages ?? this.languages,
      achievements ?? this.achievements,
      interestsAndHobbies ?? this.interestsAndHobbies,
      workExperience ?? this.workExperience,
      educationalQualifications ?? this.educationalQualifications,
      personalExperienceAndSkills ?? this.personalExperienceAndSkills,
    );
  }

  @override
  String toString() {
    return 'Cvfile(cvFormat: $cvFormat, image: $image, fullName: $fullName, profile: $profile, phoneNumber: $phoneNumber, emailAddress: $emailAddress, website: $website, homeAdress: $homeAdress, ageAndMaritalStatus: $ageAndMaritalStatus, languages: $languages, achievements: $achievements, interestsAndHobbies: $interestsAndHobbies, workExperience: $workExperience, educationalQualifications: $educationalQualifications, personalExperienceAndSkills: $personalExperienceAndSkills)';
  }

  @override
  bool operator ==(covariant Cvfile other) {
    if (identical(this, other)) return true;

    return other.cvFormat == cvFormat &&
        other.image == image &&
        other.fullName == fullName &&
        other.profile == profile &&
        other.phoneNumber == phoneNumber &&
        other.emailAddress == emailAddress &&
        other.website == website &&
        other.homeAdress == homeAdress &&
        other.ageAndMaritalStatus == ageAndMaritalStatus &&
        other.languages == languages &&
        other.achievements == achievements &&
        other.interestsAndHobbies == interestsAndHobbies &&
        other.workExperience == workExperience &&
        other.educationalQualifications == educationalQualifications &&
        other.personalExperienceAndSkills == personalExperienceAndSkills;
  }

  @override
  int get hashCode {
    return cvFormat.hashCode ^
        image.hashCode ^
        fullName.hashCode ^
        profile.hashCode ^
        phoneNumber.hashCode ^
        emailAddress.hashCode ^
        website.hashCode ^
        homeAdress.hashCode ^
        ageAndMaritalStatus.hashCode ^
        languages.hashCode ^
        achievements.hashCode ^
        interestsAndHobbies.hashCode ^
        workExperience.hashCode ^
        educationalQualifications.hashCode ^
        personalExperienceAndSkills.hashCode;
  }
}

class Item {
  String header;
  dynamic body;
  bool isExpanded;
  Item({
    required this.header,
    required this.body,
    this.isExpanded = false,
  });
}

class Section {
  TextInputType textInputType;
  String hintText;
  String labelText;
  int maxLines;
  Section({
    required this.textInputType,
    required this.hintText,
    required this.labelText,
    this.maxLines = 1,
  });
}
