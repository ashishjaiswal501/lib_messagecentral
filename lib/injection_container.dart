import 'dart:async';
import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:messagecentral/core/base/features/countrycode/data/data_resources/remote/country_code_api_service.dart';
import 'package:messagecentral/core/base/features/countrycode/data/repository/country_code_repository_impl.dart';
import 'package:messagecentral/core/base/features/countrycode/domain/repository/country_code_repository.dart';
import 'package:messagecentral/core/base/features/countrycode/domain/usecases/get_country_code_usecase.dart';
import 'package:messagecentral/core/resources/logging_interceptor.dart';
import 'package:messagecentral/core/utils/local_state_cache.dart';
import 'package:messagecentral/features/account_details/data/data_sources/remote/user_account_detail_api_service.dart';
//import 'package:messagecentral/features/account_details/data/data_sources/remote/account_user_details_api_service.dart';
import 'package:messagecentral/features/account_details/data/repository/account_details_repository_impl.dart';
import 'package:messagecentral/features/account_details/domain/repository/account_details_repository.dart';
import 'package:messagecentral/features/account_details/domain/usecases/get_account_details_usecase.dart';
import 'package:messagecentral/features/account_details/domain/usecases/get_update_password_usecase.dart';
import 'package:messagecentral/features/account_details/domain/usecases/get_update_phoneno_otp_usecase.dart';
import 'package:messagecentral/features/account_details/domain/usecases/get_update_phoneno_usecase.dart';
import 'package:messagecentral/features/account_details/presentation/screens/bloc/account_details_bloc.dart';
import 'package:messagecentral/features/account_details/presentation/screens/bloc/update_password_bloc.dart';
import 'package:messagecentral/features/account_details/presentation/screens/bloc/update_phone_no_bloc.dart';
import 'package:messagecentral/features/account_details/presentation/screens/bloc/update_phone_no_get_otp_bloc.dart';
import 'package:messagecentral/features/find_by_customer_id/data/data_source/remote/find_by_customer_id_api_service.dart';
import 'package:messagecentral/features/find_by_customer_id/data/repository/find_by_customer_id_repository_impl.dart';
import 'package:messagecentral/features/find_by_customer_id/domain/repository/find_by_customer_id_repository.dart';
import 'package:messagecentral/features/find_by_customer_id/domain/usecase/find_by_customer_id_usecase.dart';
import 'package:messagecentral/features/find_by_customer_id/presentation/bloc/find_by_customer_id_bloc.dart';
import 'package:messagecentral/features/forget_password/data/data_sources/remote/forget_password_api_service.dart';
import 'package:messagecentral/features/forget_password/data/repository/forget_password_repository_impl.dart';
import 'package:messagecentral/features/forget_password/domain/repository/forget_password_repository.dart';
import 'package:messagecentral/features/forget_password/domain/usecases/get_confirm_password_usecase.dart';
import 'package:messagecentral/features/forget_password/domain/usecases/get_forget_password_email_usecase.dart';
import 'package:messagecentral/features/forget_password/domain/usecases/get_forget_password_otp_usecase.dart';
import 'package:messagecentral/features/forget_password/presentation/screens/bloc/forget_password_bloc.dart';
import 'package:messagecentral/features/forget_password/presentation/screens/bloc/forget_password_otp_bloc.dart';
import 'package:messagecentral/features/getuserdeails/data/data_sources/remote/get_user_deails_api_service.dart';
import 'package:messagecentral/features/getuserdeails/data/repository/get_user_details_repository.dart';
import 'package:messagecentral/features/getuserdeails/domain/repository/get_user_details_repository_impl.dart';
import 'package:messagecentral/features/getuserdeails/domain/usecases/get_user_details_usecase.dart';
import 'package:messagecentral/features/getuserdeails/presentation/bloc/get_user_details_bloc.dart';
import 'package:messagecentral/features/home/data/data_sources/remote/home_api_service.dart';
import 'package:messagecentral/features/home/data/repository/home_repository_impl.dart';
import 'package:messagecentral/features/home/domain/repository/home_repository.dart';
import 'package:messagecentral/features/home/domain/usecases/get_check_offer_eligibility_usecase.dart';
import 'package:messagecentral/features/home/presentation/bloc/check_offer_eligibility_cubit.dart';
import 'package:messagecentral/features/login/data/data_sources/remote/login_api_service.dart';
import 'package:messagecentral/features/login/data/repository/login_repository_impl.dart';
import 'package:messagecentral/features/login/domain/repository/login_repository.dart';
import 'package:messagecentral/features/login/domain/usecases/get_login_usecase.dart';
import 'package:messagecentral/features/login/presentation/bloc/login_bloc.dart';
import 'package:messagecentral/features/signup/data/data_sources/remote/signup_api_service.dart';
import 'package:messagecentral/features/signup/data/repository/signup_repository_impl.dart';
import 'package:messagecentral/features/signup/domain/repository/signup_repository.dart';
import 'package:messagecentral/features/signup/domain/usecases/get_resend_otp_usecase.dart';
import 'package:messagecentral/features/signup/domain/usecases/get_signup_otp_usecase.dart';
import 'package:messagecentral/features/signup/domain/usecases/get_signup_usecase.dart';
import 'package:messagecentral/features/signup/domain/usecases/get_signup_verify_otp_usecase.dart';
import 'package:messagecentral/features/signup/presentation/bloc/resend_otp_bloc.dart';
import 'package:messagecentral/features/signup/presentation/bloc/signup_bloc.dart';
import 'package:messagecentral/features/signup/presentation/bloc/signup_otp_bloc.dart';
import 'package:messagecentral/features/signup/presentation/bloc/signup_otp_verify_bloc.dart';
import 'package:messagecentral/features/verify_now/analytics/data/data_sources/remote/analytics_api_service.dart';
import 'package:messagecentral/features/verify_now/analytics/data/data_sources/remote/details_reporting_api_serivce.dart';
import 'package:messagecentral/features/verify_now/analytics/data/data_sources/remote/search_details_reporting_api_service.dart';
import 'package:messagecentral/features/verify_now/analytics/data/repository/analytics_repository_impl.dart';
import 'package:messagecentral/features/verify_now/analytics/data/repository/details_reporting_repository_impl.dart';
import 'package:messagecentral/features/verify_now/analytics/data/repository/search_details_reporting_repository_impl.dart';
import 'package:messagecentral/features/verify_now/analytics/domain/repository/analytics_repository.dart';
import 'package:messagecentral/features/verify_now/analytics/domain/repository/details_reporting_repository.dart';
import 'package:messagecentral/features/verify_now/analytics/domain/repository/search_details_reporting_repository.dart';
import 'package:messagecentral/features/verify_now/analytics/domain/usecases/get_analytics_usecase.dart';
import 'package:messagecentral/features/verify_now/analytics/domain/usecases/get_details_reporting_usecase.dart';
import 'package:messagecentral/features/verify_now/analytics/domain/usecases/search_get_details_reporting_usecase.dart';
import 'package:messagecentral/features/verify_now/analytics/presentation/bloc/otp_analytics_cubit.dart';
import 'package:messagecentral/features/verify_now/analytics/presentation/bloc/otp_details_reporting_cubit.dart';
import 'package:messagecentral/features/verify_now/analytics/presentation/bloc/otp_search_details_reporting_cubit.dart';
import 'package:messagecentral/features/verify_now/analytics/presentation/bloc/sms_analytics_cubit.dart';
import 'package:messagecentral/features/verify_now/analytics/presentation/bloc/sms_details_reporting_cubit.dart';
import 'package:messagecentral/features/verify_now/analytics/presentation/bloc/sms_search_details_reporting_cubit.dart';
import 'package:messagecentral/features/verify_now/credits/data/data_sources/remote/credits_api_service.dart';
import 'package:messagecentral/features/verify_now/credits/data/repository/credits_repository_impl.dart';
import 'package:messagecentral/features/verify_now/credits/domain/repository/credits_repository.dart';
import 'package:messagecentral/features/verify_now/credits/domain/usecases/get_low_balance_alert_save_usecase.dart';
import 'package:messagecentral/features/verify_now/credits/domain/usecases/get_low_balance_usecase.dart';
import 'package:messagecentral/features/verify_now/credits/domain/usecases/get_payment_history_usecase.dart';
import 'package:messagecentral/features/verify_now/credits/presentation/bloc/low_balalce_cubit.dart';
import 'package:messagecentral/features/verify_now/credits/presentation/bloc/low_balance_alert_save_cubit.dart';
import 'package:messagecentral/features/verify_now/credits/presentation/bloc/payment_history_cubit.dart';
import 'package:messagecentral/features/verify_now/dashboard/data/data_sources/remote/dashboard_api_service.dart';
import 'package:messagecentral/features/verify_now/dashboard/data/repository/dashboard_repository_impl.dart';
import 'package:messagecentral/features/verify_now/dashboard/domain/repository/dashboard_repository.dart';
import 'package:messagecentral/features/verify_now/dashboard/domain/usecases/get_dashboard_otp_usecase.dart';
import 'package:messagecentral/features/verify_now/dashboard/domain/usecases/get_dashboard_sms_usecase.dart';
import 'package:messagecentral/features/verify_now/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:messagecentral/features/verify_now/dashboard/presentation/bloc/dashboard_sms_bloc.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/data/data_sources/remote/send_a_sms_api_service.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/data/data_sources/remote/stepone_register_save_api_service.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/data/repository/send_a_sms_repository_impl.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/data/repository/stepone_register_save_repository_impl.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/domin/repository/send_a_sms_repository.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/domin/repository/stepone_register_save_repository.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/domin/usecases/get_stepone_registration_getDemo_usecase.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/domin/usecases/send_a_sms_usecase.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/domin/usecases/stepone_registration_save_usecase.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/presentation/bloc/send_a_sms_bloc.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/presentation/bloc/stepone_registration_getdemo_bloc.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/presentation/bloc/stepone_registration_save_bloc.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/data/data_sources/remote/verify_a_user_api_service.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/data/repository/verify_a_user_repository_impl.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/domin/repository/verify_a_user_repository.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/domin/usecases/get_verify_a_user_otp_verification_usecase.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/domin/usecases/get_verify_a_user_usecase.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/domin/usecases/verify_a_user_update_brand_name_usecase.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/presentation/bloc/brand_name_bloc.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/presentation/bloc/verify_a_user_bloc.dart';
import 'package:messagecentral/features/wallet_balance/data/data_sources/remote/wallet_balance_api_service.dart';
import 'package:messagecentral/features/wallet_balance/data/repository/wallet_balance_repository_impl.dart';
import 'package:messagecentral/features/wallet_balance/domain/repository/wallet_balance_repository.dart';
import 'package:messagecentral/features/wallet_balance/domain/usecases/wallet_balance_usecase.dart';
import 'package:messagecentral/features/wallet_balance/presentation/bloc/wallet_balance_bloc.dart';
import 'package:messagecentral/user_cache_manager/bloc/user_cache_manager_bloc.dart';

