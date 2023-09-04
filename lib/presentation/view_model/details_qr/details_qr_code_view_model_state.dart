part of 'details_qr_code_view_model_bloc.dart';

abstract class DetailsQrCodeViewModelState extends Equatable {
  const DetailsQrCodeViewModelState();
}

class DetailsQrCodeViewModelInitial extends DetailsQrCodeViewModelState {
  @override
  List<Object> get props => [];
}

class SuccessDetailsQrCodeViewModelState extends DetailsQrCodeViewModelState {
  final TypeQrDetails typeQrDetails;

  const SuccessDetailsQrCodeViewModelState({
    required this.typeQrDetails,
  });

  @override
  List<Object> get props => [];
}

class LoadingDetailsQrCodeViewModelState extends DetailsQrCodeViewModelState {
  @override
  List<Object> get props => [];
}
