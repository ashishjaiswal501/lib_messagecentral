import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/utils/local_state_cache.dart';
import 'package:messagecentral/features/account_details/domain/usecases/get_account_details_usecase.dart';
import 'package:messagecentral/features/account_details/presentation/screens/bloc/account_details_event.dart';
import 'package:messagecentral/features/account_details/presentation/screens/bloc/account_details_state.dart';

class AccountDetailsBloc
    extends Bloc<AccountDetailsEvent, AccountDetailsState> {
  final GetAccountDetailsUseCase getAccountDetailsUseCase;
  AccountDetailsBloc(this.getAccountDetailsUseCase)
      : super(const AccountDetailsStateInitial()) {
    on<GetAccountDetailsUpdatePressed>(onAccountDetailsUpdaddate);
  }

  void onAccountDetailsUpdaddate(GetAccountDetailsUpdatePressed event,
      Emitter<AccountDetailsState> emit) async {
    try {
      emit(const AccountDetailsStateLoading());
      final dataState = await getAccountDetailsUseCase(
          pramas: AccountDetailsRequest(
              email: event.email!,
              customerId: LocalStateCache().customerId,
              firstName: event.fname,
              lastName: event.lName,
              address: event.address,
              city: event.city,
              state: event.state,
              country: event.country,
              postalCode: event.postalCode));
      if (dataState is DataSuccess && dataState.data != null) {
        emit(AccountDetailsStateSuccess(dataState.data!));
      }
      if (dataState is DataFailed) {
        emit(AccountDetailsStateError(dataState.dioError!));
      }
    } catch (e) {
      emit(const AccountDetailsStateInitial());
    }
  }
}
