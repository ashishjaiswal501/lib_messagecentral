import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/features/forget_password/domain/usecases/get_confirm_password_usecase.dart';
import 'package:messagecentral/features/forget_password/domain/usecases/get_forget_password_email_usecase.dart';
import 'package:messagecentral/features/forget_password/domain/usecases/get_forget_password_otp_usecase.dart';
import 'package:messagecentral/features/forget_password/presentation/screens/bloc/forget_password_event.dart';
import 'package:messagecentral/features/forget_password/presentation/screens/bloc/forget_password_state.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  final GetForgetPasswordEmailUsecase getForgetPasswordEmailUsecase;
  final GetForgetPasswordOtpUsecase getForgetPasswordOtpUsecase;
  final GetConfirmPasswordUsecase getConfirmPasswordUsecase;
  ForgetPasswordBloc(
      {required this.getForgetPasswordEmailUsecase,
      required this.getForgetPasswordOtpUsecase,
      required this.getConfirmPasswordUsecase})
      : super(const ForgetPasswordStateInitial()) {
    on<ForgetPasswordEmailOtpVisibility>(onVisibleEmailOTP);
    on<GetForgetPasswordEmailPressedButton>(onForgetPasswordEmail);
    on<GetConfirmPasswordPressedButton>(onConfirmPassword);
  }

  void onForgetPasswordEmail(GetForgetPasswordEmailPressedButton event,
      Emitter<ForgetPasswordState> emit) async {
    try {
      emit(const ForgetPasswordStateLoading());

      final dataState =
          await getForgetPasswordEmailUsecase.call(pramas: event.email);
      if (dataState is DataSuccess && dataState.data != null) {
        emit(ForgetPasswordStateEmailSuccess(dataState.data!));
      }
      if (dataState is DataFailed) {
        emit(FOrgetPasswordEmailStateError(dataState.dioError!));
      }
    } catch (e) {
      emit(const ForgetPasswordStateInitial());
    }
  }

  void onConfirmPassword(GetConfirmPasswordPressedButton event,
      Emitter<ForgetPasswordState> emit) async {
    try {
      emit(const ForgetPasswordConfirmStateLoading());
      final dataState = await getConfirmPasswordUsecase.call(
          pramas: ConfirmPasswordRequestPrams(
              email: event.email!,
              newPassword: event.newPassword!,
              authToken: event.authToken!));
      if (dataState is DataSuccess && dataState.data != null) {
        emit(ConfirmPasswordStateSuccess(dataState.data!));
      }
      if (dataState is DataFailed) {
        emit(FOrgetPasswordOtpStateError(dataState.dioError!));
      }
    } catch (e) {
      emit(const ForgetPasswordStateInitial());
    }
  }

  void onVisibleEmailOTP(ForgetPasswordEmailOtpVisibility event,
      Emitter<ForgetPasswordState> emit) {
    emit(const ForgetPasswordVisibilityState(false));
  }
}