import 'core/base/features/countrycode/presentation/screens/cubit/country_code_cubit.dart';

final GetIt getIt = GetIt.instance;

Future<void> configureDependencies() async {
  // DioModule.setup();
  // getIt.registerSingleton<Dio>(Dio());
  final appState = LocalStateCache();
  // appState.clearChache();
  await appState.createCache();

  getIt.registerSingleton<Dio>(DioFactory().create());
  // getIt.registerFactory<UserCacheManagerBloc>(() => UserCacheManagerBloc());
  getIt.registerSingleton<UserCacheManagerBloc>(UserCacheManagerBloc());

  getIt.registerFactory<LoginAPiService>(
    () => LoginAPiService(getIt()),
  );

  getIt.registerFactory<DashboardApiService>(
    () => DashboardApiService(getIt()),
  );
  getIt.registerFactory<SignupAPiService>(
    () => SignupAPiService(getIt()),
  );

  getIt.registerFactory<ForgetPasswordApiService>(
    () => ForgetPasswordApiService(getIt()),
  );

  getIt.registerFactory<VerifyAUserApiService>(
    () => VerifyAUserApiService(getIt()),
  );
  getIt.registerFactory<SendASmsAPiService>(
    () => SendASmsAPiService(getIt()),
  );

  // getIt.registerFactory<DashboardApiService>(
  //   () => DashboardApiService(getIt()),
  // );

  getIt.registerFactory<CountryCodeApiService>(
    () => CountryCodeApiService(getIt()),
  );

  getIt.registerFactory<GetUserDetailsAPiService>(
    () => GetUserDetailsAPiService(getIt()),
  );

  getIt.registerFactory<FindByCustomerIdAPiService>(
    () => FindByCustomerIdAPiService(getIt()),
  );
  getIt.registerFactory<WalletBalanceApiService>(
    () => WalletBalanceApiService(getIt()),
  );

  getIt.registerFactory<UserAccountDetailsApiService>(
    () => UserAccountDetailsApiService(getIt()),
  );
  getIt.registerFactory<CreditsApiService>(
    () => CreditsApiService(getIt()),
  );

  getIt.registerFactory<AnalyticsApiService>(
    () => AnalyticsApiService(getIt()),
  );
  getIt.registerFactory<HomeApiService>(
    () => HomeApiService(getIt()),
  );
  getIt.registerFactory<DetailsReportingApiService>(
    () => DetailsReportingApiService(getIt()),
  );
  getIt.registerFactory<SearchDetailsReportingApiService>(
    () => SearchDetailsReportingApiService(getIt()),
  );

  getIt.registerFactory<SteponeRegisterSaveAPiService>(
    () => SteponeRegisterSaveAPiService(getIt()),
  );
// Dependencies//

  getIt.registerSingleton<LoginRepository>(
      LoginRepositoryImpl(loginAPiService: getIt<LoginAPiService>()));

  getIt.registerSingleton<DashboardRepository>(DashboardRepositoryImpl(
      dashboardApiService: getIt<DashboardApiService>()));

  getIt.registerSingleton<ForgetPasswordRepository>(
      ForgetPasswordRepositoryImpl(
          forgetPasswordApiService: getIt<ForgetPasswordApiService>()));
  getIt.registerSingleton<SignupRepository>(
      SignupRepositoryImpl(signupAPiService: getIt<SignupAPiService>()));

  getIt.registerSingleton<SendASmsRepository>(
      SendASmsRepositoryImpl(sendASmsApiService: getIt<SendASmsAPiService>()));

  getIt.registerSingleton<CountryCodeRepository>(CountryCodeRepositoryImpl(
      countryCodeApiService: getIt<CountryCodeApiService>()));

  getIt.registerSingleton<GetUserDetailsRepository>(
      GetUserDetailsRepositoryImpl(getIt<GetUserDetailsAPiService>()));

  getIt.registerSingleton<WalletBalanceRepository>(
      WalletBalanceRepositoryImpl(getIt<WalletBalanceApiService>()));

  getIt.registerSingleton<FindByCustomerIdRepository>(
      FindByCustomerIdRepositoryImpl(getIt<FindByCustomerIdAPiService>()));

  getIt.registerSingleton<VerifyAUserRepository>(VerifyAUserRepositoryImpl(
      verifyAUserApiService: getIt<VerifyAUserApiService>()));

  getIt.registerSingleton<AccountDetailsRepository>(
      AccountDetailsRepositoryImpl(getIt()));
  getIt.registerSingleton<CreditsRepository>(CreditsRepositoryImpl(getIt()));

  getIt
      .registerSingleton<AnalyticsRepository>(AnalyticsRepositoryImpl(getIt()));
  getIt.registerSingleton<HomeRepository>(HomeRepositoryImpl(getIt()));

  getIt.registerSingleton<SteponeRegisterSaveRepository>(
      SteponeRegisterSaveRepositoryImpl(
          steponeRegisterSaveAPiService: getIt()));

// UseCases
  // login
  getIt.registerSingleton<GetLoginUsecase>(
      GetLoginUsecase(getIt<LoginRepository>()));

  // getIt.registerSingleton<DashboardRepository>(
  //     DashboardRepositoryImpl(dashboardApiService: getIt<DashboardApiService>()));

//forgetpassword
  getIt.registerSingleton<GetForgetPasswordEmailUsecase>(
      GetForgetPasswordEmailUsecase(
          forgetPasswordRepository: getIt<ForgetPasswordRepository>()));

  getIt.registerSingleton<GetForgetPasswordOtpUsecase>(
      GetForgetPasswordOtpUsecase(
          forgetPasswordRepository: getIt<ForgetPasswordRepository>()));

  getIt.registerSingleton<GetConfirmPasswordUsecase>(GetConfirmPasswordUsecase(
      forgetPasswordRepository: getIt<ForgetPasswordRepository>()));

//dashboard
  getIt.registerSingleton<GetDashboardSmsUsecase>(
      GetDashboardSmsUsecase(getIt<DashboardRepository>()));

  getIt.registerSingleton<GetDashboardOtpUsecase>(
      GetDashboardOtpUsecase(getIt<DashboardRepository>()));

  // signup
  getIt.registerSingleton<GetSignupUsecase>(
      GetSignupUsecase(getIt<SignupRepository>()));

  getIt.registerSingleton<GetSignupOtpUsecase>(
      GetSignupOtpUsecase(getIt<SignupRepository>()));

  getIt.registerSingleton<GetSignupVerifyOtpUsecase>(
      GetSignupVerifyOtpUsecase(getIt<SignupRepository>()));
// resend
  getIt.registerSingleton<GetResendOtpUsecase>(
      GetResendOtpUsecase(getIt<SignupRepository>()));

  getIt.registerSingleton<GetCountryCodeUseCase>(GetCountryCodeUseCase(
      countryCodeRepository: getIt<CountryCodeRepository>()));
  getIt.registerSingleton<GetUserDetailsUsecase>(
      GetUserDetailsUsecase(getIt<GetUserDetailsRepository>()));
  getIt.registerFactory<SendASmsBloc>(() => SendASmsBloc(
        sendASmsUsecase: getIt(),
      ));

  getIt.registerSingleton<FindByCustomerIdUsecase>(FindByCustomerIdUsecase(
      findByCustomerIdRepository: getIt<FindByCustomerIdRepository>()));

  getIt.registerSingleton<WalletBalanceUsecase>(WalletBalanceUsecase(
      walletBalanceRepository: getIt<WalletBalanceRepository>()));

  getIt.registerSingleton<DetailsReportingRepository>(
      DetailsReportingRepositoryImpl(getIt()));

  getIt.registerSingleton<SearchDetailsReportingRepository>(
      SearchDetailsReportingRepositoryImpl(getIt()));
//verify a user

  getIt.registerSingleton<SendASmsUsecase>(
      SendASmsUsecase(sendASmsRepository: getIt<SendASmsRepository>()));
  getIt.registerSingleton<GetVerifyAUserUsecase>(GetVerifyAUserUsecase(
      verifyAUserRepository: getIt<VerifyAUserRepository>()));

  getIt.registerSingleton<GetVerifyAUserOtpVerificationUsecase>(
      GetVerifyAUserOtpVerificationUsecase(
          verifyAUserRepository: getIt<VerifyAUserRepository>()));

  getIt.registerSingleton<GetVerifyAUserUpdateBrandNameUsecase>(
      GetVerifyAUserUpdateBrandNameUsecase(
          verifyAUserRepository: getIt<VerifyAUserRepository>()));

  getIt.registerSingleton<GetAccountDetailsUseCase>(
      GetAccountDetailsUseCase(getIt()));

  getIt.registerSingleton<GetUpdatePhoneNoUseCase>(
      GetUpdatePhoneNoUseCase(getIt()));
  getIt.registerSingleton<GetUpdatePhoneNoOtpUseCase>(
      GetUpdatePhoneNoOtpUseCase(getIt()));
  getIt.registerSingleton<GetUpdatePasswordUseCase>(
      GetUpdatePasswordUseCase(getIt()));
  getIt.registerSingleton<GetPaymentHistoryUsecase>(
      GetPaymentHistoryUsecase(getIt()));
  getIt.registerSingleton<GetLowBalanceUsecase>(GetLowBalanceUsecase(getIt()));
  getIt.registerSingleton<GetLowBalanceAlertSaveUsecase>(
      GetLowBalanceAlertSaveUsecase(getIt()));
  getIt.registerSingleton<GetAnalyticsUseCase>(GetAnalyticsUseCase(getIt()));

  getIt.registerSingleton<GetCheckOfferEligibilityUsecase>(
      GetCheckOfferEligibilityUsecase(getIt()));
  getIt.registerSingleton<GetCheckOfferUpdateUsecase>(
      GetCheckOfferUpdateUsecase(getIt()));

  getIt.registerSingleton<GetDetailsReportingUseCase>(
      GetDetailsReportingUseCase(getIt()));
  getIt.registerSingleton<SearchGetDetailsReportingUseCase>(
      SearchGetDetailsReportingUseCase(getIt()));

  getIt.registerSingleton<SteponeRegistrationSaveUsecase>(
      SteponeRegistrationSaveUsecase(steponeRegisterSaveRepository: getIt()));
  getIt.registerSingleton<GetSteponeRegistrationGetDemoUsecase>(
      GetSteponeRegistrationGetDemoUsecase(
          steponeRegisterSaveRepository: getIt()));

// Blocs

  getIt.registerFactory<LoginBloc>(() => LoginBloc(
        getLoginUsecase: getIt(),
        userCacheManagerBloc: getIt(),
      ));

  getIt.registerFactory<ForgetPasswordBloc>(() => ForgetPasswordBloc(
      getForgetPasswordEmailUsecase: getIt(),
      getForgetPasswordOtpUsecase: getIt(),
      getConfirmPasswordUsecase: getIt()));

  getIt.registerFactory<ForgetPasswordOtpBloc>(() => ForgetPasswordOtpBloc(
        getForgetPasswordOtpUsecase: getIt(),
      ));

  getIt.registerFactory<SignupBloc>(
    () => SignupBloc(
        getSignupUsecase: getIt(),
        getSignupOtpUsecase: getIt(),
        getSignupVerifyOtpUsecase: getIt(),
        getResendyOtpUsecase: getIt(),
        userCacheManagerBloc: getIt()),
  );
  getIt.registerFactory<SignupOtpBloc>(
    () => SignupOtpBloc(
      getSignupOtpUsecase: getIt(),
    ),
  );

  getIt.registerFactory<SignupOtpVerifyBloc>(
    () => SignupOtpVerifyBloc(
        getSignupVerifyOtpUsecase: getIt(), userCacheManagerBloc: getIt()),
  );
  getIt.registerFactory<ResendOtpBloc>(
    () => ResendOtpBloc(getResendOtpUsecase: getIt()),
  );
  getIt.registerFactory<CountryCodeCubit>(
    () => CountryCodeCubit(getIt()),
  );
  getIt.registerFactory<DashboardBloc>(() => DashboardBloc(
        getDashboardOtpUsecase: getIt(),
      ));
  getIt.registerFactory<DashboardSMSBloc>(() => DashboardSMSBloc(
        getDashboardSmsUsecase: getIt(),
      ));

  getIt.registerFactory<GetUserDetailsBloc>(() => GetUserDetailsBloc(
        getUserDetailsUsecase: getIt(),
      ));
  getIt.registerFactory<FindByCustomerIdBloc>(() => FindByCustomerIdBloc(
        findByCustomerIdUsecase: getIt(),
      ));
  getIt.registerFactory<WalletBalanceBloc>(() => WalletBalanceBloc(
        walletBalanceUsecase: getIt(),
      ));

  getIt.registerFactory<VerifyAUserBloc>(
    () => VerifyAUserBloc(
        getVerifyAUserUsecase: getIt(),
        getVerifyAUserOtpVerificationUsecase: getIt(),
        getVerifyAUserUpdateBrandNameUsecase: getIt()),
  );
  getIt.registerFactory<VerifyBrandNameBloc>(
    () => VerifyBrandNameBloc(getVerifyAUserUpdateBrandNameUsecase: getIt()),
  );
  getIt.registerFactory<AccountDetailsBloc>(
    () => AccountDetailsBloc(getIt()),
  );
  getIt.registerFactory<UpdatePhoneNoBloc>(
    () => UpdatePhoneNoBloc(getIt()),
  );
  getIt.registerFactory<UpdatePhoneNoGetOtpBloc>(
    () => UpdatePhoneNoGetOtpBloc(getIt()),
  );

  getIt.registerFactory<UpdatePasswordBloc>(
    () => UpdatePasswordBloc(getIt()),
  );
  getIt.registerFactory<PaymnetHistoryCubit>(
    () => PaymnetHistoryCubit(getIt()),
  );
  getIt.registerFactory<LowBalanceCubit>(
    () => LowBalanceCubit(getIt()),
  );
  getIt.registerFactory<LowBalanceAlertSaveCubit>(
    () => LowBalanceAlertSaveCubit(getIt()),
  );
  getIt.registerFactory<OtpAnalyticsCubit>(
    () => OtpAnalyticsCubit(getIt()),
  );
  getIt.registerFactory<SMSAnalyticsCubit>(
    () => SMSAnalyticsCubit(getIt()),
  );
  getIt.registerFactory<CheckOfferEligibilityCubit>(
    () => CheckOfferEligibilityCubit(getIt()),
  );
  getIt.registerFactory<CheckOfferEligibilityUpdateCubit>(
    () => CheckOfferEligibilityUpdateCubit(getIt()),
  );

  getIt.registerFactory<OtpDetailsReportingCubit>(
    () => OtpDetailsReportingCubit(getIt()),
  );
  getIt.registerFactory<OtpSearchDetailsReportingCubit>(
    () => OtpSearchDetailsReportingCubit(getIt()),
  );

  getIt.registerFactory<SmsSearchDetailsReportingCubit>(
    () => SmsSearchDetailsReportingCubit(getIt()),
  );

  getIt.registerFactory<SmsDetailsReportingCubit>(
    () => SmsDetailsReportingCubit(getIt()),
  );

  getIt.registerFactory<SteponeRegistrationSaveBloc>(
    () => SteponeRegistrationSaveBloc(steponeRegistrationSaveUsecase: getIt()),
  );
  getIt.registerFactory<SteponeRegistrationGetDemoBloc>(
    () => SteponeRegistrationGetDemoBloc(steponeRegistrationUsecase: getIt()),
  );
}

