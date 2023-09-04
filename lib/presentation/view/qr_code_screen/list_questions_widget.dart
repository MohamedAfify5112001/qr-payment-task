import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:qr_code_demo/app/styles/app_color.dart';
import 'package:qr_code_demo/presentation/view/qr_code_screen/view_item_modal_bottom_sheet.dart';
import 'package:qr_code_demo/presentation/view_model/questions/question_view_model_bloc.dart';

import '../../widgets/custom_date_text_field.dart';
import '../../widgets/custom_text_field.dart';
import 'custom_check_button_widget.dart';
import 'custom_radio_button_widget.dart';

class QuestionsItems extends StatelessWidget {
  const QuestionsItems({
    super.key,
    required Map<int, GlobalKey<State<StatefulWidget>>> itemKeys,
    required this.typeYourNameController,
    required this.dateController,
    required this.mounted,
  }) : _itemKeys = itemKeys;

  final Map<int, GlobalKey<State<StatefulWidget>>> _itemKeys;
  final TextEditingController typeYourNameController;
  final TextEditingController dateController;
  final bool mounted;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      primary: false,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        if (BlocProvider.of<QuestionViewModelBloc>(context)
                .questions[index]
                .typeId ==
            4) {
          final question =
              BlocProvider.of<QuestionViewModelBloc>(context).questions[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: CustomRadioButton(
              key: _itemKeys[index],
              questionId: question.id,
              title: question.title,
              itemCount: question.options.length,
              optionEntity: question.options,
            ),
          );
        } else if (BlocProvider.of<QuestionViewModelBloc>(context)
                .questions[index]
                .typeId ==
            5) {
          final question =
              BlocProvider.of<QuestionViewModelBloc>(context).questions[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: CustomCheckButton(
              key: _itemKeys[index],
              questionId: question.id,
              title: question.title,
              itemCount: question.options.length,
              optionEntity: question.options,
            ),
          );
        } else if (BlocProvider.of<QuestionViewModelBloc>(context)
                .questions[index]
                .typeId ==
            1) {
          final question =
              BlocProvider.of<QuestionViewModelBloc>(context).questions[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: CustomTextField(
              key: _itemKeys[index],
              questionId: question.id,
              onChanged: (value) =>
                  BlocProvider.of<QuestionViewModelBloc>(context).add(
                TypingInTextFormFieldForTextTypeEvent(
                  answer: value,
                  questionId: question.id,
                ),
              ),
              label: question.label,
              title: question.title,
              controller: typeYourNameController,
            ),
          );
        } else if (BlocProvider.of<QuestionViewModelBloc>(context)
                .questions[index]
                .typeId ==
            6) {
          final question =
              BlocProvider.of<QuestionViewModelBloc>(context).questions[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: CustomDatePickerTextField(
              key: _itemKeys[index],
              label: question.label,
              title: question.title,
              controller: dateController,
              suffixIcon: InkWell(
                splashColor: AppColors.greyColor1,
                onTap: () async {
                  DateTime? selectedDateTime = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1997),
                    lastDate: DateTime(2101),
                  );
                  final convertSelectedDateTime =
                      DateFormat('dd-MM-yyyy').format(selectedDateTime!);
                  dateController.text = convertSelectedDateTime;
                  if (!mounted) return;
                  BlocProvider.of<QuestionViewModelBloc>(context).add(
                    TypingInTextFormFieldForDateTypeEvent(
                      questionId: question.id,
                      answer: convertSelectedDateTime,
                    ),
                  );
                },
                child: SvgPicture.asset(
                  'assets/images/ic_timework.svg',
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: SizedBox(
            width: double.infinity,
            height:
                BlocProvider.of<QuestionViewModelBloc>(context).selectedImage !=
                        null
                    ? null
                    : 117.0,
            child: GestureDetector(
              key: _itemKeys[index],
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) {
                    final question =
                        BlocProvider.of<QuestionViewModelBloc>(context)
                            .questions[index];
                    return ViewItemsForModalBottomSheetWidget(
                      questionId: question.id,
                    );
                  },
                );
              },
              child: BlocProvider.of<QuestionViewModelBloc>(context)
                          .selectedImage !=
                      null
                  ? Image.file(
                      fit: BoxFit.cover,
                      BlocProvider.of<QuestionViewModelBloc>(context)
                          .selectedImage!)
                  : DottedBorder(
                      radius: const Radius.circular(8.0),
                      color: AppColors.primaryColor,
                      borderType: BorderType.RRect,
                      strokeWidth: 1.0,
                      dashPattern: const [6, 2],
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.image_outlined,
                              color: AppColors.primaryColor,
                              size: 32.0,
                            ),
                            const SizedBox(
                              height: 17.0,
                            ),
                            Text(
                              'Upload your ID',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: AppColors.greyColor2,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemCount:
          BlocProvider.of<QuestionViewModelBloc>(context).questions.length,
    );
  }
}
