import '../../app/enum/app_enum.dart';

abstract interface class DetailsQrDataSource {
  Future<TypeQrDetails> getTypeDetailsQr();
}

final class DetailsQrDataSourceImplementation implements DetailsQrDataSource {
  @override
  Future<TypeQrDetails> getTypeDetailsQr() async {
    await Future.delayed(const Duration(seconds: 5));
    const isSingleOrMultiple = TypeQrDetails.single;
    return isSingleOrMultiple;
  }
}
