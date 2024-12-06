import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/utils/local_state_cache.dart';
import 'package:messagecentral/features/signup/domain/usecases/get_signup_verify_otp_usecase.dart';
import 'package:messagecentral/features/signup/presentation/bloc/signup_otp_verify_event.dart';
import 'package:messagecentral/features/signup/presentation/bloc/signup_otp_verify_state.dart';
import 'package:messagecentral/user_cache_manager/bloc/user_cache_manager_bloc.dart';
import 'package:messagecentral/user_cache_manager/bloc/user_cache_manager_event.dart';

class SignupOtpVerifyBloc
    extends Bloc<SignupOtpVerifyEvent, SignupOtpVerifyState> {
  final GetSignupVerifyOtpUsecase getSignupVerifyOtpUsecase;
  final UserCacheManagerBloc userCacheManagerBloc;
  SignupOtpVerifyBloc(
      {required this.getSignupVerifyOtpUsecase,
      required this.userCacheManagerBloc})
      : super(const SignupOtpVerifyStateInitial()) {
    on<GetSignupVerifyOtpPressedButton>(_onGetSignupVerifyOtpPressed);
  }
  void _onGetSignupVerifyOtpPressed(GetSignupVerifyOtpPressedButton event,
      Emitter<SignupOtpVerifyState> emit) async {
    try {
      emit(const SignupOtpVerifyStateLoading());
      final dataState = await getSignupVerifyOtpUsecase(
          pramas: SignupVerifyOtpRequestPrams(
              customerId: event.customerId!,
              otp: event.otp!,
              otpVerificationId: event.otpVerificationId!,
              authToken: event.authToken!));

      if (dataState is DataSuccess &&
          dataState.data != null &&
          dataState.data?.userData != null &&
          dataState.data?.userData?.customerId != null) {
        emit(SignupOtpVerifyStateSuccess(dataState.data!));
        LocalStateCache().customerId =
            dataState.data?.userData?.customerId ?? "";
        LocalStateCache().setAuthToken =
            dataState.data?.userData?.authToken ?? "";

        LocalStateCache().phoneNo =
            dataState.data?.userData?.mobileNumber ?? "";

        LocalStateCache().countryCode =
            dataState.data?.userData?.countryCode ?? "";

        LocalStateCache().isVerificationOtp = true;
        userCacheManagerBloc.add(GetUserCacheManagerEvent(
            authToken: dataState.data?.userData?.authToken ?? "",
            customerId: dataState.data?.userData?.customerId ?? "",
            isUserAutheticated: dataState.data != null ? true : false));
      }
      if (dataState is DataFailed) {
        emit(SignupOtpVerifyStateError(dataState.dioError!));
      }
      if (dataState is DataSuccess && dataState.data?.responseCode == 702) {
        emit(SignupOtpVerifyStateError(dataState.data!.message.toString()));
      }
    } catch (e) {
      emit(const SignupOtpVerifyStateInitial());
    }
  }
}
