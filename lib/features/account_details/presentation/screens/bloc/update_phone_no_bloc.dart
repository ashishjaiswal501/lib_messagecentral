import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/utils/local_state_cache.dart';
import 'package:messagecentral/features/account_details/domain/usecases/get_update_phoneno_usecase.dart';
import 'package:messagecentral/features/account_details/presentation/screens/bloc/update_phone_no_event.dart';
import 'package:messagecentral/features/account_details/presentation/screens/bloc/update_phone_no_state.dart';

class UpdatePhoneNoBloc extends Bloc<UpdatePhoneNoEvent, UpdatePhoneNoState> {
  final GetUpdatePhoneNoUseCase getUpdatePhoneNoUseCase;
  UpdatePhoneNoBloc(this.getUpdatePhoneNoUseCase)
      : super(const UpdatePhoneNoStateInitial()) {
    on<GetUpdatePhoneNoPressed>(onUpdatePhoneNo);
  }

  void onUpdatePhoneNo(
      GetUpdatePhoneNoPressed event, Emitter<UpdatePhoneNoState> emit) async {
    try {
      emit(const UpdatePhoneNoStateLoading());
      final dataState = await getUpdatePhoneNoUseCase(
          pramas: UpdatePhoneNoRequest(
              customerId: LocalStateCache().customerId,
              phoneNumber: event.phoneNumber,
              countryCode: event.countryCode,
              otp: event.otp,
              verificationId: event.verificationId));
      if (dataState is DataSuccess && dataState.data!.phoneData != null) {
        emit(UpdatePhoneNoStateSuccess(dataState.data!));
      }
      if (dataState is DataSuccess && dataState.data!.phoneData == null) {
        emit(UpdatePhoneNoStateError(dataState.data!.message!));
      }
      if (dataState is DataFailed) {
        emit(UpdatePhoneNoStateError(dataState.dioError!));
      }
    } catch (e) {
      emit(const UpdatePhoneNoStateInitial());
    }
  }
}
