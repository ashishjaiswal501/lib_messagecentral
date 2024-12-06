import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:messagecentral/config/routes/route.dart';
import 'package:messagecentral/core/global_widgets/navigation_side_bar/navigation_drawer_main_widget_.dart';

import 'package:messagecentral/core/utils/local_state_cache.dart';
import 'package:messagecentral/features/account_details/presentation/screens/account_details_screen.dart';
import 'package:messagecentral/features/contacts/presentation/screens/contact_group_screen.dart';
import 'package:messagecentral/features/contacts/presentation/screens/contact_screen.dart';
import 'package:messagecentral/features/find_by_customer_id/presentation/bloc/find_by_customer_id_bloc.dart';
import 'package:messagecentral/features/find_by_customer_id/presentation/bloc/find_by_customer_id_event.dart';
import 'package:messagecentral/features/forget_password/presentation/screens/bloc/forget_password_bloc.dart';
import 'package:messagecentral/features/forget_password/presentation/screens/bloc/forget_password_otp_bloc.dart';
import 'package:messagecentral/features/forget_password/presentation/screens/forgot_password_screen.dart';
import 'package:messagecentral/features/getuserdeails/presentation/bloc/get_user_details_bloc.dart';
import 'package:messagecentral/features/getuserdeails/presentation/bloc/get_user_details_event.dart';
import 'package:messagecentral/features/home/presentation/bloc/check_offer_eligibility_cubit.dart';
import 'package:messagecentral/features/home/presentation/screens/home_screen.dart';
import 'package:messagecentral/features/login/presentation/screens/login_screen.dart';
import 'package:messagecentral/features/signup/presentation/bloc/resend_otp_bloc.dart';
import 'package:messagecentral/features/signup/presentation/bloc/signup_bloc.dart';
import 'package:messagecentral/features/signup/presentation/bloc/signup_otp_bloc.dart';
import 'package:messagecentral/features/signup/presentation/bloc/signup_otp_verify_bloc.dart';
import 'package:messagecentral/features/signup/presentation/screens/signup_screen.dart';
import 'package:messagecentral/features/sms_message_now/presentation/screens/sms_sender_screen.dart';
import 'package:messagecentral/features/verify_now/analytics/presentation/bloc/otp_analytics_cubit.dart';
import 'package:messagecentral/features/verify_now/analytics/presentation/bloc/otp_details_reporting_cubit.dart';
import 'package:messagecentral/features/verify_now/analytics/presentation/bloc/otp_search_details_reporting_cubit.dart';
import 'package:messagecentral/features/verify_now/analytics/presentation/bloc/sms_analytics_cubit.dart';
import 'package:messagecentral/features/verify_now/analytics/presentation/bloc/sms_details_reporting_cubit.dart';
import 'package:messagecentral/features/verify_now/analytics/presentation/bloc/sms_search_details_reporting_cubit.dart';
import 'package:messagecentral/features/verify_now/analytics/presentation/screens/details_reporting_screen.dart';
import 'package:messagecentral/features/verify_now/analytics/presentation/screens/otp_service_screen.dart';
import 'package:messagecentral/features/verify_now/analytics/presentation/screens/sms_service_screen.dart';
import 'package:messagecentral/features/verify_now/credits/presentation/bloc/low_balalce_cubit.dart';
import 'package:messagecentral/features/verify_now/credits/presentation/bloc/low_balance_alert_save_cubit.dart';
import 'package:messagecentral/features/verify_now/credits/presentation/bloc/payment_history_cubit.dart';
import 'package:messagecentral/features/verify_now/credits/presentation/screens/credits_screen.dart';
import 'package:messagecentral/features/verify_now/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:messagecentral/features/verify_now/dashboard/presentation/bloc/dashboard_event.dart';
import 'package:messagecentral/features/verify_now/dashboard/presentation/bloc/dashboard_sms_bloc.dart';
import 'package:messagecentral/features/verify_now/dashboard/presentation/bloc/dashboard_sms_event.dart';
import 'package:messagecentral/features/verify_now/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/presentation/bloc/send_a_sms_bloc.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/presentation/bloc/stepone_registration_getdemo_bloc.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/presentation/bloc/stepone_registration_save_bloc.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/presentation/screens/send_a_sms_screen.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/presentation/bloc/brand_name_bloc.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/presentation/bloc/verify_a_user_bloc.dart';
import 'package:messagecentral/features/verify_now/developers_docs/presentation/screens/developer_docs.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/presentation/screens/sendsmswhtasapp/send_SMS_Whatsapp_screen.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/presentation/screens/verify_a_user_screen.dart';
import 'package:messagecentral/features/wallet_balance/presentation/bloc/wallet_balance_bloc.dart';
import 'package:messagecentral/features/wallet_balance/presentation/bloc/wallet_balance_event.dart';
import 'package:messagecentral/injection_container.dart';

