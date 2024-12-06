import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/features/forget_password/domain/usecases/get_forget_password_otp_usecase.dart';
import 'package:messagecentral/features/forget_password/presentation/screens/bloc/forget_password_otp_event.dart';
import 'package:messagecentral/features/forget_password/presentation/screens/bloc/forget_password_otp_state.dart';


class ForgetPasswordOtpBloc
    extends Bloc<ForgetPasswordOtpEvent, ForgetPasswordOtpState> {
 
  final GetForgetPasswordOtpUsecase getForgetPasswordOtpUsecase;
 
  ForgetPasswordOtpBloc(
      {
      required this.getForgetPasswordOtpUsecase,
     })
      : super(const ForgetPasswordOtpStateInitial()) {
   
   
  on<GetForgetPasswordOTpPressedButton>(onForgetPasswordOtp);
    
  }

 
  void onForgetPasswordOtp(GetForgetPasswordOTpPressedButton event,
      Emitter<ForgetPasswordOtpState> emit) async {
    try {
      emit(const ForgetPasswordOtpStateLoading());
      final dataState = await getForgetPasswordOtpUsecase.call(
          pramas: ForgetPasswordOtpRequestPrams(
              email: event.email,
              code: event.code,
              verificationId: event.verificationId));
      if (dataState is DataSuccess && dataState.data != null) {
        emit(ForgetPasswordStateOtpSuccess(dataState.data!));
      }
      if (dataState is DataFailed) {
        emit(ForgetPasswordOtpStateError(dataState.dioError!));
      }
    } catch (e) {
      emit(const ForgetPasswordOtpStateInitial());
    }
  }

 
 }
