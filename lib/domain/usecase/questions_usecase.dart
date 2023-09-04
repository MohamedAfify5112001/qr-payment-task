import 'package:qr_code_demo/domain/repository/question_repository.dart';

import '../entities/question_entity.dart';

final class QuestionUseCase {
  final QuestionsRepository questionsRepository;

  QuestionUseCase({
    required this.questionsRepository,
  });

  Future<List<QuestionEntity>> call() async =>
      await questionsRepository.getQuestions();
}
