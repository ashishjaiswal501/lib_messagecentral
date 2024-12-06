import 'package:equatable/equatable.dart';

class FindByCustomerIdEvent extends Equatable {
  const FindByCustomerIdEvent();
  @override

  List<Object?> get props => [];
}

class FindByCustomerIdCall extends FindByCustomerIdEvent {
  final String authToken;
  final String customerId;
  const FindByCustomerIdCall({this.authToken = "", this.customerId = ""});
}
