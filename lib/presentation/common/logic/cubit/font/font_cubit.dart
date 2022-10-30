import 'package:cv_pdf/presentation/resources/assets_manager.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class FontCubit extends HydratedCubit<String> {
  FontCubit() : super(FontAssets.hacenTunisia);
  void toggleFont({required String font}) {
    emit(font);
  }

  @override
  String? fromJson(Map<String, dynamic> json) {
    return json["font"];
  }

  @override
  Map<String, dynamic>? toJson(String state) {
    return {"font": state};
  }
}
