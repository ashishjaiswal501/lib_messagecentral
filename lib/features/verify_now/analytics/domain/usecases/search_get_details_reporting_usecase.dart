import 'package:json_annotation/json_annotation.dart';
import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/usecase/usecase.dart';
import 'package:messagecentral/core/utils/local_state_cache.dart';
import 'package:messagecentral/features/verify_now/analytics/domain/entity/search_details_reporting_entity.dart';
import 'package:messagecentral/features/verify_now/analytics/domain/repository/search_details_reporting_repository.dart';

part 'search_get_details_reporting_usecase.g.dart';

class SearchGetDetailsReportingUseCase
    implements
        UseCase<DataState<DetailsReportingSearchEntity>,
            SearchDetailsReportingRequestPrams> {
  final SearchDetailsReportingRepository searchDetailsReportingRepository;
  SearchGetDetailsReportingUseCase(this.searchDetailsReportingRepository);

  @override
  Future<DataState<DetailsReportingSearchEntity>> call(
      {SearchDetailsReportingRequestPrams? pramas}) {
    return searchDetailsReportingRepository.searchDetailedReporting(
        customerId: LocalStateCache().customerId,
        query: pramas?.query,
        pageNo: pramas?.pageNo,
        size: pramas?.size,
        type: pramas?.type,
        authToken: LocalStateCache().authToken);
  }
}

@JsonSerializable()
class SearchDetailsReportingRequestPrams {
  late String customerId;
  String query;
  String pageNo;
  String size;
  String type;

  SearchDetailsReportingRequestPrams(
      {this.customerId = '',
      this.query = '',
      this.pageNo = '',
      this.size = '',
      this.type = ''});

  factory SearchDetailsReportingRequestPrams.fromJson(
          Map<String, dynamic> json) =>
      _$SearchDetailsReportingRequestPramsFromJson(json);

  // / Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() =>
      _$SearchDetailsReportingRequestPramsToJson(this);
}
