import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_demo/app/styles/app_color.dart';
import 'package:qr_code_demo/presentation/view_model/questions/question_view_model_bloc.dart';
import 'package:qr_code_demo/presentation/widgets/alert_dialog_widget.dart';

import '../../widgets/custom_button.dart';
import 'list_questions_widget.dart';

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({super.key});

  @override
  State<QrCodeScreen> createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<QuestionViewModelBloc>(context).add(FetchQuestionsEvent());
  }

  final ScrollController _scrollController = ScrollController();
  final Map<int, GlobalKey> _itemKeys = {};
  final TextEditingController typeYourNameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  @override
  void dispose() {
    _scrollController.dispose();
    typeYourNameController.dispose();
    dateController.dispose();
    super.dispose();
  }

  void scrollToItem(int itemId) {
    if (_itemKeys.containsKey(itemId)) {
      final RenderBox itemRenderBox =
          _itemKeys[itemId]?.currentContext!.findRenderObject() as RenderBox;
      final itemPosition = itemRenderBox.localToGlobal(Offset.zero);
      _scrollController.animateTo(
        itemPosition.dy,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: BlocConsumer<QuestionViewModelBloc, QuestionViewModelState>(
        listener: (context, state) {
          if (state is FetchingQuestionSuccessState) {
            final questions =
                BlocProvider.of<QuestionViewModelBloc>(context).questions;
            for (var question in questions) {
              _itemKeys[questions.indexOf(question)] = GlobalKey();
            }
          }
          if (state is PickedImageFromGalleryFailedState) {
            Navigator.of(context).pop();
            showDialog(
              context: context,
              builder: (context) => AppAlertDialog(
                onConfirm: () => openAppSettings(),
                title: SvgPicture.asset('assets/images/Frame.svg'),
                subtitle:
                    'Gallery permission should Be granted to use this feature, would you like to go to app settings to give photos permission?',
              ),
            );
          }
          if (state is PickedImageFromCameraFailedState) {
            Navigator.of(context).pop();
            showDialog(
              context: context,
              builder: (context) => AppAlertDialog(
                onConfirm: () => openAppSettings(),
                title: SvgPicture.asset('assets/images/Frame.svg'),
                subtitle:
                    'Camera permission should Be granted to use this feature, would you like to go to app settings to give camera permission?',
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is FetchingQuestionInProgressState) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            );
          } else {
            return SingleChildScrollView(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 10.0),
                child: Column(
                  children: [
                    QuestionsItems(
                      itemKeys: _itemKeys,
                      typeYourNameController: typeYourNameController,
                      dateController: dateController,
                      mounted: mounted,
                    ),
                    const SizedBox(height: 69.0),
                    SizedBox(
                      width: double.infinity,
                      height: 48.0,
                      child: Container(
                        decoration: const BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: AppColors.primaryColorWithAlpha,
                            spreadRadius: 0.0,
                            blurRadius: 24.0,
                            offset: Offset(0, 4),
                          )
                        ]),
                        child: CustomButton(
                          onPressed: () {
                            final questions =
                                BlocProvider.of<QuestionViewModelBloc>(context)
                                    .questions;
                            for (int i = 0; i < questions.length; i++) {
                              if (questions[i].isMandatory &&
                                  questions[i].answer == null) {
                                if (questions[i].typeId == 4) {
                                  BlocProvider.of<QuestionViewModelBloc>(
                                          context)
                                      .add(
                                    ValidationMessageOnRadioButtonQuestionEvent(
                                      questionId: questions[i].id,
                                      typeId: questions[i].typeId,
                                    ),
                                  );
                                  scrollToItem(i);
                                } else if (questions[i].typeId == 5) {
                                  BlocProvider.of<QuestionViewModelBloc>(
                                          context)
                                      .add(
                                    ValidationMessageOnCheckButtonButtonQuestionEvent(
                                      questionId: questions[i].id,
                                    ),
                                  );
                                  scrollToItem(i);
                                } else if (questions[i].typeId == 1) {
                                  BlocProvider.of<QuestionViewModelBloc>(
                                          context)
                                      .add(
                                    ValidationMessageOnTextFormFieldFotTextQuestionEvent(
                                      questionId: questions[i].id,
                                    ),
                                  );
                                  scrollToItem(i);
                                }
                                break;
                              }
                            }
                            // const int index = 0;
                          },
                          child: Text(
                            'Create',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                  color: AppColors.whiteColor,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  //CustomRadioButton(title: 'Guest Type',itemCount: 4),
  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0.0,
      title: Text(
        'QR Code',
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: 18.0,
            ),
      ),
    );
  }
}
