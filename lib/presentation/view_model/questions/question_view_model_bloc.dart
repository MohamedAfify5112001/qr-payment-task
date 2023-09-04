import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_demo/app/locator/locator.dart';
import 'package:qr_code_demo/data/services/permission/permission.dart';

import '../../../domain/entities/question_entity.dart';
import '../../../domain/usecase/questions_usecase.dart';

part 'question_view_model_event.dart';

part 'question_view_model_state.dart';

class QuestionViewModelBloc
    extends Bloc<QuestionViewModelEvent, QuestionViewModelState> {
  final QuestionUseCase questionUseCase;
  List<QuestionEntity> questions = [];
  String answerOfTextFormField = "";
  File? selectedImage;
  final List<String> optionsData = [];

  QuestionViewModelBloc({
    required this.questionUseCase,
  }) : super(QuestionViewModelInitial()) {
    on<FetchQuestionsEvent>(_onFetchQuestionsEvent);
    on<ChoosingFromRadioButtonEvent>(_onChoosingGuestTypeEvent);
    on<ChoosingFromCheckButtonEvent>(_onChoosingFromCheckButtonEvent);
    on<TypingInTextFormFieldForTextTypeEvent>(
        _onTypingInTextFormFieldForTextTypeEvent);
    on<TypingInTextFormFieldForDateTypeEvent>(
        _onTypingInTextFormFieldForDateTypeEvent);
    on<PickedImageFromGalleryEvent>(_onPickedImageFromGalleryEvent);
    on<PickedImageFromCameraEvent>(_onPickedImageFromCameraEvent);
    on<ValidationMessageOnRadioButtonQuestionEvent>(
        _onValidationMessageOnQuestionEvent);
    on<ValidationMessageOnCheckButtonButtonQuestionEvent>(
        _onValidationMessageOnCheckButtonButtonQuestionEvent);
    on<ValidationMessageOnTextFormFieldFotTextQuestionEvent>(
        _onValidationMessageOnTextFormFieldFotTextQuestionEvent);
  }

  Future<void> _onFetchQuestionsEvent(
      FetchQuestionsEvent event, Emitter<QuestionViewModelState> emit) async {
    emit(FetchingQuestionInProgressState());
    final questionsData = await questionUseCase();
    if (questionsData.isNotEmpty) {
      questions = questionsData;
      emit(FetchingQuestionSuccessState());
    } else {
      emit(FetchingQuestionFailedState());
    }
  }

  Future<void> _onChoosingGuestTypeEvent(
      ChoosingFromRadioButtonEvent choosingFromRadioButtonEvent,
      Emitter<QuestionViewModelState> emit) async {
    for (var question in questions) {
      if (question.id == choosingFromRadioButtonEvent.questionId) {
        final options = question.options;
        for (var option in options) {
          if (option.id == choosingFromRadioButtonEvent.currentId) {
            option.isSelected = !option.isSelected;
            if (option.isSelected) {
              question.answer = option.title;
            } else {
              question.answer = null;
            }
          }
        }
      }
    }
    for (var question in questions) {
      if (question.id == choosingFromRadioButtonEvent.questionId) {
        final options = question.options;
        for (var option in options) {
          if (option.id != choosingFromRadioButtonEvent.currentId) {
            option.isSelected = false;
          }
        }
      }
    }
    log("My Data =>$questions");
    emit(ChoosingFromRadioButtonState());
  }

  Future<void> _onChoosingFromCheckButtonEvent(
      ChoosingFromCheckButtonEvent choosingFromCheckButtonEvent,
      Emitter<QuestionViewModelState> emit) async {
    for (var question in questions) {
      if (question.id == choosingFromCheckButtonEvent.questionId) {
        question.answer = [];
        final options = question.options;
        for (var option in options) {
          if (option.id == choosingFromCheckButtonEvent.currentId) {
            option.isSelected = !option.isSelected;
            if (option.isSelected) {
              optionsData.add(option.title);
              // question.answer.add(option.title);
            } else {
              optionsData.remove(option.title);
              // question.answer.remove(option.title);
            }
          }
        }
        question.answer = optionsData;
        if (optionsData.isEmpty) {
          question.answer = null;
        }
      }
    }

    log("My Data All => $questions");

    emit(ChoosingFromCheckBoxState());
  }

  Future<void> _onTypingInTextFormFieldForTextTypeEvent(
      TypingInTextFormFieldForTextTypeEvent
          typingInTextFormFieldForTextTypeEvent,
      Emitter<QuestionViewModelState> emit) async {
    for (var question in questions) {
      if (question.id == typingInTextFormFieldForTextTypeEvent.questionId) {
        question.answer = typingInTextFormFieldForTextTypeEvent.answer;
      }
    }

    emit(TypingInTextFormFieldForTextTypeState());
  }

  Future<void> _onTypingInTextFormFieldForDateTypeEvent(
      TypingInTextFormFieldForDateTypeEvent
          typingInTextFormFieldForDateTypeEvent,
      Emitter<QuestionViewModelState> emit) async {
    for (var question in questions) {
      if (question.id == typingInTextFormFieldForDateTypeEvent.questionId) {
        question.answer = typingInTextFormFieldForDateTypeEvent.answer;
      }
    }
    emit(TypingInTextFormFieldForDateTypeState());
  }

  Future<void> _onPickedImageFromGalleryEvent(
      PickedImageFromGalleryEvent pickedImageFromGalleryEvent,
      Emitter<QuestionViewModelState> emit) async {
    bool isCurrentQuestion = false;
    for (var question in questions) {
      if (question.id == pickedImageFromGalleryEvent.questionId) {
        isCurrentQuestion = true;
        break;
      }
    }
    log("isCurrentQuestion $isCurrentQuestion");
    if (isCurrentQuestion) {
      final PermissionService permissionService = instance<PermissionService>();
      bool isPermissionForGallery =
          await permissionService.handlePhotosPermission();
      log("isPermissionForGallery => $isPermissionForGallery");
      if (isPermissionForGallery) {
        final galleryImage =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        if (galleryImage == null) return;
        final imagePathTemporary = File(galleryImage.path);
        for (var question in questions) {
          if (question.id == pickedImageFromGalleryEvent.questionId) {
            question.answer = galleryImage.path;
          }
          break;
        }
        selectedImage = imagePathTemporary;
        emit(PickedImageFromGallerySuccessState());
      } else {
        emit(PickedImageFromGalleryFailedState());
      }
    }
  }

  Future<void> _onPickedImageFromCameraEvent(
      PickedImageFromCameraEvent pickedImageFromCameraEvent,
      Emitter<QuestionViewModelState> emit) async {
    bool isCurrentQuestion = false;
    for (var question in questions) {
      if (question.id == pickedImageFromCameraEvent.questionId) {
        isCurrentQuestion = true;
        break;
      }
    }
    log("isCurrentQuestion $isCurrentQuestion");
    if (isCurrentQuestion) {
      final PermissionService permissionService = instance<PermissionService>();
      bool isPermissionForCamera =
          await permissionService.handleCameraPermission();
      if (isPermissionForCamera) {
        final galleryImage =
            await ImagePicker().pickImage(source: ImageSource.camera);
        if (galleryImage == null) return;
        final imagePathTemporary = File(galleryImage.path);
        for (var question in questions) {
          if (question.id == pickedImageFromCameraEvent.questionId) {
            question.answer = galleryImage.path;
          }
          break;
        }
        selectedImage = imagePathTemporary;
        emit(PickedImageFromCameraSuccessState());
      } else {
        emit(PickedImageFromCameraFailedState());
      }
    }
  }

  Future<void> _onValidationMessageOnQuestionEvent(
      ValidationMessageOnRadioButtonQuestionEvent event,
      Emitter<QuestionViewModelState> emit) async {
    final questionId = event.questionId;
    bool isCurrentNotAnswer = false;
    for (var question in questions) {
      if (question.id == questionId) {
        if (question.answer == null) {
          isCurrentNotAnswer = true;
        }
        break;
      }
    }
    if (isCurrentNotAnswer) {
      emit(
        ValidationMessageOnRadioButtonQuestionState(
            message: 'You don’t select type', questionId: questionId),
      );
    }
  }

  Future<void> _onValidationMessageOnCheckButtonButtonQuestionEvent(
      ValidationMessageOnCheckButtonButtonQuestionEvent event,
      Emitter<QuestionViewModelState> emit) async {
    bool isCurrentNotAnswer = false;

    for (var question in questions) {
      if (question.id == event.questionId) {
        if (question.answer == null) {
          isCurrentNotAnswer = true;
        }
        break;
      }
    }
    if (isCurrentNotAnswer) {
      emit(
        ValidationMessageOnCheckButtonQuestionState(
          message: 'Please select at least one',
          questionId: event.questionId,
        ),
      );
    }
  }

  Future<void> _onValidationMessageOnTextFormFieldFotTextQuestionEvent(
      ValidationMessageOnTextFormFieldFotTextQuestionEvent event,
      Emitter<QuestionViewModelState> emit) async {
    bool isCurrentNotAnswer = false;

    for (var question in questions) {
      if (question.id == event.questionId) {
        if (question.answer == null) {
          isCurrentNotAnswer = true;
        }
        break;
      }
    }
    if (isCurrentNotAnswer) {
      emit(
        ValidationMessageOnTextFormFieldFotTextQuestionState(
          message: 'Please type your name',
          questionId: event.questionId,
        ),
      );
    }
  }
}
