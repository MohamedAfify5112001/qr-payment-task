import 'package:equatable/equatable.dart';

final class PaymentModel extends Equatable {
  final String title;
  final String date;
  final String desc;
  final String budget;

  const PaymentModel({
    required this.title,
    required this.date,
    required this.budget,
    required this.desc,
  });

  @override
  List<Object> get props => [
    title,
    date,
    desc,
    budget,
  ];
}
