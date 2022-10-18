// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cv_format_cubit.dart';

class CvFormatState {
  CvFormat cvFormat;
  CvFormatState({
    required this.cvFormat,
  });

  CvFormatState copyWith({
    CvFormat? cvFormat,
  }) {
    return CvFormatState(
      cvFormat: cvFormat ?? this.cvFormat,
    );
  }
}