class DioModule {
  DioModule._();

  static const String dioInstanceName = 'dioInstance';

  static void setup() {
    _setupDio();
  }

  static void _setupDio() {
    /// Dio
    getIt.registerLazySingleton<Dio>(
      () {
        final Dio dio = Dio(BaseOptions(headers: {
          "Content-Type": "application/json",
          'Access-Control-Allow-Origin': '*',
        }));
        if (!kReleaseMode) {
          dio.interceptors.addAll([
            AwesomeDioInterceptor(
              // Disabling headers and timeout would minimize the logging output.
              // Optional, defaults to true
              logRequestTimeout: false,
              logRequestHeaders: false,
              logResponseHeaders: false,

              // Optional, defaults to the 'log' function in the 'dart:developer' package.
              logger: debugPrint,
            ),
          ]);
        }
        return dio;
      },
      instanceName: dioInstanceName,
    );
  }
}

class DioFactory {
  Map<String, dynamic>? headers = {
    'content-type': 'application/json',
    'Access-Control-Allow-Origin': '*',
  };
  Map<String, dynamic>? headers2 = {
    'content-type': 'application/json',
    'Access-Control-Allow-Origin': '*',
    "authToken": LocalStateCache().authToken
  };

  BaseOptions _createBaseOption() => BaseOptions(
      headers: LocalStateCache().authToken.isNotEmpty ? headers2 : headers,
      receiveTimeout: const Duration(seconds: 120),
      sendTimeout: const Duration(seconds: 120),
      followRedirects: false,
      validateStatus: (status) => true,
      connectTimeout: const Duration(seconds: 60));
  Dio create() => Dio(_createBaseOption())
    ..interceptors.addAll([
      LoggerInterceptor(),
      AwesomeDioInterceptor(
          // Disabling headers and timeout would minimize the logging output.
          // Optional, defaults to true
          logRequestTimeout: true,
          logRequestHeaders: true,
          logResponseHeaders: true,

          // Optional, defaults to the 'log' function in the 'dart:developer' package.
          logger: (v) {
            LocalStateCache().authToken;
            debugPrint(v);
          }),
    ]);
}
 
