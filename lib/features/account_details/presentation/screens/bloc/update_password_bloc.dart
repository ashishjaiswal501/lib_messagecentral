import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/utils/local_state_cache.dart';
import 'package:messagecentral/features/account_details/domain/usecases/get_update_password_usecase.dart';
import 'package:messagecentral/features/account_details/presentation/screens/bloc/update_password_event.dart';
import 'package:messagecentral/features/account_details/presentation/screens/bloc/update_password_state.dart';

class UpdatePasswordBloc
    extends Bloc<UpdatePasswordEvent, UpdatePasswordState> {
  final GetUpdatePasswordUseCase getUpdatePasswordUseCase;
  UpdatePasswordBloc(this.getUpdatePasswordUseCase)
      : super(const UpdatePasswordStateInitial()) {
    on<GetUpdatePasswordPressed>(onUpdatePassword);
  }

  void onUpdatePassword(
      GetUpdatePasswordPressed event, Emitter<UpdatePasswordState> emit) async {
    try {
      emit(const UpdatePasswordStateLoading());
      final dataState = await getUpdatePasswordUseCase(
          pramas: ConfirmPasswordRequest(
              customerId: LocalStateCache().customerId,
              newPassword: event.newPassword,
              oldPassword: event.oldPassword));
      if (dataState is DataSuccess && dataState.data != null) {
        emit(UpdatePasswordStateSuccess(dataState.data!));
      }
      if (dataState is DataSuccess && dataState.data?.data == null) {
        emit(UpdatePasswordStateError(dataState.data!.message!));
      }
      if (dataState is DataFailed) {
        emit(UpdatePasswordStateError(dataState.dioError!));
      }
    } catch (e) {
      emit(const UpdatePasswordStateInitial());
    }
  }
}
