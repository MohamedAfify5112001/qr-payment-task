part of 'payment_view_model_bloc.dart';

sealed class PaymentViewModelEvent extends Equatable {
  const PaymentViewModelEvent();
}

final class FetchAllPaymentsEvent extends PaymentViewModelEvent {
  const FetchAllPaymentsEvent();

  @override
  List<Object> get props => [];
}

final class SearchPaymentEvent extends PaymentViewModelEvent {
  final String name;

  const SearchPaymentEvent({required this.name});

  @override
  List<Object> get props => [name];
}
