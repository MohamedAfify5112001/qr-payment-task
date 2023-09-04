import 'package:intl/intl.dart';
import 'package:qr_code_demo/data/model/payment_model.dart';

abstract interface class PaymentDataSource {
  Future<List<PaymentModel>> getAllPayments();
}

final class PaymentDataSourceImplementation implements PaymentDataSource {
  @override
  Future<List<PaymentModel>> getAllPayments() async {
    await Future.delayed(const Duration(seconds: 9));
    final List<PaymentModel> payments = [
      PaymentModel(
        title: 'Visa Classic',
        date: DateFormat('dd/MM/yyyy').format(DateTime.now()),
        budget: '20.000',
        desc: 'is simply dummy text of the printing and typesetting industry',
      ),
      PaymentModel(
        title: 'Visa Mandatory',
        date: DateFormat('dd/MM/yyyy').format(DateTime.now()),
        budget: '30.000',
        desc: 'is simply dummy text of the printing and typesetting industry',
      ),
      PaymentModel(
        title: 'Visa Corporate',
        date: DateFormat('dd/MM/yyyy').format(DateTime.now()),
        budget: '100.000',
        desc: 'is simply dummy text of the printing and typesetting industry',
      ),
      PaymentModel(
        title: 'Visa Credit',
        date: DateFormat('dd/MM/yyyy').format(DateTime.now()),
        budget: '50.000',
        desc: 'is simply dummy text of the printing and typesetting industry',
      ),
    ];

    return payments;
  }
}
