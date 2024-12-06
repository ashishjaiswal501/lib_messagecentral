import 'package:equatable/equatable.dart';

class GetUserDetailsEvent extends Equatable {
  const GetUserDetailsEvent();
  @override
 
  List<Object?> get props => [];
}

class GetUserDetailsCall extends GetUserDetailsEvent {
  final String authToken;
  const GetUserDetailsCall({this.authToken=""});
}
