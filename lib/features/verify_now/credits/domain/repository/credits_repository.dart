import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/features/verify_now/credits/domain/entity/low_balance_entity.dart';
import 'package:messagecentral/features/verify_now/credits/domain/entity/payment_history_entity.dart';
import 'package:messagecentral/features/verify_now/credits/domain/usecases/get_low_balance_alert_save_usecase.dart';

abstract class CreditsRepository {
    Future<DataState<PaymentHistoryEntity>> paymentHistory({ String? customerId, String? fromDate, String? toDate, String? authToken});
Future<DataState<LowBalanceEntity>> fetchLowBalance({ String? customerId, String? authToken});
Future<DataState<LowBalanceEntity>> saveLowBalanceAlertDetail({ required LowBalanceAlertRequest? lowBalanceAlertRequest,  String? authToken});
}