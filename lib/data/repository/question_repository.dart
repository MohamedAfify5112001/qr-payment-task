import 'package:qr_code_demo/app/extension/app_extension.dart';
import 'package:qr_code_demo/data/data_source/question_data_source.dart';
import 'package:qr_code_demo/data/model/question_model.dart';
import 'package:qr_code_demo/domain/entities/question_entity.dart';
import 'package:qr_code_demo/domain/repository/question_repository.dart';

final class QuestionRepositoryImplementation implements QuestionsRepository {
  final QuestionsDataSource questionsDataSource;

  QuestionRepositoryImplementation({required this.questionsDataSource});

  @override
  Future<List<QuestionEntity>> getQuestions() async {
    final List<QuestionModel> questions =
        await questionsDataSource.getQuestions();
    return questions.toDomain;
  }
}
