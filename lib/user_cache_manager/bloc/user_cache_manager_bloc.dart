import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:messagecentral/core/utils/local_state_cache.dart';

import 'package:messagecentral/user_cache_manager/bloc/user_cache_manager.dart';
import 'package:messagecentral/user_cache_manager/bloc/user_cache_manager_event.dart';
import 'package:messagecentral/user_cache_manager/bloc/user_cache_manager_state.dart';

class UserCacheManagerBloc
    extends HydratedBloc<UserCacheManagerEvent, UserCacheManagerState>
    with ChangeNotifier {
  UserCacheManagerBloc() : super(const UserCacheManagerStateInitial()) {
    on<GetUserCacheManagerEvent>(onSetUserCacheManager);
  }

  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;
  void loginSession() {
    // ignore: avoid_print
   
    if (LocalStateCache().authToken.isNotEmpty) {
      _isLoggedIn = true;
     
      notifyListeners();
    } else {
      _isLoggedIn = false;
     
      notifyListeners();
    }
  }

  void onSetUserCacheManager(
      GetUserCacheManagerEvent event, Emitter<UserCacheManagerState> emit) {
    emit(UserCacheManagerStateSuccess(UserCacheManager(
        authToken: event.authToken!, customerId: event.customerId!)));
  }

  @override
  UserCacheManagerState? fromJson(Map<String, dynamic> json) {
    try {
      final UserCacheManager userCacheManager = UserCacheManager.fromJson(json);

      return UserCacheManagerStateSuccess(userCacheManager);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(UserCacheManagerState state) {
    if (state is UserCacheManagerStateSuccess) {
      return state.userCacheManager?.toJson();
    } else {
      return null;
    }
  }
}

/// The login information.
class LoginInfo extends ChangeNotifier {
  /// The username of login.
  String get userName => _userName;
  String _userName = '';

  /// Whether a user has logged in.
  bool get loggedIn => _userName.isNotEmpty;

  /// Logs in a user.
  void login(String userName) {
    _userName = userName;
    notifyListeners();
  }

  /// Logs out the current user.
  void logout() {
    _userName = '';
    notifyListeners();
  }
}
