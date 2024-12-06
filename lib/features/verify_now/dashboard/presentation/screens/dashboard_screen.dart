import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:messagecentral/core/utils/custom_icon.dart';
import 'package:messagecentral/core/utils/firebase_analytics_functions.dart';
import 'package:messagecentral/core/utils/flutter_flow_theme.dart';
import 'package:messagecentral/core/utils/mix_pannel.dart';
import 'package:messagecentral/features/verify_now/dashboard/domain/entity/dashboard_otp_entity.dart';
import 'package:messagecentral/features/verify_now/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:messagecentral/features/verify_now/dashboard/presentation/bloc/dashboard_sms_bloc.dart';
import 'package:messagecentral/features/verify_now/dashboard/presentation/bloc/dashboard_sms_state.dart';
import 'package:messagecentral/features/verify_now/dashboard/presentation/bloc/dashboard_state.dart';

import 'package:messagecentral/features/verify_now/dashboard/presentation/screens/widgets/sms_api_dashboard_widget.dart';
import 'package:messagecentral/features/verify_now/dashboard/presentation/screens/widgets/otp_api_dashboard_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MixPanelAnalyticsManager()
        .sendEvent('Dashboard_landing', 'Dashboard landing', null);
    setScreenFirebase('Dashboard_landing', 'Dashboard landing');
    UserData? dashboardDataOtp;
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        if (state is DashboardOtpStateSuccess &&
            state.dashboardOtpEntity!.data != null) {
          dashboardDataOtp = state.dashboardOtpEntity!.data!;
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 12,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 1.0,
                decoration: BoxDecoration(
                  color: const Color(0xFFEBDEFF),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        FFIcons.kbulb,
                        color: Color(0xFF8039F1),
                        size: 24.0,
                      ),
                      const Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(-1.00, 0.00),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Getting Started with Verify Now API',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: Color(0xFF4500B2),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0,
                                  ),
                                ),
                                Text(
                                  'Two-factor authentication made simple through an API.',
                                  style: TextStyle(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: Color(0xFF4500B2),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          GoRouter.of(context).goNamed('VerifyUser');
                          MixPanelAnalyticsManager().sendEvent(
                              "Dashboard_try_now",
                              "Dashboard try now CTA",
                              null);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: const Color(0xFF2861B4),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: const Text(
                            'Try Now',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: Text(
                  'OTP API',
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    color: FlutterFlowTheme.of(context).primaryTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                  ),
                ),
              ),
              BlocBuilder<DashboardBloc, DashboardState>(
                  builder: (context, state) {
                if (state is DashboardOtpStateSuccess &&
                    state.dashboardOtpEntity!.data != null) {
                  dashboardDataOtp = state.dashboardOtpEntity!.data!;
                }
                return OtpApiDashboardWidget(
                    dashboardDataOtp: dashboardDataOtp);
              }),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: Text(
                  'SMS API',
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    color: FlutterFlowTheme.of(context).primaryTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                  ),
                ),
              ),
              BlocBuilder<DashboardSMSBloc, DashboardSMSState>(
                  builder: (context, state) {
                if (state is DashboardSMSStateSuccess &&
                    state.dashboardSmsEntity!.data != null) {
                  return SmsApiDashboardWidget(
                      dashboardDataSms: state.dashboardSmsEntity!.data!);
                } else {
                  return const SmsApiDashboardWidget(dashboardDataSms: null);
                }
              }),
            ],
          ),
        );
      },
    );
  }
}
