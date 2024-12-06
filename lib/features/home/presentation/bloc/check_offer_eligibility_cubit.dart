import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messagecentral/core/resources/data_state.dart';
import 'package:messagecentral/features/home/domain/usecases/get_check_offer_eligibility_usecase.dart';
import 'package:messagecentral/features/home/presentation/bloc/check_offer_eligibility_state.dart';
import 'package:messagecentral/features/home/presentation/bloc/check_offer_update_eligibility_state.dart';

class CheckOfferEligibilityUpdateCubit
    extends Cubit<CheckOfferUpdateEligibilityState> {
  final GetCheckOfferUpdateUsecase getCheckOfferUpdateUsecase;
  CheckOfferEligibilityUpdateCubit(this.getCheckOfferUpdateUsecase)
      : super(CheckOfferUpdateEligibilityState.initial());

  void updateCheckOfferEligibility() async {
    try {
      emit(CheckOfferUpdateEligibilityState.loading());
      final dataState = await getCheckOfferUpdateUsecase.call();

      if (dataState is DataSuccess && dataState.data != null) {
        emit(CheckOfferUpdateEligibilityState.success(dataState.data!));
      }

      if (dataState is DataFailed) {
        emit(CheckOfferUpdateEligibilityState.error(dataState.dioError!));
      }
    } catch (e) {
      emit(CheckOfferUpdateEligibilityState.error(e.toString()));
    }
  }
}

class CheckOfferEligibilityCubit extends Cubit<CheckOfferEligibilityState> {
  final GetCheckOfferEligibilityUsecase getCheckOfferEligibilityUsecase;
  CheckOfferEligibilityCubit(this.getCheckOfferEligibilityUsecase)
      : super(CheckOfferEligibilityState.initial()) {
    getCheckOfferEligibility();
  }

  void getCheckOfferEligibility() async {
    try {
      emit(CheckOfferEligibilityState.loading());
      final dataState = await getCheckOfferEligibilityUsecase.call(pramas: '1');

      if (dataState is DataSuccess && dataState.data != null) {
        emit(CheckOfferEligibilityState.success(dataState.data!));
      }

      if (dataState is DataFailed) {
        emit(CheckOfferEligibilityState.error(dataState.dioError!));
      }
    } catch (e) {
      emit(CheckOfferEligibilityState.error(e.toString()));
    }
  }
}
