import 'package:qr_code_demo/domain/repository/payment_repository.dart';

import '../entities/payment_entity.dart';

final class PaymentUseCase {
  final PaymentRepository paymentRepository;

  PaymentUseCase({required this.paymentRepository});

  Future<List<PaymentEntity>> call() async =>
      await paymentRepository.getAllPayments();
}