// class DioClient {
//   late Dio _dio = Dio();
//   UserCacheManagerBloc userCacheManagerBloc;
//   late StreamSubscription tokenCubitSubscription;
 
//   DioClient(this.userCacheManagerBloc) {
//     _dio.options = BaseOptions(
//         receiveTimeout: const Duration(seconds: 60),
//         sendTimeout: const Duration(seconds: 60),
//         connectTimeout: const Duration(seconds: 5));
 
//     //add interceptor and when error is unauthorized - 401 - refresh token and set proper one as a header
//     // _dio.interceptors.add(
//     //   // InterceptorsWrapper(
//     //   //   onError: (e, handler) async {
//     //   //     if (userCacheManagerBloc.state is! UserCacheManagerStateInitial && e.response?.statusCode == 401) {
//     //   //       if (e.response != null) {
//     //   //         // final result =
//     //   //         //     await userCacheManagerBloc.refreshToken(tokenCubit.state.token!);
//     //   //         if (result != null) {
//     //   //           addToken(_dio, userCacheManagerBloc.state);
//     //   //           final opts = Options(method: e.requestOptions.method);
//     //   //           final response = await _dio.request(
//     //   //             e.requestOptions.path,
//     //   //             options: opts,
//     //   //             cancelToken: e.requestOptions.cancelToken,
//     //   //             onReceiveProgress: e.requestOptions.onReceiveProgress,
//     //   //             data: e.requestOptions.data,
//     //   //             queryParameters: e.requestOptions.queryParameters,
//     //   //           );
//     //   //           handler.resolve(response);
//     //   //         }
//     //   //       }
//     //   //     } else {
//     //   //       //a place to handle other errors
//     //   //       handler.reject(e);
//     //   //     }
//     //   //   },
//     //   // ),
 
//     // );
 
//     //at the start of the app, inside constructor checks if user is authorized and if yes - adds the token to the header
//     if (userCacheManagerBloc.state is! UserCacheManagerStateInitial) {
//       addToken(_dio, userCacheManagerBloc.state);
//     }
 
//     //listens to changes of the token cubit and sets token to header when state changes to authorized
//     tokenCubitSubscription = userCacheManagerBloc.stream.listen((event) {
//       if (event is! UserCacheManagerStateInitial) {
//         addToken(_dio, userCacheManagerBloc.state);
//       }
//     });
//   }
//   Dio get dio => _dio;
//   void dispose() {
//     tokenCubitSubscription.cancel();
//   }
 
//   void addToken(Dio dio, UserCacheManagerState state) {
//     Map<String, dynamic> header = {
//       "authToken": state.userCacheManager!.authToken
//     };
//     dio.options.headers.addAll(header);
//   }
// }
 