part "go_router_provider.g.dart";

final key = GlobalKey<NavigatorState>();

const routerInitialLocation = '/';
List<RouteBase> coreRoutes = <RouteBase>[
  GoRoute(
    name: 'payment',
    path: '/dashboard/:paymentStatus',
    builder: (BuildContext context, GoRouterState state) =>
        PaymentSuccessScreen(
      paymentStatus: state.pathParameters['paymentStatus'] ?? "",
      isPaymentSucess: state.pathParameters['paymentStatus'] == 'success'
          ? true
          : state.pathParameters['paymentStatus'] == 'failed'
              ? false
              : null,
    ),
  ),
  GoRoute(
    name: RoutePath.login.name,
    path: RoutePath.login.path,
    builder: (BuildContext context, GoRouterState state) => const LoginScreen(),
  ),
  GoRoute(
      name: RoutePath.forgotpassword.name,
      path: RoutePath.forgotpassword.path,
      builder: (BuildContext context, GoRouterState state) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<ForgetPasswordBloc>(),
              ),
              BlocProvider(
                create: (context) => getIt<ForgetPasswordOtpBloc>(),
              ),
              BlocProvider(
                create: (context) => getIt<ResendOtpBloc>(),
              ),
            ],
            child: const ForgotPasswordScreen(),
          )),
  GoRoute(
      name: RoutePath.signup.name,
      path: RoutePath.signup.path,
      builder: (BuildContext context, GoRouterState state) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<SignupBloc>(),
              ),
              BlocProvider(
                create: (context) => getIt<SignupOtpBloc>(),
              ),
              BlocProvider(
                create: (context) => getIt<SignupOtpVerifyBloc>(),
              ),
              BlocProvider(
                create: (context) => getIt<ResendOtpBloc>(),
              ),
            ],
            child: SignupScreen(
              authToken: LocalStateCache().authToken,
              customerId: LocalStateCache().customerId,
              emailId: state.uri.queryParameters['email'] ?? "",
              isInitialStepSignup: LocalStateCache().isInitialStepSignup,
            ),
          )),
  // GoRoute(
  //   name: RoutePath.home.name,
  //   path: RoutePath.home.path,
  //   builder: (BuildContext context, GoRouterState state) =>
  //       MultiBlocProvider(providers: [
  //     BlocProvider(
  //       create: (_) => getIt<GetUserDetailsBloc>()
  //         ..add(
  //           const GetUserDetailsCall(),
  //         ),
  //     ),
  //     BlocProvider(
  //         create: (_) =>
  //             getIt<CheckOfferEligibilityCubit>()..getCheckOfferEligibility()),
  //     BlocProvider(create: (_) => getIt<CheckOfferEligibilityUpdateCubit>()),
  //   ], child: const HomeScreen()),
  // ),
];

