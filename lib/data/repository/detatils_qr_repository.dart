import 'package:qr_code_demo/app/enum/app_enum.dart';
import 'package:qr_code_demo/data/data_source/detatils_qr_data_source.dart';

import '../../domain/repository/detatils_qr_repository.dart';

final class DetailsQrRepositoryImplementation implements DetailsQrRepository {
  final DetailsQrDataSource detailsQrDataSource;

  DetailsQrRepositoryImplementation({required this.detailsQrDataSource});

  @override
  Future<TypeQrDetails> getTypeDetailsQr() async =>
      await detailsQrDataSource.getTypeDetailsQr();
}
