import 'package:uuid/uuid.dart';

import '../model/question_model.dart';

abstract interface class QuestionsDataSource {
  Future<List<QuestionModel>> getQuestions();
}

final class QuestionsDataSourceImplementation implements QuestionsDataSource {
  @override
  Future<List<QuestionModel>> getQuestions() async {
    List<QuestionModel> questions = [
      QuestionModel(
        id: const Uuid().v4(),
        title: 'Guest Type',
        label: '',
        answer: null,
        options: [
          OptionModel("Friend", const Uuid().v4(), false),
          OptionModel("Delivery", const Uuid().v4(), false),
          OptionModel("Broker", const Uuid().v4(), false),
          OptionModel("Family", const Uuid().v4(), false),
        ],
        typeId: 4,
        isMandatory: true,
      ),
      QuestionModel(
        id: const Uuid().v4(),
        title: 'Type Your QR',
        label: '',
        answer: null,
        isMandatory: true,
        options: [
          OptionModel("One Time", const Uuid().v4(), false),
          OptionModel("Multiple", const Uuid().v4(), false),
        ],
        typeId: 4,
      ),
      QuestionModel(
        id: const Uuid().v4(),
        title: 'Why You Come to The Compound ?',
        label: '',
        answer: null,
        isMandatory: true,
        options: [
          OptionModel("Beautiful", const Uuid().v4(), false),
          OptionModel("Comfortable", const Uuid().v4(), false),
          OptionModel("Safety", const Uuid().v4(), false),
        ],
        typeId: 5,
      ),
      QuestionModel(
        id: const Uuid().v4(),
        title: 'Type Your Name',
        label: 'Type Text Here',
        answer: null,
        options: const [],
        isMandatory: true,
        typeId: 1,
      ),
      QuestionModel(
        id: const Uuid().v4(),
        title: 'Prepared Visit Time',
        label: 'Date',
        answer: null,
        options: const [],
        isMandatory: false,
        typeId: 6,
      ),
      QuestionModel(
        id: const Uuid().v4(),
        title: '',
        label: 'Upload your ID',
        answer: null,
        options: const [],
        typeId: 3,
        isMandatory: false,
      ),
    ];
    await Future.delayed(
      const Duration(seconds: 3),
    );
    return questions;
  }
}
