import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/features/account_details/domain/usecases/get_update_phoneno_otp_usecase.dart';
import 'package:messagecentral/features/account_details/presentation/screens/bloc/update_phone_no_get_otp_event.dart';
import 'package:messagecentral/features/account_details/presentation/screens/bloc/update_phone_no_get_otp_state.dart';

class UpdatePhoneNoGetOtpBloc
    extends Bloc<UpdatePhoneNoGetOtpEvent, UpdatePhoneNoGetOtpState> {
  final GetUpdatePhoneNoOtpUseCase getUpdatePhoneNoOtpUseCase;
  UpdatePhoneNoGetOtpBloc(this.getUpdatePhoneNoOtpUseCase)
      : super(const UpdatePhoneNoGetOtpStateInitial()) {
    on<GetUpdatePhoneNoGetOtpPressed>(onUpdatePhoneNo);
  }

  void onUpdatePhoneNo(GetUpdatePhoneNoGetOtpPressed event,
      Emitter<UpdatePhoneNoGetOtpState> emit) async {
    try {
      emit(const UpdatePhoneNoGetOtpStateLoading());
      final dataState = await getUpdatePhoneNoOtpUseCase(
          pramas: UpdatePhoneNoOtpRequest(
              phoneNumber: event.phoneNumber, countryCode: event.countryCode));
      if (dataState is DataSuccess && dataState.data != null) {
        emit(UpdatePhoneNoGetOtpStateSuccess(dataState.data!));
      }
      if (dataState is DataSuccess && dataState.data?.phoneData == null) {
        emit(UpdatePhoneNoGetOtpStateError(dataState.data!.message!));
      }
      if (dataState is DataFailed) {
        emit(UpdatePhoneNoGetOtpStateError(dataState.dioError!));
      }
    } catch (e) {
      emit(UpdatePhoneNoGetOtpStateError(e.toString()));
    }
  }
}
