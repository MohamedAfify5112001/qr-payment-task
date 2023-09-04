import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_code_demo/app/styles/app_color.dart';
import 'package:qr_code_demo/presentation/view_model/questions/question_view_model_bloc.dart';

class ViewItemsForModalBottomSheetWidget extends StatelessWidget {
  final String questionId;

  const ViewItemsForModalBottomSheetWidget({
    super.key,
    required this.questionId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<QuestionViewModelBloc, QuestionViewModelState>(
      listener: (context, state) {
        if (state is PickedImageFromCameraSuccessState ||
            state is PickedImageFromGallerySuccessState) {
          Navigator.of(context).pop();
        }
      },
      child: Container(
        height: 219.0,
        decoration: const BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32.0),
            topRight: Radius.circular(32.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: SvgPicture.asset(
                      'assets/images/ic_close.svg',
                    ),
                  )
                ],
              ),
              Text(
                'Upload Media',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(fontSize: 18.0),
              ),
              const SizedBox(
                height: 32.0,
              ),
              MethodsGetImageWidget(questionId: questionId),
            ],
          ),
        ),
      ),
    );
  }
}

class MethodsGetImageWidget extends StatelessWidget {
  final String questionId;

  const MethodsGetImageWidget({
    super.key,
    required this.questionId,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GalleryMethodWidget(questionId: questionId),
        const SizedBox(
          width: 61.0,
        ),
        CameraMethodWidget(
          questionId: questionId,
        ),
      ],
    );
  }
}

class CameraMethodWidget extends StatelessWidget {
  final String questionId;

  const CameraMethodWidget({
    super.key,
    required this.questionId,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            BlocProvider.of<QuestionViewModelBloc>(context)
                .add(PickedImageFromCameraEvent(questionId: questionId));
          },
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.lightPurpleColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.blackColorWithAlpha,
                  spreadRadius: 0.0,
                  offset: Offset(0, 4),
                  blurRadius: 24.0,
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: SvgPicture.asset(
                  'assets/images/ic_camera.svg',
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        Text(
          'Camera',
          style: Theme.of(context).textTheme.bodySmall,
        )
      ],
    );
  }
}

class GalleryMethodWidget extends StatelessWidget {
  final String questionId;

  const GalleryMethodWidget({
    super.key,
    required this.questionId,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            BlocProvider.of<QuestionViewModelBloc>(context)
                .add(PickedImageFromGalleryEvent(questionId: questionId));
          },
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.lightPurpleColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.blackColorWithAlpha,
                  spreadRadius: 0.0,
                  offset: Offset(0, 4),
                  blurRadius: 24.0,
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: SvgPicture.asset(
                  'assets/images/ic_gallary.svg',
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        Text(
          'Gallary',
          style: Theme.of(context).textTheme.bodySmall,
        )
      ],
    );
  }
}