@TypedStatefulShellRoute<ShellRouteData>(
  branches: [
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<HomeRoute>(path: "/", name: "home"),
      ],
    ),
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<DashboardRoute>(path: '/dashboard', name: 'dashboard'),
      ],
    ),

    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<SMSServiceAnalyticsRoute>(
            path: '/analytics-SMS-Service', name: 'analytics-SMS-Service'),
      ],
    ),
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<OTPServiceAnalyticsRoute>(
            path: '/analytics-OTP-Service', name: 'analytics-OTP-Service'),
      ],
    ),
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<ReportsAnalyticsRoute>(path: '/reports', name: 'reports'),
      ],
    ),
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<DeveloperDocsRoute>(
            path: '/developerDocs', name: 'developerDocs'),
      ],
    ),
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<CreditsRoute>(path: '/credits', name: 'credits'),
      ],
    ),
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<SendSMSRoute>(path: '/SendSMS', name: 'SendSMS'),
      ],
    ),
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<VerifiedUserRoute>(
            path: '/VerifyUser', name: 'VerifyUser'),
      ],
    ),
    // you can add message now menu

    // end message now
    // last index
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<AccountDetailsRoute>(
            path: '/accountdetails', name: 'accountdetails'),
      ],
    ),
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<ContactGroupRoute>(
            path: '/Groups',
            name: 'Groups',
            routes: [
              TypedGoRoute<ContactsRoute>(path: 'contact/:id', name: 'contact'),
            ]),
      ],
    ),
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<SMSSenderRoute>(path: '/smssender', name: 'sms'),
      ],
    ),
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<WhatsAPPRoute>(path: '/whatsApp-OTP', name: 'whatsApp'),
      ],
    ),
  ],
)

// pages
class ShellRouteData extends StatefulShellRouteData {
  const ShellRouteData();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return SelectionArea(
        child: MultiBlocProvider(
            providers: [
          BlocProvider(
            create: (context) =>
                getIt<GetUserDetailsBloc>()..add(const GetUserDetailsCall()),
          ),
          BlocProvider(
            create: (context) => getIt<FindByCustomerIdBloc>()
              ..add(const FindByCustomerIdCall()),
          ),
          BlocProvider(
            create: (context) =>
                getIt<WalletBalanceBloc>()..add(const WalletBalanceCall()),
          ),
          BlocProvider(
            create: (context) => getIt<OtpAnalyticsCubit>()
              ..getAnalytics(
                  fromDate: DateFormat("d/M/yyyy").format(DateTime.now()),
                  toDate: DateFormat("d/M/yyyy").format(DateTime.now())),
          ),
          BlocProvider(
            create: (context) => getIt<DashboardBloc>()
              ..add(
                GetDashboardOtpEventCall(
                    customerId: LocalStateCache().customerId,
                    fromDate: DateFormat("d/M/yyyy").format(DateTime.now()),
                    toDate: DateFormat("d/M/yyyy").format(DateTime.now()),
                    authToken: LocalStateCache().authToken),
              ),
          ),
          BlocProvider(
            create: (context) => getIt<DashboardSMSBloc>()
              ..add(
                GetDashboardSmsEventCall(
                    customerId: LocalStateCache().customerId,
                    fromDate: DateFormat("d/M/yyyy").format(DateTime.now()),
                    toDate: DateFormat("d/M/yyyy").format(DateTime.now()),
                    authToken: LocalStateCache().authToken),
              ),
          ),
          BlocProvider(
            create: (context) => getIt<SMSAnalyticsCubit>()
              ..getAnalytics(
                  fromDate: DateFormat("d/M/yyyy").format(DateTime.now()),
                  toDate: DateFormat("d/M/yyyy").format(DateTime.now())),
          ),
          BlocProvider(
              create: (context) => getIt<PaymnetHistoryCubit>()
                ..getPaymentHistory(
                    fromDate: (DateFormat('dd/MM/yyyy').format(DateTime.now())),
                    toDate: (DateFormat('dd/MM/yyyy').format(DateTime.now())))),

          // reports
          BlocProvider(
              create: (context) => getIt<SmsDetailsReportingCubit>()
                ..getDetailsReporting(
                    from: DateFormat("d/M/yyyy").format(DateTime.now()),
                    to: DateFormat("d/M/yyyy").format(DateTime.now()),
                    pageNo: '0',
                    size: '10')),
          BlocProvider(
              create: (context) => getIt<SmsSearchDetailsReportingCubit>()),
          BlocProvider(
              create: (context) => getIt<OtpDetailsReportingCubit>()
                ..getDetailsReporting(
                    from: DateFormat("d/M/yyyy").format(DateTime.now()),
                    to: DateFormat("d/M/yyyy").format(DateTime.now()),
                    pageNo: '0',
                    size: '10')),
          BlocProvider(
              create: (context) => getIt<OtpSearchDetailsReportingCubit>()),
          BlocProvider(
              create: (context) => getIt<SteponeRegistrationGetDemoBloc>()),
          BlocProvider(
              create: (context) => getIt<SteponeRegistrationSaveBloc>()),
          BlocProvider(
            create: (_) => getIt<GetUserDetailsBloc>()
              ..add(
                const GetUserDetailsCall(),
              ),
          ),
          BlocProvider(
              create: (_) => getIt<CheckOfferEligibilityCubit>()
                ..getCheckOfferEligibility()),
          BlocProvider(
              create: (_) => getIt<CheckOfferEligibilityUpdateCubit>()),
          BlocProvider(create: (context) => getIt<VerifyBrandNameBloc>()),
        ],
            child: NavigationDrawerMainWidget(
              key: state.pageKey,
              statefulNavigationShell: navigationShell,
            )));
  }
}

