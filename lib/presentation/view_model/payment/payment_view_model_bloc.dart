import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/payment_entity.dart';
import '../../../domain/usecase/payment_usecase.dart';

part 'payment_view_model_event.dart';

part 'payment_view_model_state.dart';

class PaymentViewModelBloc
    extends Bloc<PaymentViewModelEvent, PaymentViewModelState> {
  final PaymentUseCase paymentUseCae;
  List<PaymentEntity> _payments = const [];

  PaymentViewModelBloc({
    required this.paymentUseCae,
  }) : super(PaymentViewModelInitial()) {
    on<FetchAllPaymentsEvent>(_onFetchAllPaymentsEvent);
    on<SearchPaymentEvent>(_onSearchPaymentEvent);
  }

  Future<void> _onFetchAllPaymentsEvent(
      FetchAllPaymentsEvent event, Emitter<PaymentViewModelState> emit) async {
    emit(LoadingFetchAllPaymentsState());
    final paymentsData = await paymentUseCae();
    if (paymentsData.isNotEmpty) {
      _payments = paymentsData;
      emit(SuccessFetchAllPaymentsState(payments: paymentsData));
    } else {
      emit(FailureFetchAllPaymentsState());
    }
  }

  Future<void> _onSearchPaymentEvent(
      SearchPaymentEvent event, Emitter<PaymentViewModelState> emit) async {
    List<PaymentEntity> searchedPayment = _payments;

    if (event.name.trim().isNotEmpty) {
      searchedPayment = searchedPayment
          .where(
            (payment) => payment.title.toLowerCase().contains(
                  event.name.trim().toLowerCase(),
                ),
          )
          .toList();
      emit(SuccessFetchAllPaymentsState(payments: searchedPayment));
    } else {
      emit(SuccessFetchAllPaymentsState(payments: _payments));
    }
  }
}
