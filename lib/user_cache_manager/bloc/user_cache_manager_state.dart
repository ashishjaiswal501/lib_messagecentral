import 'package:equatable/equatable.dart';
import 'package:messagecentral/user_cache_manager/bloc/user_cache_manager.dart';

abstract class UserCacheManagerState extends Equatable {
  final UserCacheManager? userCacheManager;
  const UserCacheManagerState({this.userCacheManager});
  @override
  List<Object?> get props => [userCacheManager];
}

class UserCacheManagerStateInitial extends UserCacheManagerState {
  const UserCacheManagerStateInitial();
}

class UserCacheManagerStateLoading extends UserCacheManagerState {
  const UserCacheManagerStateLoading();
}

class UserCacheManagerStateSuccess extends UserCacheManagerState {
  const UserCacheManagerStateSuccess(
    UserCacheManager? userCacheManager,
  ) : super(userCacheManager: userCacheManager);
}
