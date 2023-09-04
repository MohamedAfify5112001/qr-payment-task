import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_demo/app/styles/app_color.dart';
import 'package:qr_code_demo/presentation/view_model/questions/question_view_model_bloc.dart';
import 'package:qr_code_demo/presentation/view_model/questions/question_view_model_bloc.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String label;
  final String questionId;
  final TextEditingController controller;
  final Function(String)? onChanged;

  const CustomTextField({
    super.key,
    required this.label,
    required this.title,
    required this.controller,
    this.onChanged,
    required this.questionId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionViewModelBloc, QuestionViewModelState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontSize: 13.0,
                  ),
            ),
            const SizedBox(height: 17.0),
            TextField(
              controller: controller,
              onChanged: onChanged,
              cursorColor: AppColors.blackColor,
              decoration: InputDecoration(hintText: label),
            ),
            state is ValidationMessageOnTextFormFieldFotTextQuestionState &&
                    state.questionId == questionId
                ? Column(
                    children: [
                      const SizedBox(height: 12.0),
                      Text(
                        state.message,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.red,
                            ),
                      ),
                    ],
                  )
                : const SizedBox.shrink()
          ],
        );
      },
    );
  }
}
