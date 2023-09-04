import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_code_demo/app/styles/app_color.dart';
import 'package:qr_code_demo/domain/entities/question_entity.dart';

import '../../view_model/questions/question_view_model_bloc.dart';

class CustomRadioButton extends StatelessWidget {
  final String title;
  final int itemCount;
  final List<OptionEntity> optionEntity;
  final String questionId;

  const CustomRadioButton({
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
                      ChoosingFromRadioButtonEvent(
                        questionId: questionId,
                        currentId: optionEntity[index].id,
                      ),
                    );
                  },
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        margin: index != itemCount - 1
                            ? const EdgeInsets.only(right: 12.0)
                            : null,
                        width: 84.0,
                        height: 34.0,
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
                        child: Center(
                          child: Text(
                            optionEntity[index].title,
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: optionEntity[index].isSelected
                                          ? AppColors.primaryColor
                                          : AppColors.greyColor2,
                                    ),
                          ),
                        ),
                      ),
                      if (optionEntity[index].isSelected)
                        Positioned(
                          right: index == optionEntity.length - 1 ? -10 : 2,
                          top: 7,
                          child: Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.primaryColor),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 7.0, horizontal: 4.0),
                              child: SvgPicture.asset('assets/images/done.svg'),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ),
            state is ValidationMessageOnRadioButtonQuestionState &&
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
//
