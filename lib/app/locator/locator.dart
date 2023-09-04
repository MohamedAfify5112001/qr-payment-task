import 'package:get_it/get_it.dart';
import 'package:qr_code_demo/data/data_source/detatils_qr_data_source.dart';
import 'package:qr_code_demo/data/data_source/payment_data_source.dart';
import 'package:qr_code_demo/data/data_source/question_data_source.dart';
import 'package:qr_code_demo/data/repository/detatils_qr_repository.dart';
import 'package:qr_code_demo/data/repository/payment_repository.dart';
import 'package:qr_code_demo/data/repository/question_repository.dart';
import 'package:qr_code_demo/domain/repository/detatils_qr_repository.dart';
import 'package:qr_code_demo/domain/repository/payment_repository.dart';
import 'package:qr_code_demo/domain/repository/question_repository.dart';
import 'package:qr_code_demo/domain/usecase/detatils_qr_usecase.dart';
import 'package:qr_code_demo/domain/usecase/payment_usecase.dart';
import 'package:qr_code_demo/domain/usecase/questions_usecase.dart';
import 'package:qr_code_demo/presentation/view_model/details_qr/details_qr_code_view_model_bloc.dart';
import 'package:qr_code_demo/presentation/view_model/payment/payment_view_model_bloc.dart';
import 'package:qr_code_demo/presentation/view_model/questions/question_view_model_bloc.dart';

import '../../data/services/permission/permission.dart';
import '../../data/services/permission/permission_handler_permission_service.dart';

final instance = GetIt.I;

Future<void> initDependenciesLocator() async {
  instance.registerLazySingleton<QuestionsDataSource>(
    () => QuestionsDataSourceImplementation(),
  );
  instance.registerLazySingleton<QuestionsRepository>(
    () => QuestionRepositoryImplementation(
      questionsDataSource: instance(),
    ),
  );
  instance.registerLazySingleton<QuestionUseCase>(
    () => QuestionUseCase(
      questionsRepository: instance(),
    ),
  );
  instance.registerFactory<QuestionViewModelBloc>(
    () => QuestionViewModelBloc(
      questionUseCase: instance(),
    ),
  );
  instance.registerLazySingleton<PermissionService>(
      () => PermissionHandlerPermissionService());

  await initDependenciesLocatorForPayment();
  await initDependenciesLocatorForDetailsQr();
}

Future<void> initDependenciesLocatorForPayment() async {
  instance.registerLazySingleton<PaymentDataSource>(
    () => PaymentDataSourceImplementation(),
  );
  instance.registerLazySingleton<PaymentRepository>(
    () => PaymentRepositoryImplementation(
      paymentDataSource: instance(),
    ),
  );
  instance.registerLazySingleton<PaymentUseCase>(
    () => PaymentUseCase(
      paymentRepository: instance(),
    ),
  );
  instance.registerFactory<PaymentViewModelBloc>(
    () => PaymentViewModelBloc(
      paymentUseCae: instance(),
    ),
  );
}

Future<void> initDependenciesLocatorForDetailsQr() async {
  instance.registerLazySingleton<DetailsQrDataSource>(
    () => DetailsQrDataSourceImplementation(),
  );
  instance.registerLazySingleton<DetailsQrRepository>(
    () => DetailsQrRepositoryImplementation(
      detailsQrDataSource: instance(),
    ),
  );
  instance.registerLazySingleton<DetailsQrUseCase>(
    () => DetailsQrUseCase(
      detailsQrRepository: instance(),
    ),
  );
  instance.registerFactory<DetailsQrCodeViewModelBloc>(
    () => DetailsQrCodeViewModelBloc(
      detailsQrUseCase: instance(),
    ),
  );
}
