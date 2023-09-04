import 'package:qr_code_demo/data/model/question_model.dart';

import '../../data/model/payment_model.dart';
import '../../domain/entities/payment_entity.dart';
import '../../domain/entities/question_entity.dart';

extension ConverterQuestionModelToEntity on List<QuestionModel> {
  List<QuestionEntity> get toDomain => map(
        (question) => QuestionEntity(
          id: question.id,
          title: question.title,
          label: question.label,
          answer: question.answer,
          isMandatory: question.isMandatory,
          options: question.options
              .map(
                (option) => OptionEntity(
                  option.title,
                  option.id,
                  option.isSelected,
                ),
              )
              .toList(),
          typeId: question.typeId,
        ),
      ).toList();
}

extension ConverterPaymentModelToEntity on List<PaymentModel> {
  List<PaymentEntity> get toDomain => map(
        (payment) => PaymentEntity(
          title: payment.title,
          date: payment.date,
          budget: payment.budget,
          desc: payment.desc,
        ),
      ).toList();
}
