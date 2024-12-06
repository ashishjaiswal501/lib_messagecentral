import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/features/verify_now/dashboard/domain/entity/dashboard_otp_entity.dart';
import 'package:messagecentral/features/verify_now/dashboard/domain/entity/dashboard_sms_entity.dart';

abstract class DashboardRepository {
  Future<DataState<DashboardOtpEntity>> dashboardOtpEntity(
      {required String customerId,
      required String fromDate,
      required String toDate, 
      required String authToken});

  Future<DataState<DashboardSmsEntity>> dashboardSmsEntity(
      {required String customerId,
      required String fromDate,
      required String toDate,
      required String authToken});
}
