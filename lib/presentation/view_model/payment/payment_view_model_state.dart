part of 'payment_view_model_bloc.dart';

abstract class PaymentViewModelState extends Equatable {
  const PaymentViewModelState();
}

class PaymentViewModelInitial extends PaymentViewModelState {
  @override
  List<Object> get props => [];
}

class SuccessFetchAllPaymentsState extends PaymentViewModelState {
  final List<PaymentEntity> payments;

  const SuccessFetchAllPaymentsState({required this.payments});

  @override
  List<Object> get props => [payments];
}

class LoadingFetchAllPaymentsState extends PaymentViewModelState {
  @override
  List<Object> get props => [];
}

class FailureFetchAllPaymentsState extends PaymentViewModelState {
  @override
  List<Object> get props => [];
}

class SuccessSearchPaymentState extends PaymentViewModelState {
  @override
  List<Object> get props => [];
}
