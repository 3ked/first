// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cv_list_cubit.dart';

class CvListState {
  List<Cvfile> files;
  CvListState({
    required this.files,
  });
  CvListState copyWith({
    List<Cvfile>? files,
  }) {
    return CvListState(
      files: files ?? this.files,
    );
  }
}
