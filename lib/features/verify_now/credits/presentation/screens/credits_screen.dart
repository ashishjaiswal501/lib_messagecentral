import 'package:aligned_dialog/aligned_dialog.dart';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:messagecentral/core/constants/app_colors.dart';
import 'package:messagecentral/core/global_widgets/custom_button.dart';
import 'package:messagecentral/core/utils/extention_util.dart';
import 'package:messagecentral/core/utils/firebase_analytics_functions.dart';
import 'package:messagecentral/core/utils/flutter_flow_theme.dart';
import 'package:messagecentral/core/utils/local_state_cache.dart';
import 'package:messagecentral/core/utils/mix_pannel.dart';
import 'package:messagecentral/features/add_credits/presentation/screens/add_credits_screen.dart';
import 'package:messagecentral/features/getuserdeails/presentation/bloc/get_user_details_bloc.dart';
import 'package:messagecentral/features/getuserdeails/presentation/bloc/get_user_details_event.dart';
import 'package:messagecentral/features/getuserdeails/presentation/bloc/get_user_details_state.dart';
import 'package:messagecentral/features/verify_now/credits/presentation/screens/widgets/low_balance_alert_widget.dart';
import 'package:messagecentral/features/verify_now/credits/presentation/screens/widgets/payment_history_widget.dart';

class PaymentSuccessScreen extends StatefulWidget {
  final bool? isPaymentSucess;
  final String paymentStatus;
  const PaymentSuccessScreen(
      {super.key, this.isPaymentSucess, this.paymentStatus = ''});

  @override
  State<PaymentSuccessScreen> createState() => _PaymentSuccessScreenState();
}

