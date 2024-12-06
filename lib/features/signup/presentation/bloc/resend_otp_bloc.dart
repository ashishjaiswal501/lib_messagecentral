import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/features/signup/domain/usecases/get_resend_otp_usecase.dart';
import 'package:messagecentral/features/signup/presentation/bloc/resend_otp_event.dart';
import 'package:messagecentral/features/signup/presentation/bloc/resend_otp_state.dart';

class ResendOtpBloc extends Bloc<ResendOtpEvent, ResendOtpState> {
  final GetResendOtpUsecase getResendOtpUsecase;
  ResendOtpBloc({required this.getResendOtpUsecase})
      : super(const ResendOtpStateInitial()) {
    on<GetResendOtpPressedButton>(_onGetResendOtpPressed);
  }

  void _onGetResendOtpPressed(
      GetResendOtpPressedButton event, Emitter<ResendOtpState> emit) async {
    try {
      emit(const ResendOtpStateLoading());
      final dataState = await getResendOtpUsecase(
          pramas: ResendOtpRequestPrams(
              email: event.email!,
              phoneNo: event.phoneNo!,
              phoneCode: event.phoneCode!));

      if (dataState is DataSuccess && dataState.data != null) {
        emit(ResendOtpStateSuccess(dataState.data!));
      }
      if (dataState is DataFailed) {
        emit(ResendOtpStateError(dataState.dioError!));
      }
    } catch (e) {
      emit(const ResendOtpStateInitial());
    }
  }
}
