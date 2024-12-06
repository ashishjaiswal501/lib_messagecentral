import 'package:equatable/equatable.dart';


abstract class DashboardEvent extends Equatable {

  const DashboardEvent();


  @override

  List<Object> get props => [];

}




class GetDashboardOtpEventCall extends DashboardEvent {

  final String? customerId;

  final String? fromDate;

  final String toDate;
  final String authToken;


  const GetDashboardOtpEventCall(
      {required this.customerId, required this.fromDate, required this.toDate, required this.authToken});

}

