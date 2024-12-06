import 'package:equatable/equatable.dart';
import 'package:messagecentral/features/verify_now/dashboard/domain/entity/dashboard_otp_entity.dart';
import 'package:messagecentral/features/verify_now/dashboard/domain/entity/dashboard_sms_entity.dart';

abstract class DashboardState extends Equatable {
  final DashboardSmsEntity? dashboardSmsEntity;
  final DashboardOtpEntity? dashboardOtpEntity;
  final String? dioError;
  //final bool? isvisibleEmailOtp;

  const DashboardState({
    //this.isvisibleEmailOtp = true,
    this.dioError,
    this.dashboardSmsEntity,
    this.dashboardOtpEntity
  });

  @override
  List<Object?> get props => [
        //isvisibleEmailOtp,
        dioError,
        dashboardSmsEntity,
        dashboardOtpEntity
      ];
}

class DashboardStateInitial extends DashboardState {
  const DashboardStateInitial();
}

class DashboardStateLoading extends DashboardState {
  const DashboardStateLoading();
}

class DashboardStateSuccess extends DashboardState {
  const DashboardStateSuccess(
    DashboardSmsEntity dashboardEntity,
  ) : super(dashboardSmsEntity: dashboardEntity);
}

class DashboardOtpStateSuccess extends DashboardState {
  const DashboardOtpStateSuccess(
    DashboardOtpEntity dashboardOtpEntity,
  ) : super(dashboardOtpEntity: dashboardOtpEntity);
}

class DashboardStateError extends DashboardState {
  const DashboardStateError(String dioError)
      : super(dioError: dioError);
}

