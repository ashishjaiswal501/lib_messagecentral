import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/utils/local_state_cache.dart';
import 'package:messagecentral/features/signup/domain/usecases/get_signup_otp_usecase.dart';
import 'package:messagecentral/features/signup/presentation/bloc/signup_otp_state.dart';

import 'package:messagecentral/features/signup/presentation/bloc/singup_otp_event.dart';

class SignupOtpBloc extends Bloc<SignupOtpEvent, SignupOtpState> {
  final GetSignupOtpUsecase getSignupOtpUsecase;
  SignupOtpBloc({required this.getSignupOtpUsecase})
      : super(const SignupOtpStateInitial()) {
    on<GetSignupOtpPressedsButton>(_onGetSignupOtpPressed);
  }

  void _onGetSignupOtpPressed(
      GetSignupOtpPressedsButton event, Emitter<SignupOtpState> emit) async {
    try {
      emit(const SignupOtpLoading());
      final dataState = await getSignupOtpUsecase(
          pramas: SignupOtpRequestPrams(
              countryCode: event.countryCode!,
              customerId: event.customerId!,
              authToken: event.authToken!,
              phoneNo: event.phoneNo!));

      if (dataState is DataSuccess &&
          dataState.data != null &&
          dataState.data?.responseCode == 200) {
        emit(SignupOtpStateSucces(dataState.data!));
        LocalStateCache().fName = dataState.data?.userData?.fullName ?? "";
        LocalStateCache().emailId = dataState.data?.userData?.email ?? "";
      }
      if (dataState is DataFailed) {
        emit(SignupOtpStateError(
            dataState.dioError!, dataState.data!.responseCode!));
      }
      if (dataState is DataSuccess &&
          dataState.data != null &&
          dataState.data?.responseCode == 506) {
        emit(SignupOtpStateError(
            dataState.data?.message ?? "", dataState.data!.responseCode!));
      }
      if (dataState is DataSuccess &&
          dataState.data != null &&
          dataState.data?.responseCode == 503) {
        emit(SignupOtpStateError(
            dataState.data?.message ?? "", dataState.data!.responseCode!));
      }

      if (dataState is DataSuccess &&
          dataState.data != null &&
          dataState.data?.responseCode == 400) {
        emit(SignupOtpStateError(
            dataState.data?.message ?? "", dataState.data!.responseCode!));
      }
      if (dataState is DataSuccess &&
          dataState.data != null &&
          dataState.data?.responseCode == 711) {
        emit(SignupOtpStateError(
            dataState.data?.message ?? "", dataState.data!.responseCode!));
      }
      if (dataState is DataSuccess &&
          dataState.data != null &&
          dataState.data?.responseCode == 13) {
        emit(SignupOtpStateError(
            dataState.data?.message ?? "", dataState.data!.responseCode!));
      }
    } catch (e) {
      emit(const SignupOtpStateInitial());
    }
  }
}
