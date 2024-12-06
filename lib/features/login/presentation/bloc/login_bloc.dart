import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/utils/local_state_cache.dart';
import 'package:messagecentral/features/login/domain/usecases/get_login_usecase.dart';
import 'package:messagecentral/features/login/presentation/bloc/login_event.dart';
import 'package:messagecentral/features/login/presentation/bloc/login_state.dart';

import 'package:messagecentral/user_cache_manager/bloc/user_cache_manager_bloc.dart';
import 'package:messagecentral/user_cache_manager/bloc/user_cache_manager_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final GetLoginUsecase getLoginUsecase;
  final UserCacheManagerBloc userCacheManagerBloc;

  LoginBloc({
    required this.getLoginUsecase,
    required this.userCacheManagerBloc,
  }) : super(const LoginStateInitial()) {
    on<GetLoginPressedButton>(onLogin);
    on<GetobscureTextVisibility>(onpasswordVisibility);
  }
  void onLogin(GetLoginPressedButton event, Emitter<LoginState> emit) async {
    try {
      emit(const LoginStateLoading());
      final dataState = await getLoginUsecase(
          pramas: LoginRequestPrams(
              email: event.email!, password: event.password!));
      if (dataState is DataSuccess && dataState.data != null) {
        emit(LoginStateSuccess(dataState.data!));
           LocalStateCache().fName =
            dataState.data?.userData?.firstName ?? "";
            LocalStateCache().emailId =
            dataState.data?.userData?.email ?? "";
            LocalStateCache().phoneNo =
            dataState.data?.userData?.phoneNo ?? "";
            LocalStateCache().countryCode =
            dataState.data?.userData?.countryCode ?? "";
        
        userCacheManagerBloc.add(GetUserCacheManagerEvent(
            authToken: dataState.data?.userData?.authToken ?? "",
            customerId: dataState.data?.userData?.customerId ?? "",
            isUserAutheticated: dataState.data != null ? true : false));
      }
      if (dataState is DataFailed) {
        emit(LoginStateError(dataState.dioError!));
      }
    } catch (e) {
      emit(const LoginStateInitial());
    }
  }

// password visibility..
  void onpasswordVisibility(
      GetobscureTextVisibility event, Emitter<LoginState> emit) async {
    if (event.obscureText == true) {
      emit(const ObscureTextVisibilityState(false));
    } else {
      emit(const ObscureTextVisibilityState(true));
    }
  }
}
