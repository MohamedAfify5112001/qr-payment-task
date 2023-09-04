part of 'question_view_model_bloc.dart';

abstract class QuestionViewModelState {
  QuestionViewModelState();
}

class QuestionViewModelInitial extends QuestionViewModelState {}

class FetchingQuestionInProgressState extends QuestionViewModelState {}

class FetchingQuestionSuccessState extends QuestionViewModelState {
  FetchingQuestionSuccessState();
}

class FetchingQuestionFailedState extends QuestionViewModelState {}

class ChoosingFromRadioButtonState extends QuestionViewModelState {
  ChoosingFromRadioButtonState();
}

class ChoosingFromCheckBoxState extends QuestionViewModelState {
  ChoosingFromCheckBoxState();
}

class TypingInTextFormFieldForTextTypeState extends QuestionViewModelState {
  TypingInTextFormFieldForTextTypeState();
}

class TypingInTextFormFieldForDateTypeState extends QuestionViewModelState {
  TypingInTextFormFieldForDateTypeState();
}

class PickedImageFromGallerySuccessState extends QuestionViewModelState {
  PickedImageFromGallerySuccessState();
}

class PickedImageFromGalleryFailedState extends QuestionViewModelState {
  PickedImageFromGalleryFailedState();
}

class PickedImageFromCameraSuccessState extends QuestionViewModelState {
  PickedImageFromCameraSuccessState();
}

class PickedImageFromCameraFailedState extends QuestionViewModelState {
  PickedImageFromCameraFailedState();
}

class ValidationMessageOnRadioButtonQuestionState
    extends QuestionViewModelState {
  final String message;
  final String questionId;

  ValidationMessageOnRadioButtonQuestionState({
    required this.message,
    required this.questionId,
  });
}

class ValidationMessageOnCheckButtonQuestionState
    extends QuestionViewModelState {
  final String message;
  final String questionId;

  ValidationMessageOnCheckButtonQuestionState({
    required this.message,
    required this.questionId,
  });
}

class ValidationMessageOnTextFormFieldFotTextQuestionState
    extends QuestionViewModelState {
  final String message;
  final String questionId;

  ValidationMessageOnTextFormFieldFotTextQuestionState({
    required this.message,
    required this.questionId,
  });
}
