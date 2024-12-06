import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/domin/usecases/get_verify_a_user_otp_verification_usecase.dart';

import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/domin/usecases/get_verify_a_user_usecase.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/domin/usecases/verify_a_user_update_brand_name_usecase.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/presentation/bloc/verify_a_user_event.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/presentation/bloc/verify_a_user_state.dart';

class VerifyAUserBloc extends Bloc<VerifyAUserEvent, VerifyAUserState> {
  final GetVerifyAUserUsecase getVerifyAUserUsecase;
  final GetVerifyAUserOtpVerificationUsecase
      getVerifyAUserOtpVerificationUsecase;
  final GetVerifyAUserUpdateBrandNameUsecase
      getVerifyAUserUpdateBrandNameUsecase;

  VerifyAUserBloc({
    required this.getVerifyAUserUsecase,
    required this.getVerifyAUserOtpVerificationUsecase,
    required this.getVerifyAUserUpdateBrandNameUsecase,
  }) : super(const VerifyAUserStateInitial()) {
    on<GetVerifyAUserPressedButton>(_onVerifyAUser);
    on<GetVerifyAUserOtpVerificationPressedButton>(
        _onVerifyAUserOtpVerification);
    on<GetVerifyAUserUpdateBrandNamePressedButtons>(_onVerifyBrandName);
  }

  void _onVerifyAUser(
      GetVerifyAUserPressedButton event, Emitter<VerifyAUserState> emit) async {
    try {
      emit(const VerifyAUserStateLoading());
      final dataState = await getVerifyAUserUsecase(
        pramas: VerifyAUserPrams(
          flowType: event.flowType!,
          customerId: event.customerId!,
          countryCode: event.countryCode!,
          mobileNumber: event.mobileNumber!,
          authToken: event.authToken!,
        ),
      );
      if (dataState is DataSuccess && dataState.data != null) {
        
        emit(VerifyAUserStateSuccess(dataState.data!));
      }
      if (dataState is DataFailed) {
        emit(VerifyAUserStateError(dataState.dioError!));
      }
    } catch (e) {
      emit(const VerifyAUserStateInitial());
    }
  }

  void _onVerifyAUserOtpVerification(
      GetVerifyAUserOtpVerificationPressedButton event,
      Emitter<VerifyAUserState> emit) async {
    try {
      emit(const VerifyAUserOtpVerificationStateLoading());
      final dataState = await getVerifyAUserOtpVerificationUsecase(
        pramas: VerifyAUserOtpVerificationPrams(
          customerId: event.customerId!,
          code: event.code!,
          verificationId: event.verificationId!,
          authToken: event.authToken!,
        ),
      );
      if (dataState is DataSuccess && dataState.data != null) {
        emit(VerifyAUserOtpVerificationStateSuccess(dataState.data!));
      }
      if (dataState is DataFailed) {
        emit(VerifyAUserOtpVerificationStateError(dataState.dioError!));
      }
    } catch (e) {
      emit(const VerifyAUserOtpVerificationStateInitial());
    }
  }

  void _onVerifyBrandName(GetVerifyAUserUpdateBrandNamePressedButtons event,
      Emitter<VerifyAUserState> emit) async {
    try {
      emit(const VerifyAUserUpdateBrandNameStateLoading());
      final dataState = await getVerifyAUserUpdateBrandNameUsecase(
        pramas: VerifyAUserUpdateBrandNamePrams(
          brandName: event.brandName!,
          customerId: event.customerId!,
          authToken: event.authToken!,
        ),
      );
      if (dataState is DataSuccess && dataState.data != null) {
        emit(VerifyAUserUpdateBrandNameStateSuccesss(dataState.data!));
      }
      if (dataState is DataFailed) {
        emit(VerifyAUserUpdateBrandNameStateError(dataState.dioError!));
      }
    } catch (e) {
      emit(const VerifyAUserUpdateBrandNameStateInitial());
    }
  }
}
