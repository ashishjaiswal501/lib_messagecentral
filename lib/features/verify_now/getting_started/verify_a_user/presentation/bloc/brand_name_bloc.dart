import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messagecentral/core/resources/data_state.dart';

import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/domin/usecases/verify_a_user_update_brand_name_usecase.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/presentation/bloc/brand_name_event.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/presentation/bloc/brand_name_state.dart';

class VerifyBrandNameBloc
    extends Bloc<VerifyBrandNameEvent, VerifyBrandNameState> {
  final GetVerifyAUserUpdateBrandNameUsecase
      getVerifyAUserUpdateBrandNameUsecase;

  VerifyBrandNameBloc({
    required this.getVerifyAUserUpdateBrandNameUsecase,
  }) : super(const VerifyAUserUpdateBrandNameStateInitial()) {
    on<GetVerifyAUserUpdateBrandNamePressedButton>(_onVerifyBrandName);
  }

  void _onVerifyBrandName(GetVerifyAUserUpdateBrandNamePressedButton event,
      Emitter<VerifyBrandNameState> emit) async {
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
        emit(VerifyAUserUpdateBrandNameStateSuccess(dataState.data!));
      }
      if (dataState is DataFailed) {
        emit(VerifyAUserUpdateBrandNameStateError(dataState.dioError!));
      }
    } catch (e) {
      emit(const VerifyAUserUpdateBrandNameStateInitial());
    }
  }
}
