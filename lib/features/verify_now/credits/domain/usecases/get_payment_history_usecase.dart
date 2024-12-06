import 'package:json_annotation/json_annotation.dart';
import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/core/usecase/usecase.dart';
import 'package:messagecentral/core/utils/local_state_cache.dart';
import 'package:messagecentral/features/verify_now/credits/domain/entity/payment_history_entity.dart';
import 'package:messagecentral/features/verify_now/credits/domain/repository/credits_repository.dart';
 part 'get_payment_history_usecase.g.dart';
class GetPaymentHistoryUsecase implements UseCase<DataState<PaymentHistoryEntity>, PaymentHistoryRequestPrams> {
final CreditsRepository paymentHistoryRepository;
GetPaymentHistoryUsecase(this.paymentHistoryRepository);

  @override
  Future<DataState<PaymentHistoryEntity>> call({PaymentHistoryRequestPrams? pramas}) {
   return paymentHistoryRepository.paymentHistory(customerId: pramas!.customerId, fromDate: pramas.fromDate, toDate: pramas.toDate, authToken: LocalStateCache().authToken);
  }
}


@JsonSerializable()
class PaymentHistoryRequestPrams{
 
  String customerId;
  String fromDate;
  String toDate;

PaymentHistoryRequestPrams({ this.customerId='', this.fromDate='',this.toDate=''});

 factory PaymentHistoryRequestPrams.fromJson(Map<String, dynamic> json) => _$PaymentHistoryRequestPramsFromJson(json);

 // / Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PaymentHistoryRequestPramsToJson(this);
}