import 'package:equatable/equatable.dart';

final class QuestionModel extends Equatable {
  final String id;
  final String title;
  final String label;
  dynamic answer;
  final List<OptionModel> options;
  final int typeId;
  final bool isMandatory;

  QuestionModel(
      {required this.id,
      required this.title,
      required this.label,
      required this.answer,
      required this.options,
      required this.typeId,
      required this.isMandatory});

  @override
  List<Object?> get props => [
        id,
        title,
        label,
        answer,
        options,
        typeId,
        isMandatory,
      ];
}

class OptionModel extends Equatable {
  final String title;
  final String id;
  bool isSelected;

  OptionModel(this.title, this.id, this.isSelected);

  @override
  List<Object> get props => [title, id];
}
