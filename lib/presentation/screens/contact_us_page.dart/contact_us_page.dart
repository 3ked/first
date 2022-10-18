// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cv_pdf/app/di.dart';
import 'package:cv_pdf/domain/usecase/message_usecase.dart';
import 'package:cv_pdf/presentation/common/logic/cubit/Flow/flow_cubit.dart';
import 'package:cv_pdf/presentation/common/state_renderer/state_renderer.dart';
import 'package:cv_pdf/presentation/resources/color_manager.dart';
import 'package:cv_pdf/presentation/resources/strings_manager.dart';
import 'package:cv_pdf/presentation/resources/values_manager.dart';
import 'package:cv_pdf/presentation/widgets/show_snack_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsPage extends StatelessWidget {
  ContactUsPage({
    Key? key,
  }) : super(key: key);

  final MessageUseCase _messageUseCase = instance<MessageUseCase>();

  final TextEditingController subjectEditingController = TextEditingController();

  final TextEditingController messageEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlowCubit, FlowState>(
      builder: (context, state) {
        return state.getScreenWidget(context, _contentScreenWidget(context), () {
          sendMessage(
            context: context,
            subject: subjectEditingController.text,
            message: messageEditingController.text,
          );
        });
      },
    );
  }

  Widget _contentScreenWidget(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppPadding.p8SP),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: AppPadding.p40H, bottom: AppPadding.p8H),
                child: Text("${AppStrings.subject.tr()} : "),
              ),
              TextFormField(
                controller: subjectEditingController,
                maxLines: 2,
                decoration: InputDecoration(
                  hintText: AppStrings.subject.tr(),
                  labelText: AppStrings.subject.tr(),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: AppPadding.p40H, bottom: AppPadding.p8H),
                child: Text("${AppStrings.message.tr()} : "),
              ),
              TextFormField(
                controller: messageEditingController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: AppStrings.message.tr(),
                  labelText: AppStrings.message.tr(),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: AppPadding.p8H, bottom: AppPadding.p8H),
                child: Center(
                    child: Text(
                  AppStrings.messageContact.tr(),
                  style: TextStyle(color: ColorManager.grey),
                )),
              ),
              Padding(
                padding: EdgeInsets.only(top: AppPadding.p8H),
                child: Center(
                  child: BlocBuilder<FlowCubit, FlowState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        child: Text(AppStrings.send.tr()),
                        onPressed: () async {
                          sendMessage(
                            context: context,
                            subject: subjectEditingController.text,
                            message: messageEditingController.text,
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              const Flexible(
                  child: SizedBox(
                height: double.infinity,
              )),
              Center(
                  child: TextButton(
                      onPressed: () async {
                        final Uri _emailUrl = Uri(scheme: "mailto", path: "procvpdf@gmail.com");
                        try {
                          if (await canLaunchUrl(_emailUrl)) {
                            await launchUrl(
                              _emailUrl,
                              mode: LaunchMode.externalApplication,
                              webViewConfiguration: const WebViewConfiguration(
                                enableJavaScript: false,
                                enableDomStorage: false,
                              ),
                            );
                          } else {
                            throw "${AppStrings.notLaunch.tr()} procvpdf@gmail.com";
                          }
                        } catch (e) {
                          showSnackBar(context, e.toString());
                        }
                      },
                      child: Center(
                        child: Text(
                          AppStrings.connectEmail.tr(),
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Theme.of(context).colorScheme.primary),
                        ),
                      )))
            ],
          ),
        ),
      ),
    );
  }

  Future sendMessage({
    required BuildContext context,
    required String subject,
    required String message,
  }) async {
    context.read<FlowCubit>().toggleFlow(
        flowState: LoadingState(stateRendererType: StateRendererType.popUpLoadingState));
    (await _messageUseCase.execute(MessageUseCaseInput(subject: subject, message: message))).fold(
        (failure) => {
              // left -> failure
              context.read<FlowCubit>().toggleFlow(
                  flowState: ErrorState(StateRendererType.popUpErrorState, failure.message.tr())),
            }, (data) {
      // right -> data(success)
      context.read<FlowCubit>().toggleFlow(flowState: SuccessState(AppStrings.successMessage.tr()));
    });
  }
}
