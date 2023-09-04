import 'package:qr_code_demo/domain/repository/detatils_qr_repository.dart';

import '../../app/enum/app_enum.dart';

final class DetailsQrUseCase {
  final DetailsQrRepository detailsQrRepository;

  DetailsQrUseCase({
    required this.detailsQrRepository,
  });

  Future<TypeQrDetails> call() async =>
      await detailsQrRepository.getTypeDetailsQr();
}
