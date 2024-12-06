import 'package:equatable/equatable.dart';


abstract class DashboardSMSEvent extends Equatable {

  const DashboardSMSEvent();


  @override

  List<Object> get props => [];

}


class GetDashboardSmsEventCall extends DashboardSMSEvent {

  final String? customerId;

  final String? fromDate;

  final String toDate;
  final String authToken;


  const GetDashboardSmsEventCall(
      {required this.customerId, required this.fromDate, required this.toDate, required this.authToken});

}



