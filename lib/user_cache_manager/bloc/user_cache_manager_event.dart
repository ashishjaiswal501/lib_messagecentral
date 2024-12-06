import 'package:equatable/equatable.dart';

abstract class UserCacheManagerEvent extends Equatable {
  const UserCacheManagerEvent();

  @override
  List<Object> get props => [];
}

class GetUserCacheManagerEvent extends UserCacheManagerEvent {
  final String? authToken;
  final String? customerId;
  final bool isUserAutheticated;

  const GetUserCacheManagerEvent(
      {this.authToken = '',
      this.customerId = '',
      this.isUserAutheticated = false});
}
