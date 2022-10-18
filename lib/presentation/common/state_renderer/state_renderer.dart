import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/values_manager.dart';

enum StateRendererType {
// POPUP STATRS (DIALOG)

  popUpLoadingState,
  popUpErrorState,
  popUpSuccess,

// FULL SCREEN STATED (FULL SCREEN)

  fullScreenLoadingState,
  fullScreenErrorState,
  fullScreenEmptyState,

  // general
  contentState
}

class StateRenderer extends StatelessWidget {
  final StateRendererType stateRendererType;
  final String message;
  final String title;
  final Function retryActionFunction;

  const StateRenderer(
      {Key? key,
      required this.stateRendererType,
      this.message = AppStrings.loading,
      this.title = "",
      required this.retryActionFunction})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return _getStateWidget(context);
  }

  Widget _getStateWidget(BuildContext context) {
    switch (stateRendererType) {
      case StateRendererType.popUpLoadingState:
        return _getPopUpDialog(context, [_getAnimatedImage(JsonAssets.loading)]);
      case StateRendererType.popUpErrorState:
        return _getPopUpDialog(context, [
          _getAnimatedImage(JsonAssets.error),
          _getMessage(context, message),
          _getRetryButton(AppStrings.ok.tr(), context)
        ]);
      case StateRendererType.fullScreenLoadingState:
        return _getItemsColumn(
            [_getAnimatedImage(JsonAssets.loading), _getMessage(context, message)]);
      case StateRendererType.fullScreenErrorState:
        return _getItemsColumn([
          _getAnimatedImage(JsonAssets.error),
          _getMessage(context, message),
          _getRetryButton(AppStrings.retryAgain.tr(), context)
        ]);
      case StateRendererType.fullScreenEmptyState:
        return _getItemsColumn(
            [_getAnimatedImage(JsonAssets.empty), _getMessage(context, message)]);
      case StateRendererType.contentState:
        return Container();
      case StateRendererType.popUpSuccess:
        return _getPopUpDialog(context, [
          _getAnimatedImage(JsonAssets.success),
          _getMessage(context, title),
          _getMessage(context, message),
          _getRetryButton(AppStrings.ok.tr(), context)
        ]);
      default:
        return Container();
    }
  }

  Widget _getPopUpDialog(BuildContext context, List<Widget> children) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s12R)),
      elevation: AppSize.s1_5SP,
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(AppSize.s12R),
            boxShadow: [BoxShadow(color: ColorManager.black26)]),
        child: _getDialogContent(context, children),
      ),
    );
  }

  Widget _getDialogContent(BuildContext context, List<Widget> children) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getItemsColumn(List<Widget> children) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getAnimatedImage(String animationName) {
    return SizedBox(
      width: AppSize.s235W,
      height: AppSize.s235H,
      child: Lottie.asset(animationName),
    );
  }

  Widget _getMessage(BuildContext context, String message) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(AppPadding.p8SP),
        child: Text(
          message,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }

  Widget _getRetryButton(String buttonTitle, BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(AppPadding.p14SP),
        child: SizedBox(
            width: AppSize.sInfinity,
            child: ElevatedButton(
                onPressed: () {
                  if (stateRendererType == StateRendererType.fullScreenErrorState) {
                    // call retry function
                    retryActionFunction.call();
                  } else {
                    // popup error state
                    Navigator.of(context).pop();
                  }
                },
                child: Text(buttonTitle))),
      ),
    );
  }
}
