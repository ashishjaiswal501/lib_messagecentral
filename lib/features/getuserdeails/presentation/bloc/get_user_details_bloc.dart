import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/utils/local_state_cache.dart';
import 'package:messagecentral/features/getuserdeails/domain/usecases/get_user_details_usecase.dart';
import 'package:messagecentral/features/getuserdeails/presentation/bloc/get_user_details_event.dart';
import 'package:messagecentral/features/getuserdeails/presentation/bloc/get_user_details_state.dart';

class GetUserDetailsBloc
    extends Bloc<GetUserDetailsEvent, GetUserDetailsState> {
  final GetUserDetailsUsecase getUserDetailsUsecase;
  GetUserDetailsBloc({required this.getUserDetailsUsecase})
      : super(const GetUserDetailsStateInitial()) {
    on<GetUserDetailsCall>(onGetUserDetails);
  }

  void onGetUserDetails(
      GetUserDetailsCall event, Emitter<GetUserDetailsState> emit) async {
    try {
      emit(const GetUserDetailsStateLoading());
      final dataState =
          await getUserDetailsUsecase(pramas: LocalStateCache().authToken);
      if (dataState is DataSuccess && dataState.data != null) {
        LocalStateCache().setBalance =
            dataState.data!.data!.wallet!.credits.toString();
        emit(GetUserDetailsStateSuccess(dataState.data!));
      }
      if (dataState is DataFailed) {
        emit(GetUserDetailsStateError(dataState.dioError!));
      }
    } catch (e) {
      emit(const GetUserDetailsStateInitial());
    }
  }
}
