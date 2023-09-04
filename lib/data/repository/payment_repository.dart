import 'package:qr_code_demo/app/extension/app_extension.dart';
import 'package:qr_code_demo/data/data_source/payment_data_source.dart';
import 'package:qr_code_demo/domain/entities/payment_entity.dart';
import 'package:qr_code_demo/domain/repository/payment_repository.dart';

final class PaymentRepositoryImplementation implements PaymentRepository {
  final PaymentDataSource paymentDataSource;

  PaymentRepositoryImplementation({
    required this.paymentDataSource,
  });

  @override
  Future<List<PaymentEntity>> getAllPayments() async {
    final remotelyPayment = await paymentDataSource.getAllPayments();
    return remotelyPayment.toDomain;
  }
}
