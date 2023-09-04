import '../entities/payment_entity.dart';

abstract interface class PaymentRepository {
  Future<List<PaymentEntity>> getAllPayments();
}
