import 'package:json_annotation/json_annotation.dart';
import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/usecase/usecase.dart';
import 'package:messagecentral/core/utils/local_state_cache.dart';
import 'package:messagecentral/features/verify_now/analytics/domain/entity/analytics_entity.dart';
import 'package:messagecentral/features/verify_now/analytics/domain/repository/analytics_repository.dart';
part 'get_analytics_usecase.g.dart';

class GetAnalyticsUseCase
    implements UseCase<DataState<AnalyticsEntity>, AnalyticsRequestPrams> {
  final AnalyticsRepository analyticsRepository;
  GetAnalyticsUseCase(this.analyticsRepository);

  @override
  Future<DataState<AnalyticsEntity>> call({AnalyticsRequestPrams? pramas}) {
    return analyticsRepository.analytics(
      customerId: LocalStateCache().customerId,
      fromDate: pramas!.fromDate,
      toDate: pramas.toDate,
      type: pramas.type,
      authToken: LocalStateCache().authToken

    );
  }
}



@JsonSerializable()
class AnalyticsRequestPrams {
  String type;
  String customerId;
  String fromDate;
  String toDate;

  AnalyticsRequestPrams(
      {this.customerId = '',
      this.fromDate = '',
      this.toDate = '',
      this.type = ''});

  factory AnalyticsRequestPrams.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsRequestPramsFromJson(json);

  // / Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$AnalyticsRequestPramsToJson(this);
}
