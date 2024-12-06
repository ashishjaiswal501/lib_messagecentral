

// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/usecase/usecase.dart';
import 'package:messagecentral/features/verify_now/dashboard/domain/entity/dashboard_sms_entity.dart';
import 'package:messagecentral/features/verify_now/dashboard/domain/repository/dashboard_repository.dart';
 part 'get_dashboard_sms_usecase.g.dart';
 
class GetDashboardSmsUsecase implements UseCase<DataState<DashboardSmsEntity>, DashboardSmsPrams> {
final DashboardRepository dashboardRepository;

GetDashboardSmsUsecase(this.dashboardRepository);

  @override
  Future<DataState<DashboardSmsEntity>> call({DashboardSmsPrams? pramas}) {
   return dashboardRepository.dashboardSmsEntity(customerId: pramas!.customerId, fromDate: pramas.fromDate,toDate: pramas.toDate, authToken: pramas.authToken);
  }
}


@JsonSerializable()
class DashboardSmsPrams{
 
  String customerId;
  String fromDate;
  String toDate;
  String authToken;

DashboardSmsPrams({ this.customerId='',this.fromDate='', this.toDate='', this.authToken=''});

 factory DashboardSmsPrams.fromJson(Map<String, dynamic> json) => _$DashboardSmsPramsFromJson(json);

 // / Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$DashboardSmsPramsToJson(this);
}