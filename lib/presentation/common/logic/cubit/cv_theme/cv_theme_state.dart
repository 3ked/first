// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'cv_theme_cubit.dart';

class CvThemeState {
  final int pageValue;
  final int fontValue;
  CvThemeState({
    required this.pageValue,
    required this.fontValue,
  });

  CvThemeState copyWith({
    int? pageValue,
    int? fontValue,
  }) {
    return CvThemeState(
      pageValue: pageValue ?? this.pageValue,
      fontValue: fontValue ?? this.fontValue,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pageValue': pageValue,
      'fontValue': fontValue,
    };
  }

  factory CvThemeState.fromMap(Map<String, dynamic> map) {
    return CvThemeState(
      pageValue: map['pageValue'] as int,
      fontValue: map['fontValue'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CvThemeState.fromJson(String source) =>
      CvThemeState.fromMap(json.decode(source) as Map<String, dynamic>);
}
