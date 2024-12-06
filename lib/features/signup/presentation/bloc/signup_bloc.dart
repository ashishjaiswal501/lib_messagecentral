import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messagecentral/core/resources/data_state.dart';

import 'package:messagecentral/features/signup/domain/usecases/get_resend_otp_usecase.dart';
import 'package:messagecentral/features/signup/domain/usecases/get_signup_usecase.dart';
import 'package:messagecentral/features/signup/domain/usecases/get_signup_otp_usecase.dart';
import 'package:messagecentral/features/signup/domain/usecases/get_signup_verify_otp_usecase.dart';
import 'package:messagecentral/features/signup/presentation/bloc/signup_event.dart';
import 'package:messagecentral/features/signup/presentation/bloc/signup_state.dart';
import 'package:messagecentral/user_cache_manager/bloc/user_cache_manager_bloc.dart';


class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final GetSignupUsecase getSignupUsecase;
  final GetSignupOtpUsecase getSignupOtpUsecase;
  final GetSignupVerifyOtpUsecase getSignupVerifyOtpUsecase;
  final GetResendOtpUsecase getResendyOtpUsecase;
  final UserCacheManagerBloc userCacheManagerBloc;

  SignupBloc({
    required this.getSignupUsecase,
    required this.getSignupOtpUsecase,
    required this.getSignupVerifyOtpUsecase,
    required this.getResendyOtpUsecase,
    required this.userCacheManagerBloc,
  }) : super(const SignupStateInitial()) {
    on<GetSignupPressedButton>(onSignup);
    on<GetobscureTextVisibility>(onpasswordVisibility);
    on<BackToPreviousStepEvent>(_onBackToPreviousStep);
   
  }

  void onSignup(GetSignupPressedButton event, Emitter<SignupState> emit) async {
    try {
      emit(const SignupStateLoading());
      final dataState = await getSignupUsecase(
        pramas: SignupRequestPrams(
          fullName: event.fullName!,
          email: event.email!,
          password: event.password!,
        ),
      );
      if (dataState is DataSuccess && dataState.data != null) {
        emit(SignupStateSuccess(dataState.data!));
      }
      if (dataState is DataFailed) {
        emit(SignupStateError(dataState.dioError!));
      }
    } catch (e) {
      emit(const SignupStateInitial());
    }
  }

  // password visibility..
  void onpasswordVisibility(
      GetobscureTextVisibility event, Emitter<SignupState> emit) async {
    if (event.obscureText == true) {
      emit(const ObscureTextVisibilityState(false));
    } else {
      emit(const ObscureTextVisibilityState(true));
    }
  }

  // handle back to the previous step event
  void _onBackToPreviousStep(
      BackToPreviousStepEvent event, Emitter<SignupState> emit) {
    emit(const BacktoPreviousStateInitial());
  }
}
