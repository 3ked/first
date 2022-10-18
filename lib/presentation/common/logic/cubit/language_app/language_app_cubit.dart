import 'package:cv_pdf/presentation/resources/language_manager.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

//part 'language_app_state.dart';

class LanguageAppCubit extends HydratedCubit<LanguageType> {
  LanguageAppCubit() : super(LanguageType.arabic);

  void toggleLanguage({required LanguageType language}) {
    emit(language);
  }

  @override
  LanguageType? fromJson(Map<String, dynamic> json) {
    return LanguageType.values[json["language"] as int];
  }

  @override
  Map<String, dynamic>? toJson(LanguageType state) {
    return <String, int>{"language": state.index};
  }
}
