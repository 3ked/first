import 'package:bloc/bloc.dart';

class DropDownSelectedCubit extends Cubit<String?> {
  DropDownSelectedCubit() : super(null);
  void toggleSelected({required String value}) {
    emit(value);
  }
}
