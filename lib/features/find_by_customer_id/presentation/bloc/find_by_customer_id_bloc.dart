import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/utils/local_state_cache.dart';
import 'package:messagecentral/features/find_by_customer_id/domain/usecase/find_by_customer_id_usecase.dart';
import 'package:messagecentral/features/find_by_customer_id/presentation/bloc/find_by_customer_id_event.dart';
import 'package:messagecentral/features/find_by_customer_id/presentation/bloc/find_by_customer_id_state.dart';

class FindByCustomerIdBloc
    extends Bloc<FindByCustomerIdEvent, FindByCustomerIdState> {
  final FindByCustomerIdUsecase findByCustomerIdUsecase;
  FindByCustomerIdBloc({required this.findByCustomerIdUsecase})
      : super(const FindByCustomerIdStateInitial()) {
    on<FindByCustomerIdCall>(onFindByCustomerId);
  }

  void onFindByCustomerId(
      FindByCustomerIdCall event, Emitter<FindByCustomerIdState> emit) async {
    try {
      emit(const FindByCustomerIdStateLoading());
      final dataState = await findByCustomerIdUsecase(
        pramas: FindByCustomerIdPrams(
          authToken: LocalStateCache().authToken,
          customerId: LocalStateCache().customerId,
        ),
      );

      if (dataState is DataSuccess && dataState.data!.data != null) {
        LocalStateCache().setBrandName = dataState.data?.data?.brandName ?? "";
        emit(FindByCustomerIdStateSuccess(dataState.data!));
      }
      if (dataState is DataSuccess && dataState.data?.data == null) {
        emit(FindByCustomerIdStateError(dataState.data!.message!));
      }
      if (dataState is DataFailed) {
        emit(FindByCustomerIdStateError(dataState.dioError!));
      }
    } catch (e) {
      emit(const FindByCustomerIdStateInitial());
    }
  }
}
