import 'package:json_annotation/json_annotation.dart';
import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/usecase/usecase.dart';
import 'package:messagecentral/core/utils/local_state_cache.dart';
import 'package:messagecentral/features/verify_now/analytics/domain/entity/details_reporting_entity.dart';
import 'package:messagecentral/features/verify_now/analytics/domain/repository/details_reporting_repository.dart';

part 'get_details_reporting_usecase.g.dart';

class GetDetailsReportingUseCase
    implements
        UseCase<DataState<DetailsReportingEntity>,
            DetailsReportingRequestPrams> {
  final DetailsReportingRepository detailsReportingRepository;
  GetDetailsReportingUseCase(this.detailsReportingRepository);

  @override
  Future<DataState<DetailsReportingEntity>> call(
      {DetailsReportingRequestPrams? pramas}) {
    return detailsReportingRepository.detailsReporting(
        customerId: LocalStateCache().customerId,
        from: pramas!.from,
        pageNo: pramas.pageNo,
        size: pramas.size,
        to: pramas.to,
        type: pramas.type,
        authToken: LocalStateCache().authToken);
  }
}

@JsonSerializable()
class DetailsReportingRequestPrams {
  late String customerId;
  String from;
  String pageNo;
  String size;
  String to;
  String type;

  DetailsReportingRequestPrams(
      {this.customerId = '',
      this.from = '',
      this.pageNo = '',
      this.size = '',
      this.to = '',
      this.type = ''});

  factory DetailsReportingRequestPrams.fromJson(Map<String, dynamic> json) =>
      _$DetailsReportingRequestPramsFromJson(json);

  // / Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic>  toJson() =>
      _$DetailsReportingRequestPramsToJson(this);
}

  // // / Connect the generated [_$PersonToJson] function to the `toJson` method.
  // Map<String, dynamic> toJson() => _$AnalyticsRequestPramsToJson(this);