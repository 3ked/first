import '../../../../../domain/models/models.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
part 'cv_list_state.dart';

class CvListCubit extends Cubit<CvListState> {
  CvListCubit() : super(CvListState(files: []));
  void toggleCVFiles(List<Cvfile> newValue) {
    emit(state.copyWith(files: newValue));
  }
}
