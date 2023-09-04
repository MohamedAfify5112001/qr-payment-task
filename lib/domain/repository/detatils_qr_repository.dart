import '../../app/enum/app_enum.dart';

abstract interface class DetailsQrRepository {
  Future<TypeQrDetails> getTypeDetailsQr();
}
