part of 'details_qr_code_view_model_bloc.dart';

sealed class DetailsQrCodeViewModelEvent extends Equatable {
  const DetailsQrCodeViewModelEvent();
}

final class GetTypeQrDetailsEvent extends DetailsQrCodeViewModelEvent {
  const GetTypeQrDetailsEvent();

  @override
  List<Object> get props => [];
}
