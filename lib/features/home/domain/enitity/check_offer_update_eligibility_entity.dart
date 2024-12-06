

import 'package:freezed_annotation/freezed_annotation.dart';


part 'check_offer_update_eligibility_entity.freezed.dart';

@freezed
class CheckOfferUpdateEligibilityEntity with _$CheckOfferUpdateEligibilityEntity {
    const factory CheckOfferUpdateEligibilityEntity({
        int? responseCode,
        String? message,
        Dataoffer? data,
    }) = _CheckOfferUpdateEligibilityEntity;
}

@freezed
class Dataoffer with _$Dataoffer {
    const factory Dataoffer({
        DateTime? endDate,
        String? username,
    }) = _Dataoffer;
}
