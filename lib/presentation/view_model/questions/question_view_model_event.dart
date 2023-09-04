part of 'question_view_model_bloc.dart';

sealed class QuestionViewModelEvent extends Equatable {
  const QuestionViewModelEvent();
}

final class FetchQuestionsEvent extends QuestionViewModelEvent {
  @override
  List<Object> get props => [];
}

final class ChoosingFromRadioButtonEvent extends QuestionViewModelEvent {
  final String questionId;
  final String currentId;

  const ChoosingFromRadioButtonEvent({
    required this.questionId,
    required this.currentId,
  });

  @override
  List<Object> get props => [currentId, questionId];
}

final class ChoosingFromCheckButtonEvent extends QuestionViewModelEvent {
  final String questionId;
  final String currentId;

  const ChoosingFromCheckButtonEvent({
    required this.questionId,
    required this.currentId,
  });

  @override
  List<Object> get props => [currentId, questionId];
}

final class TypingInTextFormFieldForTextTypeEvent
    extends QuestionViewModelEvent {
  final String questionId;
  final String answer;

  const TypingInTextFormFieldForTextTypeEvent({
    required this.questionId,
    required this.answer,
  });

  @override
  List<Object> get props => [answer, questionId];
}

final class TypingInTextFormFieldForDateTypeEvent
    extends QuestionViewModelEvent {
  final String questionId;
  final String answer;

  const TypingInTextFormFieldForDateTypeEvent({
    required this.questionId,
    required this.answer,
  });

  @override
  List<Object> get props => [answer, questionId];
}

final class PickedImageFromGalleryEvent extends QuestionViewModelEvent {
  final String questionId;

  const PickedImageFromGalleryEvent({required this.questionId});

  @override
  List<Object> get props => [questionId];
}

final class PickedImageFromCameraEvent extends QuestionViewModelEvent {
  final String questionId;

  const PickedImageFromCameraEvent({required this.questionId});

  @override
  List<Object> get props => [questionId];
}

final class ValidationMessageOnRadioButtonQuestionEvent
    extends QuestionViewModelEvent {
  final String questionId;
  final int typeId;

  const ValidationMessageOnRadioButtonQuestionEvent({
    required this.questionId,
    required this.typeId,
  });

  @override
  List<Object> get props => [questionId, typeId];
}

final class ValidationMessageOnCheckButtonButtonQuestionEvent
    extends QuestionViewModelEvent {
  final String questionId;

  const ValidationMessageOnCheckButtonButtonQuestionEvent({
    required this.questionId,
  });

  @override
  List<Object> get props => [questionId];
}
final class ValidationMessageOnTextFormFieldFotTextQuestionEvent
    extends QuestionViewModelEvent {
  final String questionId;

  const ValidationMessageOnTextFormFieldFotTextQuestionEvent({
    required this.questionId,
  });

  @override
  List<Object> get props => [questionId];
}