class HomeRoute extends GoRouteData {
  HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomeScreen();
  }
}

class DashboardRoute extends GoRouteData {
  const DashboardRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DashboardScreen();
  }
}

class SMSServiceAnalyticsRoute extends GoRouteData {
  const SMSServiceAnalyticsRoute();
//analytics-SMS-Service
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SMSServiceScreen();
  }
}

class OTPServiceAnalyticsRoute extends GoRouteData {
  const OTPServiceAnalyticsRoute();
//analytics-OTP-Service
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const OtpServiceScreen();
  }
}

class ReportsAnalyticsRoute extends GoRouteData {
  const ReportsAnalyticsRoute();
//analytics-OTP-Service
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DetailsReportingScreen();
  }
}

class DeveloperDocsRoute extends GoRouteData {
  const DeveloperDocsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DeveloperDocsScreen();
  }
}

class CreditsRoute extends GoRouteData {
  const CreditsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<LowBalanceCubit>()),
        BlocProvider(create: (context) => getIt<LowBalanceAlertSaveCubit>()),
      ],
      child: const CreditsScreen(),
    );
  }
}

class SendSMSRoute extends GoRouteData {
  const SendSMSRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) => getIt<SendASmsBloc>(),
      child: const SendASmsScreen(),
    );
  }
}

class VerifiedUserRoute extends GoRouteData {
  const VerifiedUserRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) => getIt<VerifyAUserBloc>(),
      child: const VerifyAUserScreen(),
    );
  }
}

class WhatsAPPRoute extends GoRouteData {
  const WhatsAPPRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) => getIt<VerifyAUserBloc>(),
      child: const SendSMSWhatsAppScreen(),
    );
  }
}

class AccountDetailsRoute extends GoRouteData {
  const AccountDetailsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AccountDetailsScreen();
  }
}

class ContactGroupRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ContactGroupScreen();
  }
}

class ContactsRoute extends GoRouteData {
  const ContactsRoute({this.id = ''});
  final String id;
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ContactsScreen(
      groupName: id,
    );
  }
}

class SMSSenderRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SMSSenderScreen();
  }
}
