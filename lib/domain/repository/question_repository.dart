import '../entities/question_entity.dart';

abstract interface class QuestionsRepository {
  Future<List<QuestionEntity>> getQuestions();
}
