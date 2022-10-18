import 'package:bloc/bloc.dart';

class CounterTextCubit extends Cubit<int> {
  CounterTextCubit() : super(0);

  int numberText({required int value}) {
    emit(value);
    return value;
  }

  void increment() {
    emit(state + 1);
  }

  void decrement() {
    emit(state - 1);
  }
}
