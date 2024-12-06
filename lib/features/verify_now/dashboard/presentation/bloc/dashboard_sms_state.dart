import 'package:equatable/equatable.dart';
import 'package:messagecentral/features/verify_now/dashboard/domain/entity/dashboard_sms_entity.dart';

abstract class DashboardSMSState extends Equatable {
  final DashboardSmsEntity? dashboardSmsEntity;
  
  final String? dioError;

  const DashboardSMSState({

    this.dioError,
    this.dashboardSmsEntity,
   
  });

  @override
  List<Object?> get props => [
        //isvisibleEmailOtp,
        dioError,
        dashboardSmsEntity,
     
      ];
}

class DashboardSMSStateInitial extends DashboardSMSState {
  const DashboardSMSStateInitial();
}

class DashboardSMSStateLoading extends DashboardSMSState {
  const DashboardSMSStateLoading();
}

class DashboardSMSStateSuccess extends DashboardSMSState {
  const DashboardSMSStateSuccess(
    DashboardSmsEntity dashboardEntity,
  ) : super(dashboardSmsEntity: dashboardEntity);
}


class DashboardSMSStateError extends DashboardSMSState {
  const DashboardSMSStateError(String dioError)
      : super(dioError: dioError);
}