class _PaymentSuccessScreenState extends State<PaymentSuccessScreen> {
  @override
  void initState() {
    super.initState();
    MixPanelAnalyticsManager()
        .sendEvent('Credits_landing', 'Credits landing', null);
    setScreenFirebase('Credits_landing', 'Credits landing');
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.isPaymentSucess != null) {
        LocalStateCache().setpaymentStatus = widget.paymentStatus;
        Future.delayed(const Duration(seconds: 1), () {
          GoRouter.of(context).goNamed('credits');
          if (widget.isPaymentSucess == true) {
            MixPanelAnalyticsManager().sendEvent('credits_payment_successful',
                'Topup done and payment successful', null);
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Center();
  }
}

class CreditsScreen extends StatefulWidget {
  const CreditsScreen({
    super.key,
  });

  @override
  State<CreditsScreen> createState() => _CreditsScreenState();
}

class _CreditsScreenState extends State<CreditsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    MixPanelAnalyticsManager()
        .sendEvent('Credits_landing', 'Credits landing', null);
    setScreenFirebase('Credits_landing', 'Credits landing');
    _tabController = TabController(length: 2, vsync: this);
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (LocalStateCache().paymentStatus == 'success' &&
          LocalStateCache().paymentStatus.isNotEmpty) {
        await showAlignedDialog(
          barrierDismissible: false,
          context: context,
          isGlobal: true,
          avoidOverflow: false,
          targetAnchor: const AlignmentDirectional(0.0, 0.0)
              .resolve(Directionality.of(context)),
          followerAnchor: const AlignmentDirectional(0.0, 0.0)
              .resolve(Directionality.of(context)),
          builder: (dialogContext) {
            return Material(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                    15.0, 15.0, 15.0, 15.0),
                child: Container(
                  width: 400.0,
                  height: 218.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        20.0, 20.0, 20.0, 20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 10.0),
                            child: Text(
                              'Congrats! Your payment is successful. Credits will be added shortly.',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(1.00, 0.00),
                          child: FFButtonWidget(
                            onPressed: () async {
                              LocalStateCache().setpaymentStatus = '';
                              context
                                  .read<GetUserDetailsBloc>()
                                  .add(const GetUserDetailsCall());
                              Navigator.pop(dialogContext);
                              // GoRouter.of(context).goNamed('/');
                            },
                            text: "OK",
                            options: FFButtonOptions(
                              height: 48.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  30.0, 0.0, 30.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: const Color(0xFF2861B4),
                              textStyle: GoogleFonts.getFont(
                                'Plus Jakarta Sans',
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 17.0,
                              ),
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 0.0,
                              ),
                              borderRadius: BorderRadius.circular(4.0),
                              hoverElevation: 5.0,
                            ),
                            showLoadingIndicator: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // child: PaymemtStatusDialogUIWidget(
              //   message:
              //       'Congrats! Your payment is successful.  Credits will be added shortly.',
              //   buttonOk: 'OK',
              // ),
            );
          },
        ).then((value) => setState(() {}));

        setState(() {});
      } else if (LocalStateCache().paymentStatus == 'failed' &&
          LocalStateCache().paymentStatus.isNotEmpty) {
        await showAlignedDialog(
          barrierDismissible: false,
          context: context,
          isGlobal: true,
          avoidOverflow: false,
          targetAnchor: const AlignmentDirectional(0.0, 0.0)
              .resolve(Directionality.of(context)),
          followerAnchor: const AlignmentDirectional(0.0, 0.0)
              .resolve(Directionality.of(context)),
          builder: (dialogContext) {
            return Material(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                    15.0, 15.0, 15.0, 15.0),
                child: Container(
                  width: 400.0,
                  height: 218.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        20.0, 20.0, 20.0, 20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 10.0),
                            child: Text(
                              'Your payment is failed. Please try again.',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(1.00, 0.00),
                          child: FFButtonWidget(
                            onPressed: () async {
                              LocalStateCache().setpaymentStatus = '';
                              Navigator.pop(dialogContext);
                            },
                            text: "OK",
                            options: FFButtonOptions(
                              height: 48.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  30.0, 0.0, 30.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: const Color(0xFF2861B4),
                              textStyle: GoogleFonts.getFont(
                                'Plus Jakarta Sans',
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 17.0,
                              ),
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 0.0,
                              ),
                              borderRadius: BorderRadius.circular(4.0),
                              hoverElevation: 5.0,
                            ),
                            showLoadingIndicator: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // child: PaymemtStatusDialogUIWidget(
              //   message:
              //       'Congrats! Your payment is successful.  Credits will be added shortly.',
              //   buttonOk: 'OK',
              // ),
            );

            // return Material(
            //   color: Colors.transparent,
            //   child: PaymemtStatusDialogUIWidget(
            //     message:
            //         'Oops! Your payment is either cancelled or expired. Please try again.',
            //     buttonOk: 'OK',
            //   ),
            // );
          },
        ).then((value) => setState(() {}));
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.2,
          backgroundColor: Colors.white,
          flexibleSpace: Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.primaryBackground,
                borderRadius: BorderRadius.circular(0.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        20.0, 20.0, 25.0, 20.0),
                    child: Text(
                      "Credits",
                      style: GoogleFonts.getFont(
                        'Plus Jakarta Sans',
                        color: AppColors.primaryTextColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 25.0, 0.0),
                    child: Text(
                      'Your available credit balance is',
                      style: TextStyle(
                        color: AppColors.primaryText,
                        fontWeight: FontWeight.normal,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        25.0, 20.0, 25.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        BlocBuilder<GetUserDetailsBloc, GetUserDetailsState>(
                            builder: (context, state) {
                          return Text(
                            currencyFormatFiveDecimal(state.getUserDetailsEntity
                                        ?.data?.wallet?.credits ??
                                    0.0)
                                .toString(),
                            style: const TextStyle(
                              color: AppColors.primaryText,
                              fontWeight: FontWeight.bold,
                              fontSize: 27.0,
                            ),
                          );
                        }),

                        // Text(
                        //   currencyFormatFiveDecimal(
                        //           double.parse(LocalStateCache().balance))
                        //       .toString(),
                        //   style: const TextStyle(
                        //     color: AppColors.primaryText,
                        //     fontWeight: FontWeight.bold,
                        //     fontSize: 27.0,
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              25.0, 0.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              MixPanelAnalyticsManager().sendEvent(
                                  'Credits_Top_up', 'Credits Top up', null);
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: const AddCreditWidget(),
                                  );
                                },
                              );
                            },
                            text: 'Top Up Credits',
                            options: FFButtonOptions(
                              height: 42,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: const Color(0xFF2861B4),
                              textStyle: const TextStyle(
                                color: AppColors.whiteTextColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14.0,
                              ),
                              elevation: 0.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 0.0,
                              ),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            showLoadingIndicator: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          toolbarHeight: 170,
          centerTitle: false,
          shadowColor: Colors.transparent,
          // title: Text(
          //   "Credits",
          //   style: GoogleFonts.getFont(
          //     'Plus Jakarta Sans',
          //     color: AppColors.primaryTextColor,
          //     fontWeight: FontWeight.w600,
          //     fontSize: 25.0,
          //   ),
          // ),
          bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 50),
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: TabBar(
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    controller: _tabController,
                    indicator: const UnderlineTabIndicator(
                        borderSide: BorderSide(
                      width: 3,
                      color: Color(0xFF2861B4),
                    )),
                    padding: EdgeInsets.zero,
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: Colors.black,
                    dividerColor: AppColors.black50,
                    tabs: const [
                      Tab(
                        text: "Payment History",
                      ),
                      Tab(
                        text: "Low Balance alert",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [PaymentHistoryWidget(), LowBalanceAlertWidget()]));
  }
}
