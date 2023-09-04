import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../app/styles/app_color.dart';
import '../../../domain/entities/question_entity.dart';
import '../../view_model/questions/question_view_model_bloc.dart';

class CustomCheckButton extends StatelessWidget {
  final String title;
  final int itemCount;
  final List<OptionEntity> optionEntity;
  final String questionId;

  const CustomCheckButton({
    super.key,
    required this.title,
    required this.itemCount,
    this.optionEntity = const [],
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
            SizedBox(
              height: 35.0,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                itemCount: itemCount,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    BlocProvider.of<QuestionViewModelBloc>(context).add(
                      ChoosingFromCheckButtonEvent(
                        questionId: questionId,
                        currentId: optionEntity[index].id,
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    margin: index != itemCount - 1
                        ? const EdgeInsets.only(right: 12.0)
                        : null,
                    height: 34.0,
                    constraints: const BoxConstraints(minWidth: 92.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.0,
                        color: optionEntity[index].isSelected
                            ? AppColors.primaryColor
                            : AppColors.greyColor1,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 19.0,
                          width: 19.0,
                          decoration: BoxDecoration(
                            color: optionEntity[index].isSelected
                                ? AppColors.primaryColor
                                : AppColors.greyColor1,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(4.0),
                            ),
                          ),
                          child: optionEntity[index].isSelected
                              ? SvgPicture.asset(
                                  'assets/images/done.svg',
                                  fit: BoxFit.scaleDown,
                                )
                              : null,
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          optionEntity[index].title,
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: optionEntity[index].isSelected
                                        ? AppColors.primaryColor
                                        : AppColors.greyColor2,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            state is ValidationMessageOnCheckButtonQuestionState &&
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
