

// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/usecase/usecase.dart';
import 'package:messagecentral/features/verify_now/dashboard/domain/entity/dashboard_otp_entity.dart';
import 'package:messagecentral/features/verify_now/dashboard/domain/repository/dashboard_repository.dart';
 part 'get_dashboard_otp_usecase.g.dart';
 
class GetDashboardOtpUsecase implements UseCase<DataState<DashboardOtpEntity>, DashboardOtpPrams> {
final DashboardRepository dashboardRepository;

GetDashboardOtpUsecase(this.dashboardRepository);

  @override
  Future<DataState<DashboardOtpEntity>> call({DashboardOtpPrams? pramas}) {
   return dashboardRepository.dashboardOtpEntity(customerId: pramas!.customerId, fromDate: pramas.fromDate,toDate: pramas.toDate, authToken: pramas.authToken);
  }
}


@JsonSerializable()
class DashboardOtpPrams{
 
  String customerId;
  String fromDate;
  String toDate;
  String authToken;

DashboardOtpPrams({ this.customerId='',this.fromDate='', this.toDate='', this.authToken=''});

 factory DashboardOtpPrams.fromJson(Map<String, dynamic> json) => _$DashboardOtpPramsFromJson(json);

 // / Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$DashboardOtpPramsToJson(this);
}