import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qr_code_demo/app/enum/app_enum.dart';

import '../../../domain/usecase/detatils_qr_usecase.dart';

part 'details_qr_code_view_model_event.dart';

part 'details_qr_code_view_model_state.dart';

class DetailsQrCodeViewModelBloc
    extends Bloc<DetailsQrCodeViewModelEvent, DetailsQrCodeViewModelState> {
  final DetailsQrUseCase detailsQrUseCase;

  DetailsQrCodeViewModelBloc({
    required this.detailsQrUseCase,
  }) : super(DetailsQrCodeViewModelInitial()) {
    on<GetTypeQrDetailsEvent>(_onGetTypeQrDetailsEvent);
  }

  Future<void> _onGetTypeQrDetailsEvent(GetTypeQrDetailsEvent event,
      Emitter<DetailsQrCodeViewModelState> emit) async {
    emit(LoadingDetailsQrCodeViewModelState());
    final TypeQrDetails typeQrDetails = await detailsQrUseCase();
    emit(SuccessDetailsQrCodeViewModelState(typeQrDetails: typeQrDetails));
  }
}
