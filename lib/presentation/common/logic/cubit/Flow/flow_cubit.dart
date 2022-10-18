// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:cv_pdf/app/constants.dart';
import 'package:cv_pdf/presentation/common/state_renderer/state_renderer.dart';
import 'package:cv_pdf/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

part 'flow_state.dart';

class FlowCubit extends Cubit<FlowState> {
  FlowCubit() : super(ContentState());
  void toggleFlow({required FlowState flowState}) {
    emit(flowState);
  }
}
