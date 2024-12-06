// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:messagecentral/core/constants/app_colors.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/presentation/bloc/brand_name_bloc.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/presentation/bloc/brand_name_event.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/presentation/bloc/brand_name_state.dart';
import 'package:super_tooltip/super_tooltip.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:messagecentral/core/constants/image_path.dart';
import 'package:messagecentral/core/utils/extention_util.dart';
import 'package:messagecentral/core/utils/flutter_flow_theme.dart';
import 'package:messagecentral/core/utils/local_state_cache.dart';
import 'package:messagecentral/core/utils/mix_pannel.dart';
import 'package:messagecentral/core/utils/responsive.dart';
import 'package:messagecentral/core/utils/validator.dart';
import 'package:messagecentral/features/add_credits/presentation/screens/add_credits_screen.dart';
import 'package:messagecentral/features/find_by_customer_id/presentation/bloc/find_by_customer_id_bloc.dart';
import 'package:messagecentral/features/find_by_customer_id/presentation/bloc/find_by_customer_id_event.dart';
import 'package:messagecentral/features/find_by_customer_id/presentation/bloc/find_by_customer_id_state.dart';
import 'package:messagecentral/features/getuserdeails/presentation/bloc/get_user_details_bloc.dart';
import 'package:messagecentral/features/getuserdeails/presentation/bloc/get_user_details_event.dart';
import 'package:messagecentral/features/verify_now/analytics/presentation/bloc/otp_analytics_cubit.dart';
import 'package:messagecentral/features/verify_now/analytics/presentation/bloc/otp_details_reporting_cubit.dart';
import 'package:messagecentral/features/verify_now/credits/presentation/bloc/payment_history_cubit.dart';
import 'package:messagecentral/features/verify_now/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:messagecentral/features/verify_now/dashboard/presentation/bloc/dashboard_event.dart';

import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/presentation/bloc/verify_a_user_bloc.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/presentation/bloc/verify_a_user_event.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/presentation/bloc/verify_a_user_state.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/presentation/screens/widgets/steper.dart';
import 'package:messagecentral/features/wallet_balance/presentation/bloc/wallet_balance_bloc.dart';
import 'package:messagecentral/features/wallet_balance/presentation/bloc/wallet_balance_state.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:messagecentral/core/utils/app_environment.dart';

class TryWithUITabVerify extends StatefulWidget {
  const TryWithUITabVerify({super.key});

  @override
  State<TryWithUITabVerify> createState() => _TryWithUITabVerifyState();
}

class _TryWithUITabVerifyState extends State<TryWithUITabVerify>
    with Validator {
  final TextEditingController _recipientNoController = TextEditingController();
  final TextEditingController _brandNameController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  TextEditingController _validateDurationController = TextEditingController();
  final _controller = SuperTooltipController();
  bool optSent = true;
  bool optEntered = false;
  bool verificationStatus = false;
  bool isBrandNameEnable = true;

  bool isTimersendsmsVisible = false;
  bool isTimersendsmsviaWhatsAppVisible = false;
  final CountdownController _controllerotpWhatsapp =
      CountdownController(autoStart: true);

  final CountdownController _controllerotpSMS =
      CountdownController(autoStart: true);
  String timerValue = StopWatchTimer.getDisplayTime(
    60000,
    hours: false,
    milliSecond: false,
  );
  StopWatchTimer timerController =
      StopWatchTimer(mode: StopWatchMode.countDown);
  int timerMilliseconds = 60000;

  String timerValue2 = StopWatchTimer.getDisplayTime(
    60000,
    hours: false,
    milliSecond: false,
  );
  StopWatchTimer timerController2 =
      StopWatchTimer(mode: StopWatchMode.countDown);
  int timerMilliseconds2 = 60000;
  int currentStep = 1;
  final _formKey = GlobalKey<FormState>();
  bool isbrandNameEnabled = true;
  String brandname = '';
  int duration = 0;
  @override
  void initState() {
    super.initState();

    getotpTimer();
    MixPanelAnalyticsManager()
        .sendEvent('verify_user_try_with_ui', 'verify user try with ui', null);
  }

  Future<void> otpTImer(String duration, context) async {
    try {
      var response = await Dio().put(
          "${FlavorConfig.instance!.values!.baseUrl}user/v2/user/updateUserOtpTimeout?customerId=${LocalStateCache().customerId}&timeout=$duration",
          options: Options(
            headers: {"authToken": LocalStateCache().authToken},
            validateStatus: (status) => true,
          ));
      if (response.data['responseCode'] == 400) {
        print(response.data['message']);
        showOverlaySnackbar(context, response.data['message'],
            Icons.info_outline_rounded, Colors.redAccent);
      } else {
        showOverlaySnackbar(context, "Validity time is updated successfully.",
            Icons.check_circle_outline_outlined, Colors.green);
        await getotpTimer();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getotpTimer() async {
    try {
      var response = await Dio().get(
          '${FlavorConfig.instance!.values!.baseUrl}user/v2/user/getUserOtpTimeout',
          options: Options(
            headers: {"authToken": LocalStateCache().authToken},
            validateStatus: (status) => true,
          ));
      if (response.data['responseCode'] == 200) {
        print(response.data);
        setState(() {
          String durationData =
              (response.data['data']['otpTimeoutSeconds']).toString();
          duration = (response.data['data']['otpTimeoutSeconds']);

          _validateDurationController = TextEditingController.fromValue(
              TextEditingValue(text: durationData));
        });
      } else {
        print(response.data['message']);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<FindByCustomerIdBloc>().add(const FindByCustomerIdCall());
  }

  @override
  Widget build(BuildContext context) {
    print("rebuild");
    print(LocalStateCache().routeIndex.toString());
    return BlocConsumer<FindByCustomerIdBloc, FindByCustomerIdState>(
      builder: (context, findbyCustomerSate) {
        return Row(
          children: [
            Expanded(
              flex: 2,
              child: ListView(
                //crossAxisAlignment: CrossAxisAlignment.start,
                padding: const EdgeInsetsDirectional.fromSTEB(
                    55.0, 20.0, 55.0, 20.0),
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 20, top: 10),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 552,
                          child: FlutterHorizontalStepper(
                            steps: const [
                              "Send OTP",
                              "Enter OTP",
                              "Verification Status",
                            ],
                            titleStyle: const TextStyle(
                              color: Color(0xFF2861B4),
                              fontSize: 13.5,
                            ),
                            radius: 40,
                            currentStep: currentStep,
                            child: const [
                              Text("1"),
                              Text("2"),
                              Text("3"),
                            ],
                          ),
                        ),
                        BlocListener<VerifyAUserBloc, VerifyAUserState>(
                          listener: (context, state) {
                            if (state is VerifyAUserStateSuccess &&
                                state.verifyAUserEntity?.responseCode == 508) {
                              isTimersendsmsVisible = false;
                              showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: const AddCreditWidget(
                                        headerTitle: "Insufficient Balance!",
                                        insufficentBalanceContent:
                                            "You don’t have enough balance to send SMS. Please top up to continue."),
                                  );
                                },
                              );
                            } else if (state.verifyAUserOtpVerificationEntity!
                                    .responseCode ==
                                702) {
                              showOverlaySnackbar(context, "Incorrect OTP.",
                                  Icons.info_outline_rounded, Colors.red);

                              return;
                            }
                          },
                          child: Column(
                            children: [
                              // if (!Responsive.isMobile(context))
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Visibility(
                                  //   visible: currentStep == 1,
                                  //   maintainState: true,
                                  //   child: Container(
                                  //     margin: const EdgeInsets.symmetric(
                                  //         horizontal: 0),
                                  //     padding: const EdgeInsets.all(20),
                                  //     width: 552,
                                  //     decoration: BoxDecoration(
                                  //         color: Colors.white,
                                  //         border: Border.all(
                                  //             color: const Color(0xFFDFE2E6)),
                                  //         boxShadow: const [
                                  //           BoxShadow(
                                  //             color: Color(0x0D000000),
                                  //           ),
                                  //           BoxShadow(
                                  //             color: Color(0x0D000000),
                                  //           )
                                  //         ],
                                  //         borderRadius:
                                  //             BorderRadius.circular(8)),
                                  //     child: Column(
                                  //       mainAxisAlignment:
                                  //           MainAxisAlignment.start,
                                  //       crossAxisAlignment:
                                  //           CrossAxisAlignment.start,
                                  //       children: [
                                  //         Column(
                                  //           mainAxisAlignment:
                                  //               MainAxisAlignment.start,
                                  //           crossAxisAlignment:
                                  //               CrossAxisAlignment.start,
                                  //           children: [
                                  //             const SizedBox(
                                  //               height: 10,
                                  //             ),
                                  //             const Text(
                                  //               "Configure OTP settings according to your brand need",
                                  //               style: TextStyle(
                                  //                   color: Color(0xFF243757),
                                  //                   fontWeight:
                                  //                       FontWeight.w600),
                                  //             ),

                                  //             const SizedBox(
                                  //               height: 15,
                                  //             ),
                                  //             Row(
                                  //               crossAxisAlignment:
                                  //                   CrossAxisAlignment.start,
                                  //               children: <Widget>[
                                  //                 Expanded(
                                  //                   flex: !Responsive.isMobile(
                                  //                           context)
                                  //                       ? 2
                                  //                       : 1,
                                  //                   child: Column(
                                  //                     crossAxisAlignment:
                                  //                         CrossAxisAlignment
                                  //                             .start,
                                  //                     children: [
                                  //                       Text(
                                  //                         'Brand Name',
                                  //                         style: Theme.of(
                                  //                                 context)
                                  //                             .textTheme
                                  //                             .bodyMedium!
                                  //                             .copyWith(
                                  //                                 color: const Color(
                                  //                                     0xFF243757),
                                  //                                 fontSize:
                                  //                                     14.0,
                                  //                                 fontWeight:
                                  //                                     FontWeight
                                  //                                         .w400),
                                  //                       ),
                                  //                       ScreenUtil()
                                  //                           .setVerticalSpacing(
                                  //                               4),
                                  //                       BlocListener<
                                  //                           VerifyBrandNameBloc,
                                  //                           VerifyBrandNameState>(
                                  //                         listener:
                                  //                             (context, state) {
                                  //                           if (state
                                  //                               is VerifyAUserUpdateBrandNameStateSuccess) {
                                  //                             showOverlaySnackbar(
                                  //                                 context,
                                  //                                 "Brand name is updated successfully.",
                                  //                                 Icons
                                  //                                     .check_circle_outline_outlined,
                                  //                                 Colors.green);
                                  //                             context
                                  //                                 .read<
                                  //                                     FindByCustomerIdBloc>()
                                  //                                 .add(
                                  //                                     const FindByCustomerIdCall());
                                  //                           }
                                  //                         },
                                  //                         child: BlocConsumer<
                                  //                             WalletBalanceBloc,
                                  //                             WalletBalanceState>(
                                  //                           builder: (context,
                                  //                               walletState_) {
                                  //                             if (walletState_
                                  //                                 is WalletBalanceStateSuccess) {
                                  //                               if (walletState_
                                  //                                   .walletBalanceEntity!
                                  //                                   .data!
                                  //                                   .userPaid!) {}
                                  //                             }
                                  //                             return SuperTooltip(
                                  //                               touchThroughAreaCornerRadius:
                                  //                                   0,
                                  //                               barrierColor: Colors
                                  //                                   .transparent,
                                  //                               hasShadow:
                                  //                                   false,
                                  //                               borderColor: Colors
                                  //                                   .transparent,
                                  //                               backgroundColor:
                                  //                                   const Color
                                  //                                       .fromARGB(
                                  //                                       255,
                                  //                                       6,
                                  //                                       21,
                                  //                                       43),
                                  //                               borderRadius: 4,
                                  //                               arrowBaseWidth:
                                  //                                   16,
                                  //                               arrowLength: 12,
                                  //                               popupDirection:
                                  //                                   TooltipDirection
                                  //                                       .right,
                                  //                               controller:
                                  //                                   _controller,
                                  //                               content:
                                  //                                   const Text(
                                  //                                 "Top up credits to enable brand name edit.",
                                  //                                 softWrap:
                                  //                                     true,
                                  //                                 style: TextStyle(
                                  //                                     color: Colors
                                  //                                         .white,
                                  //                                     fontSize:
                                  //                                         13,
                                  //                                     fontWeight:
                                  //                                         FontWeight
                                  //                                             .w400),
                                  //                               ),
                                  //                               child:
                                  //                                   TextFormField(
                                  //                                 onTapOutside:
                                  //                                     (event) {
                                  //                                   FocusManager
                                  //                                       .instance
                                  //                                       .primaryFocus
                                  //                                       ?.unfocus();
                                  //                                   context
                                  //                                       .read<
                                  //                                           VerifyBrandNameBloc>()
                                  //                                       .add(
                                  //                                         GetVerifyAUserUpdateBrandNamePressedButton(
                                  //                                           customerId:
                                  //                                               LocalStateCache().customerId,
                                  //                                           brandName:
                                  //                                               _brandNameController.text,
                                  //                                           authToken:
                                  //                                               LocalStateCache().authToken,
                                  //                                         ),
                                  //                                       );
                                  //                                 },
                                  //                                 onTap:
                                  //                                     () async {
                                  //                                   if (walletState_.walletBalanceEntity !=
                                  //                                           null &&
                                  //                                       !walletState_
                                  //                                           .walletBalanceEntity!
                                  //                                           .data!
                                  //                                           .userPaid!) {
                                  //                                     await _controller
                                  //                                         .showTooltip();
                                  //                                   } else {
                                  //                                     await _controller
                                  //                                         .hideTooltip();
                                  //                                     MixPanelAnalyticsManager().sendEvent(
                                  //                                         'Getting_started_edit',
                                  //                                         'Getting Started edit',
                                  //                                         null);
                                  //                                   }
                                  //                                 },
                                  //                                 autovalidateMode:
                                  //                                     AutovalidateMode
                                  //                                         .onUserInteraction,
                                  //                                 controller:
                                  //                                     _brandNameController,
                                  //                                 enabled: walletState_
                                  //                                         .walletBalanceEntity
                                  //                                         ?.data
                                  //                                         ?.userPaid ??
                                  //                                     false,
                                  //                                 decoration:
                                  //                                     InputDecoration(
                                  //                                   enabledBorder:
                                  //                                       OutlineInputBorder(
                                  //                                     borderSide:
                                  //                                         const BorderSide(
                                  //                                       color: Color(
                                  //                                           0xFFB3B9C4),
                                  //                                       width:
                                  //                                           1.0,
                                  //                                     ),
                                  //                                     borderRadius:
                                  //                                         BorderRadius.circular(
                                  //                                             4.0),
                                  //                                   ),
                                  //                                   disabledBorder:
                                  //                                       OutlineInputBorder(
                                  //                                     borderSide:
                                  //                                         const BorderSide(
                                  //                                       color: Color(
                                  //                                           0xFFB3B9C4),
                                  //                                       width:
                                  //                                           1.0,
                                  //                                     ),
                                  //                                     borderRadius:
                                  //                                         BorderRadius.circular(
                                  //                                             4.0),
                                  //                                   ),
                                  //                                   focusedBorder:
                                  //                                       OutlineInputBorder(
                                  //                                     borderSide:
                                  //                                         const BorderSide(
                                  //                                       color: Color(
                                  //                                           0xFFB3B9C4),
                                  //                                       width:
                                  //                                           1.0,
                                  //                                     ),
                                  //                                     borderRadius:
                                  //                                         BorderRadius.circular(
                                  //                                             4.0),
                                  //                                   ),
                                  //                                   errorBorder:
                                  //                                       OutlineInputBorder(
                                  //                                     borderSide:
                                  //                                         const BorderSide(
                                  //                                       color: Color(
                                  //                                           0xFFB3B9C4),
                                  //                                       width:
                                  //                                           1.0,
                                  //                                     ),
                                  //                                     borderRadius:
                                  //                                         BorderRadius.circular(
                                  //                                             4.0),
                                  //                                   ),
                                  //                                   focusedErrorBorder:
                                  //                                       OutlineInputBorder(
                                  //                                     borderSide:
                                  //                                         const BorderSide(
                                  //                                       color: Color(
                                  //                                           0xFFB3B9C4),
                                  //                                       width:
                                  //                                           1.0,
                                  //                                     ),
                                  //                                     borderRadius:
                                  //                                         BorderRadius.circular(
                                  //                                             4.0),
                                  //                                   ),
                                  //                                 ),
                                  //                                 obscureText:
                                  //                                     false,
                                  //                                 maxLength: 20,
                                  //                                 inputFormatters: [
                                  //                                   LengthLimitingTextInputFormatter(
                                  //                                       20)
                                  //                                 ],
                                  //                                 textInputAction:
                                  //                                     TextInputAction
                                  //                                         .next,
                                  //                                 textAlign:
                                  //                                     TextAlign
                                  //                                         .left,
                                  //                                 style: const TextStyle(
                                  //                                     color: Color(
                                  //                                         0xFF243757),
                                  //                                     fontSize:
                                  //                                         14),
                                  //                                 keyboardType:
                                  //                                     TextInputType
                                  //                                         .text,
                                  //                                 onFieldSubmitted:
                                  //                                     (value) {
                                  //                                   _brandNameController
                                  //                                           .text =
                                  //                                       value;
                                  //                                 },
                                  //                                 onEditingComplete:
                                  //                                     () {
                                  //                                   context
                                  //                                       .read<
                                  //                                           VerifyBrandNameBloc>()
                                  //                                       .add(
                                  //                                         GetVerifyAUserUpdateBrandNamePressedButton(
                                  //                                           customerId:
                                  //                                               LocalStateCache().customerId,
                                  //                                           brandName:
                                  //                                               _brandNameController.text,
                                  //                                           authToken:
                                  //                                               LocalStateCache().authToken,
                                  //                                         ),
                                  //                                       );
                                  //                                 },
                                  //                                 validator:
                                  //                                     (value) {
                                  //                                   if (value!
                                  //                                           .length >
                                  //                                       20) {
                                  //                                     return 'Please enter 20 character only';
                                  //                                   } else {
                                  //                                     return null;
                                  //                                   }
                                  //                                 },
                                  //                               ),
                                  //                             );
                                  //                           },
                                  //                           listener: (BuildContext
                                  //                                   context,
                                  //                               WalletBalanceState
                                  //                                   state) {
                                  //                             if (state
                                  //                                 is WalletBalanceStateSuccess) {
                                  //                               if (state.walletBalanceEntity !=
                                  //                                       null &&
                                  //                                   state
                                  //                                       .walletBalanceEntity!
                                  //                                       .data!
                                  //                                       .userPaid!) {
                                  //                                 setState(() {
                                  //                                   isBrandNameEnable =
                                  //                                       false;
                                  //                                 });
                                  //                               } else {
                                  //                                 setState(() {
                                  //                                   isBrandNameEnable =
                                  //                                       true;
                                  //                                 });
                                  //                               }
                                  //                             }
                                  //                           },
                                  //                         ),
                                  //                       ),
                                  //                     ],
                                  //                   ),
                                  //                 ),
                                  //                 const SizedBox(width: 10.0),
                                  //                 Expanded(
                                  //                   flex: 1,
                                  //                   child: Column(
                                  //                     crossAxisAlignment:
                                  //                         CrossAxisAlignment
                                  //                             .start,
                                  //                     children: [
                                  //                       Text(
                                  //                         'Validity time',
                                  //                         style: Theme.of(
                                  //                                 context)
                                  //                             .textTheme
                                  //                             .bodyMedium!
                                  //                             .copyWith(
                                  //                                 color: const Color(
                                  //                                     0xFF243757),
                                  //                                 fontSize:
                                  //                                     14.0,
                                  //                                 fontWeight:
                                  //                                     FontWeight
                                  //                                         .w400),
                                  //                       ),
                                  //                       ScreenUtil()
                                  //                           .setVerticalSpacing(
                                  //                               4),
                                  //                       TextFormField(
                                  //                         autovalidateMode:
                                  //                             AutovalidateMode
                                  //                                 .onUserInteraction,
                                  //                         controller:
                                  //                             _validateDurationController,
                                  //                         decoration:
                                  //                             InputDecoration(
                                  //                           suffixIcon:
                                  //                               const Padding(
                                  //                             padding: EdgeInsets
                                  //                                 .only(
                                  //                                     top: 10,
                                  //                                     right:
                                  //                                         10),
                                  //                             child: Text(
                                  //                               'seconds',
                                  //                               style: TextStyle(
                                  //                                   color: Color(
                                  //                                       0xFF7A8699)),
                                  //                             ),
                                  //                           ),
                                  //                           enabledBorder:
                                  //                               OutlineInputBorder(
                                  //                             borderSide:
                                  //                                 const BorderSide(
                                  //                               color: Color(
                                  //                                   0xFFB3B9C4),
                                  //                               width: 1.0,
                                  //                             ),
                                  //                             borderRadius:
                                  //                                 BorderRadius
                                  //                                     .circular(
                                  //                                         4.0),
                                  //                           ),
                                  //                           disabledBorder:
                                  //                               OutlineInputBorder(
                                  //                             borderSide:
                                  //                                 const BorderSide(
                                  //                               color: Color(
                                  //                                   0xFFB3B9C4),
                                  //                               width: 1.0,
                                  //                             ),
                                  //                             borderRadius:
                                  //                                 BorderRadius
                                  //                                     .circular(
                                  //                                         4.0),
                                  //                           ),
                                  //                           focusedBorder:
                                  //                               OutlineInputBorder(
                                  //                             borderSide:
                                  //                                 const BorderSide(
                                  //                               color: Color(
                                  //                                   0xFFB3B9C4),
                                  //                               width: 1.0,
                                  //                             ),
                                  //                             borderRadius:
                                  //                                 BorderRadius
                                  //                                     .circular(
                                  //                                         4.0),
                                  //                           ),
                                  //                           errorBorder:
                                  //                               OutlineInputBorder(
                                  //                             borderSide:
                                  //                                 const BorderSide(
                                  //                               color: Color(
                                  //                                   0xFFB3B9C4),
                                  //                               width: 1.0,
                                  //                             ),
                                  //                             borderRadius:
                                  //                                 BorderRadius
                                  //                                     .circular(
                                  //                                         4.0),
                                  //                           ),
                                  //                           focusedErrorBorder:
                                  //                               OutlineInputBorder(
                                  //                             borderSide:
                                  //                                 const BorderSide(
                                  //                               color: Color(
                                  //                                   0xFFB3B9C4),
                                  //                               width: 1.0,
                                  //                             ),
                                  //                             borderRadius:
                                  //                                 BorderRadius
                                  //                                     .circular(
                                  //                                         4.0),
                                  //                           ),
                                  //                         ),
                                  //                         obscureText: false,
                                  //                         textInputAction:
                                  //                             TextInputAction
                                  //                                 .done,
                                  //                         // textAlign:
                                  //                         //     TextAlign.left,
                                  //                         style: const TextStyle(
                                  //                             color: Color(
                                  //                                 0xFF243757),
                                  //                             fontSize: 14),
                                  //                         keyboardType:
                                  //                             TextInputType
                                  //                                 .number,
                                  //                         // onFieldSubmitted:
                                  //                         //     (value) {
                                  //                         //   _validateDurationController
                                  //                         //       .text = value;
                                  //                         // },
                                  //                         onTapOutside:
                                  //                             (event) async {
                                  //                           FocusManager
                                  //                               .instance
                                  //                               .primaryFocus
                                  //                               ?.unfocus();
                                  //                           await otpTImer(
                                  //                               _validateDurationController
                                  //                                   .text,
                                  //                               context);
                                  //                         },
                                  //                         validator: (value) {
                                  //                           if (value!
                                  //                               .isEmpty) {
                                  //                             return 'Please enter validity time';
                                  //                           } else {
                                  //                             return null;
                                  //                           }
                                  //                         },
                                  //                         onEditingComplete:
                                  //                             () async {
                                  //                           await otpTImer(
                                  //                               _validateDurationController
                                  //                                   .text,
                                  //                               context);
                                  //                         },
                                  //                       ),
                                  //                     ],
                                  //                   ),
                                  //                 ),
                                  //               ],
                                  //             ),

                                  //             // Wrap(
                                  //             //   children: [
                                  //             //     SizedBox(
                                  //             //       width: 100,
                                  //             //       child: Column(
                                  //             //         children: [
                                  //             //           BlocListener<
                                  //             //               VerifyAUserBloc,
                                  //             //               VerifyAUserState>(
                                  //             //             listener: (context,
                                  //             //                 state) {
                                  //             //               context
                                  //             //                   .read<
                                  //             //                       FindByCustomerIdBloc>()
                                  //             //                   .add(
                                  //             //                       const FindByCustomerIdCall());
                                  //             //             },
                                  //             //             child: Row(
                                  //             //               mainAxisAlignment:
                                  //             //                   MainAxisAlignment
                                  //             //                       .spaceBetween,
                                  //             //               children: [
                                  //             //                 Text(
                                  //             //                   'Brand Name',
                                  //             //                   style: Theme.of(
                                  //             //                           context)
                                  //             //                       .textTheme
                                  //             //                       .bodyMedium!
                                  //             //                       .copyWith(
                                  //             //                         color: const Color(
                                  //             //                             0xFF243757),
                                  //             //                         fontSize:
                                  //             //                             14.0,
                                  //             //                       ),
                                  //             //                 ),
                                  //             //                 BlocBuilder<
                                  //             //                         WalletBalanceBloc,
                                  //             //                         WalletBalanceState>(
                                  //             //                     builder:
                                  //             //                         (context,
                                  //             //                             state) {
                                  //             //                   if (state
                                  //             //                       is WalletBalanceStateSuccess) {
                                  //             //                     return Row(
                                  //             //                       children: [
                                  //             //                         if (!isBrandNameEnable &&
                                  //             //                             state.walletBalanceEntity!.data!.userPaid!)
                                  //             //                           Padding(
                                  //             //                             padding: const EdgeInsetsDirectional.fromSTEB(
                                  //             //                                 5.0,
                                  //             //                                 0.0,
                                  //             //                                 0.0,
                                  //             //                                 0.0),
                                  //             //                             child:
                                  //             //                                 InkWell(
                                  //             //                               onTap: () {
                                  //             //                                 setState(() {
                                  //             //                                   isBrandNameEnable = true;
                                  //             //                                 });
                                  //             //                                 MixPanelAnalyticsManager().sendEvent('Getting_started_edit', 'Getting Started edit', null);
                                  //             //                               },
                                  //             //                               child: Text(
                                  //             //                                 'Edit',
                                  //             //                                 style: GoogleFonts.getFont(
                                  //             //                                   'Plus Jakarta Sans',
                                  //             //                                   color: const Color.fromARGB(255, 31, 73, 145),
                                  //             //                                   fontSize: 14.0,
                                  //             //                                 ),
                                  //             //                               ),
                                  //             //                             ),
                                  //             //                           ),
                                  //             //                         if (!isBrandNameEnable &&
                                  //             //                             !state.walletBalanceEntity!.data!.userPaid!)
                                  //             //                           Padding(
                                  //             //                             padding: const EdgeInsetsDirectional.fromSTEB(
                                  //             //                                 5.0,
                                  //             //                                 0.0,
                                  //             //                                 0.0,
                                  //             //                                 0.0),
                                  //             //                             child:
                                  //             //                                 Text(
                                  //             //                               'Edit ',
                                  //             //                               style: GoogleFonts.getFont(
                                  //             //                                 'Plus Jakarta Sans',
                                  //             //                                 color: Colors.grey,
                                  //             //                                 fontSize: 14.0,
                                  //             //                               ),
                                  //             //                             ),
                                  //             //                           ),
                                  //             //                         if (!state
                                  //             //                             .walletBalanceEntity!
                                  //             //                             .data!
                                  //             //                             .userPaid!)
                                  //             //                           AlignedTooltip(
                                  //             //                             content:
                                  //             //                                 Padding(
                                  //             //                               padding: const EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 15.0),
                                  //             //                               child: Text(
                                  //             //                                 'Top up your balance to edit brand name',
                                  //             //                                 style: GoogleFonts.getFont(
                                  //             //                                   'Plus Jakarta Sans',
                                  //             //                                   color: FlutterFlowTheme.of(context).whiteColor,
                                  //             //                                   fontSize: 11.0,
                                  //             //                                 ),
                                  //             //                               ),
                                  //             //                             ),
                                  //             //                             offset:
                                  //             //                                 4.0,
                                  //             //                             preferredDirection:
                                  //             //                                 AxisDirection.up,
                                  //             //                             borderRadius:
                                  //             //                                 BorderRadius.circular(4.0),
                                  //             //                             backgroundColor:
                                  //             //                                 const Color(0xFF243757),
                                  //             //                             elevation:
                                  //             //                                 4.0,
                                  //             //                             tailBaseWidth:
                                  //             //                                 24.0,
                                  //             //                             tailLength:
                                  //             //                                 12.0,
                                  //             //                             waitDuration:
                                  //             //                                 const Duration(milliseconds: 100),
                                  //             //                             showDuration:
                                  //             //                                 const Duration(milliseconds: 1500),
                                  //             //                             triggerMode:
                                  //             //                                 TooltipTriggerMode.tap,
                                  //             //                             child:
                                  //             //                                 const FaIcon(
                                  //             //                               FontAwesomeIcons.circleInfo,
                                  //             //                               color: Color(0xFF7A8699),
                                  //             //                               size: 16.0,
                                  //             //                             ),
                                  //             //                           ),
                                  //             //                         if (isBrandNameEnable &&
                                  //             //                             state.walletBalanceEntity!.data!.userPaid!)
                                  //             //                           Padding(
                                  //             //                             padding: const EdgeInsetsDirectional.fromSTEB(
                                  //             //                                 5.0,
                                  //             //                                 0.0,
                                  //             //                                 0.0,
                                  //             //                                 0.0),
                                  //             //                             child:
                                  //             //                                 InkWell(
                                  //             //                               onTap: () {
                                  //             //                                 if (_formKey.currentState!.validate()) {
                                  //             //                                   _formKey.currentState?.save();
                                  //             //                                   setState(() {
                                  //             //                                     isBrandNameEnable = false;
                                  //             //                                   });
                                  //             //                                   context.read<VerifyAUserBloc>().add(
                                  //             //                                         GetVerifyAUserUpdateBrandNamePressedButton(
                                  //             //                                           customerId: LocalStateCache().customerId,
                                  //             //                                           brandName: _brandNameController.text,
                                  //             //                                           authToken: LocalStateCache().authToken,
                                  //             //                                         ),
                                  //             //                                       );
                                  //             //                                 }
                                  //             //                               },
                                  //             //                               child: Text(
                                  //             //                                 'Save ',
                                  //             //                                 style: GoogleFonts.getFont(
                                  //             //                                   'Plus Jakarta Sans',
                                  //             //                                   color: const Color.fromARGB(255, 31, 73, 145),
                                  //             //                                   fontSize: 14.0,
                                  //             //                                 ),
                                  //             //                               ),
                                  //             //                             ),
                                  //             //                           ),
                                  //             //                       ],
                                  //             //                     );
                                  //             //                   }
                                  //             //                   return const SizedBox
                                  //             //                       .shrink();
                                  //             //                 }),
                                  //             //               ],
                                  //             //             ),
                                  //             //           ),
                                  //             //           ScreenUtil()
                                  //             //               .setVerticalSpacing(
                                  //             //                   4),
                                  //             //           TextFormField(
                                  //             //             autovalidateMode:
                                  //             //                 AutovalidateMode
                                  //             //                     .onUserInteraction,
                                  //             //             controller:
                                  //             //                 _brandNameController,
                                  //             //             decoration:
                                  //             //                 InputDecoration(
                                  //             //               enabledBorder:
                                  //             //                   OutlineInputBorder(
                                  //             //                 borderSide:
                                  //             //                     const BorderSide(
                                  //             //                   color: Color(
                                  //             //                       0xFFB3B9C4),
                                  //             //                   width: 1.0,
                                  //             //                 ),
                                  //             //                 borderRadius:
                                  //             //                     BorderRadius
                                  //             //                         .circular(
                                  //             //                             4.0),
                                  //             //               ),
                                  //             //               disabledBorder:
                                  //             //                   OutlineInputBorder(
                                  //             //                 borderSide:
                                  //             //                     const BorderSide(
                                  //             //                   color: Color(
                                  //             //                       0xFFB3B9C4),
                                  //             //                   width: 1.0,
                                  //             //                 ),
                                  //             //                 borderRadius:
                                  //             //                     BorderRadius
                                  //             //                         .circular(
                                  //             //                             4.0),
                                  //             //               ),
                                  //             //               focusedBorder:
                                  //             //                   OutlineInputBorder(
                                  //             //                 borderSide:
                                  //             //                     const BorderSide(
                                  //             //                   color: Color(
                                  //             //                       0xFFB3B9C4),
                                  //             //                   width: 1.0,
                                  //             //                 ),
                                  //             //                 borderRadius:
                                  //             //                     BorderRadius
                                  //             //                         .circular(
                                  //             //                             4.0),
                                  //             //               ),
                                  //             //               errorBorder:
                                  //             //                   OutlineInputBorder(
                                  //             //                 borderSide:
                                  //             //                     const BorderSide(
                                  //             //                   color: Color(
                                  //             //                       0xFFB3B9C4),
                                  //             //                   width: 1.0,
                                  //             //                 ),
                                  //             //                 borderRadius:
                                  //             //                     BorderRadius
                                  //             //                         .circular(
                                  //             //                             4.0),
                                  //             //               ),
                                  //             //               focusedErrorBorder:
                                  //             //                   OutlineInputBorder(
                                  //             //                 borderSide:
                                  //             //                     const BorderSide(
                                  //             //                   color: Color(
                                  //             //                       0xFFB3B9C4),
                                  //             //                   width: 1.0,
                                  //             //                 ),
                                  //             //                 borderRadius:
                                  //             //                     BorderRadius
                                  //             //                         .circular(
                                  //             //                             4.0),
                                  //             //               ),
                                  //             //             ),
                                  //             //             obscureText: false,
                                  //             //             maxLength: 20,
                                  //             //             inputFormatters: [
                                  //             //               LengthLimitingTextInputFormatter(
                                  //             //                   20)
                                  //             //             ],
                                  //             //             enabled:
                                  //             //                 isBrandNameEnable,
                                  //             //             textInputAction:
                                  //             //                 TextInputAction
                                  //             //                     .next,
                                  //             //             textAlign:
                                  //             //                 TextAlign.left,
                                  //             //             style: const TextStyle(
                                  //             //                 color: Color(
                                  //             //                     0xFF243757),
                                  //             //                 fontSize: 14),
                                  //             //             keyboardType:
                                  //             //                 TextInputType
                                  //             //                     .text,
                                  //             //             onFieldSubmitted:
                                  //             //                 (value) {
                                  //             //               _brandNameController
                                  //             //                   .text = value;
                                  //             //             },
                                  //             //             validator: (value) {
                                  //             //               if (value!
                                  //             //                       .length >
                                  //             //                   20) {
                                  //             //                 return 'Please enter 20 character only';
                                  //             //               } else {
                                  //             //                 return null;
                                  //             //               }
                                  //             //             },
                                  //             //           ),
                                  //             //         ],
                                  //             //       ),
                                  //             //     ),
                                  //             //     Column(
                                  //             //       crossAxisAlignment:
                                  //             //           CrossAxisAlignment
                                  //             //               .start,
                                  //             //       mainAxisAlignment:
                                  //             //           MainAxisAlignment
                                  //             //               .start,
                                  //             //       children: [
                                  //             //         BlocListener<
                                  //             //             VerifyAUserBloc,
                                  //             //             VerifyAUserState>(
                                  //             //           listener:
                                  //             //               (context, state) {
                                  //             //             context
                                  //             //                 .read<
                                  //             //                     FindByCustomerIdBloc>()
                                  //             //                 .add(
                                  //             //                     const FindByCustomerIdCall());
                                  //             //           },
                                  //             //           child: Text(
                                  //             //             'Brand Name',
                                  //             //             style: Theme.of(
                                  //             //                     context)
                                  //             //                 .textTheme
                                  //             //                 .bodyMedium!
                                  //             //                 .copyWith(
                                  //             //                   color: const Color(
                                  //             //                       0xFF243757),
                                  //             //                   fontSize:
                                  //             //                       14.0,
                                  //             //                 ),
                                  //             //           ),
                                  //             //         ),
                                  //             //         ScreenUtil()
                                  //             //             .setVerticalSpacing(
                                  //             //                 4),
                                  //             //         TextFormField(
                                  //             //           autovalidateMode:
                                  //             //               AutovalidateMode
                                  //             //                   .onUserInteraction,
                                  //             //           controller:
                                  //             //               _brandNameController,
                                  //             //           decoration:
                                  //             //               InputDecoration(
                                  //             //             enabledBorder:
                                  //             //                 OutlineInputBorder(
                                  //             //               borderSide:
                                  //             //                   const BorderSide(
                                  //             //                 color: Color(
                                  //             //                     0xFFB3B9C4),
                                  //             //                 width: 1.0,
                                  //             //               ),
                                  //             //               borderRadius:
                                  //             //                   BorderRadius
                                  //             //                       .circular(
                                  //             //                           4.0),
                                  //             //             ),
                                  //             //             disabledBorder:
                                  //             //                 OutlineInputBorder(
                                  //             //               borderSide:
                                  //             //                   const BorderSide(
                                  //             //                 color: Color(
                                  //             //                     0xFFB3B9C4),
                                  //             //                 width: 1.0,
                                  //             //               ),
                                  //             //               borderRadius:
                                  //             //                   BorderRadius
                                  //             //                       .circular(
                                  //             //                           4.0),
                                  //             //             ),
                                  //             //             focusedBorder:
                                  //             //                 OutlineInputBorder(
                                  //             //               borderSide:
                                  //             //                   const BorderSide(
                                  //             //                 color: Color(
                                  //             //                     0xFFB3B9C4),
                                  //             //                 width: 1.0,
                                  //             //               ),
                                  //             //               borderRadius:
                                  //             //                   BorderRadius
                                  //             //                       .circular(
                                  //             //                           4.0),
                                  //             //             ),
                                  //             //             errorBorder:
                                  //             //                 OutlineInputBorder(
                                  //             //               borderSide:
                                  //             //                   const BorderSide(
                                  //             //                 color: Color(
                                  //             //                     0xFFB3B9C4),
                                  //             //                 width: 1.0,
                                  //             //               ),
                                  //             //               borderRadius:
                                  //             //                   BorderRadius
                                  //             //                       .circular(
                                  //             //                           4.0),
                                  //             //             ),
                                  //             //             focusedErrorBorder:
                                  //             //                 OutlineInputBorder(
                                  //             //               borderSide:
                                  //             //                   const BorderSide(
                                  //             //                 color: Color(
                                  //             //                     0xFFB3B9C4),
                                  //             //                 width: 1.0,
                                  //             //               ),
                                  //             //               borderRadius:
                                  //             //                   BorderRadius
                                  //             //                       .circular(
                                  //             //                           4.0),
                                  //             //             ),
                                  //             //           ),
                                  //             //           obscureText: false,
                                  //             //           maxLength: 20,
                                  //             //           inputFormatters: [
                                  //             //             LengthLimitingTextInputFormatter(
                                  //             //                 20)
                                  //             //           ],
                                  //             //           enabled:
                                  //             //               isBrandNameEnable,
                                  //             //           textInputAction:
                                  //             //               TextInputAction
                                  //             //                   .next,
                                  //             //           textAlign:
                                  //             //               TextAlign.left,
                                  //             //           style: const TextStyle(
                                  //             //               color: Color(
                                  //             //                   0xFF243757),
                                  //             //               fontSize: 14),
                                  //             //           keyboardType:
                                  //             //               TextInputType
                                  //             //                   .text,
                                  //             //           onFieldSubmitted:
                                  //             //               (value) {
                                  //             //             _brandNameController
                                  //             //                 .text = value;
                                  //             //           },
                                  //             //           validator: (value) {
                                  //             //             if (value!.length >
                                  //             //                 20) {
                                  //             //               return 'Please enter 20 character only';
                                  //             //             } else {
                                  //             //               return null;
                                  //             //             }
                                  //             //           },
                                  //             //         ),
                                  //             //       ],
                                  //             //     ),

                                  //             //   ],
                                  //             // ),
                                  //             // ScreenUtil()
                                  //             //     .setVerticalSpacing(5),

                                  //             BlocBuilder<WalletBalanceBloc,
                                  //                     WalletBalanceState>(
                                  //                 builder: (context, state) {
                                  //               if (state
                                  //                       is WalletBalanceStateSuccess &&
                                  //                   state.walletBalanceEntity !=
                                  //                       null) {
                                  //                 return Visibility(
                                  //                   visible: !state
                                  //                       .walletBalanceEntity!
                                  //                       .data!
                                  //                       .userPaid!,
                                  //                   child: Column(
                                  //                     crossAxisAlignment:
                                  //                         CrossAxisAlignment
                                  //                             .start,
                                  //                     mainAxisAlignment:
                                  //                         MainAxisAlignment
                                  //                             .start,
                                  //                     children: [
                                  //                       Container(
                                  //                         margin:
                                  //                             const EdgeInsets
                                  //                                 .only(
                                  //                           top: 5,
                                  //                           bottom: 16,
                                  //                         ),
                                  //                         padding:
                                  //                             const EdgeInsets
                                  //                                 .symmetric(
                                  //                                 vertical: 10,
                                  //                                 horizontal:
                                  //                                     10),
                                  //                         decoration: BoxDecoration(
                                  //                             color: const Color(
                                  //                                 0xFFCAF2FF),
                                  //                             borderRadius:
                                  //                                 BorderRadius
                                  //                                     .circular(
                                  //                                         4)),
                                  //                         child: Row(
                                  //                           children: [
                                  //                             const Icon(
                                  //                               Icons
                                  //                                   .info_rounded,
                                  //                               color: Color(
                                  //                                   0xFF0F8AB0),
                                  //                             ),
                                  //                             Flexible(
                                  //                               child:
                                  //                                   Text.rich(
                                  //                                 TextSpan(
                                  //                                     text: '',
                                  //                                     children: <InlineSpan>[
                                  //                                       TextSpan(
                                  //                                           text:
                                  //                                               'Top up credits ',
                                  //                                           recognizer: TapGestureRecognizer()
                                  //                                             ..onTap = () async => await showModalBottomSheet(
                                  //                                                   isScrollControlled: true,
                                  //                                                   backgroundColor: Colors.transparent,
                                  //                                                   enableDrag: false,
                                  //                                                   context: context,
                                  //                                                   builder: (context) {
                                  //                                                     return Padding(
                                  //                                                       padding: MediaQuery.viewInsetsOf(context),
                                  //                                                       child: const AddCreditWidget(),
                                  //                                                     );
                                  //                                                   },
                                  //                                                 ),
                                  //                                           style: const TextStyle(
                                  //                                             decoration: TextDecoration.underline,
                                  //                                             fontSize: 14,
                                  //                                             fontWeight: FontWeight.w400,
                                  //                                             color: Color(0xFF0F8AB0),
                                  //                                           )),
                                  //                                       const TextSpan(
                                  //                                           text:
                                  //                                               'to enable brand name edit',
                                  //                                           style: TextStyle(
                                  //                                               fontSize: 14,
                                  //                                               overflow: TextOverflow.ellipsis,
                                  //                                               fontWeight: FontWeight.w400,
                                  //                                               color: Color(0xFF243757))),
                                  //                                     ]),
                                  //                                 style: const TextStyle(
                                  //                                     color: Color(0xFF0F8AB0),
                                  //                                     fontSize: 14,
                                  //                                     // decoration:
                                  //                                     //     TextDecoration
                                  //                                     //         .underline,
                                  //                                     fontWeight: FontWeight.w400),
                                  //                               ),
                                  //                             ),
                                  //                           ],
                                  //                         ),
                                  //                       ),
                                  //                       ScreenUtil()
                                  //                           .setVerticalSpacing(
                                  //                               16),
                                  //                     ],
                                  //                   ),
                                  //                 );
                                  //               } else {
                                  //                 return const SizedBox
                                  //                     .shrink();
                                  //               }
                                  //             }),

                                  //             Text(
                                  //               'Recipient number',
                                  //               style: Theme.of(context)
                                  //                   .textTheme
                                  //                   .bodyMedium!
                                  //                   .copyWith(
                                  //                     color: const Color(
                                  //                         0xFF243757),
                                  //                     fontSize: 14.0,
                                  //                   ),
                                  //             ),
                                  //             ScreenUtil()
                                  //                 .setVerticalSpacing(4),
                                  //             TextFormField(
                                  //               autovalidateMode:
                                  //                   AutovalidateMode
                                  //                       .onUserInteraction,
                                  //               controller:
                                  //                   _recipientNoController,
                                  //               obscureText: false,
                                  //               enabled: false,
                                  //               textInputAction:
                                  //                   TextInputAction.next,
                                  //               decoration:
                                  //                   const InputDecoration(
                                  //                 fillColor: Color(0xFFF5F6F7),
                                  //                 filled: true,
                                  //                 hoverColor: Color(0xFFF5F6F7),
                                  //                 focusColor: Color(0xFFF5F6F7),
                                  //               ),
                                  //               textAlign: TextAlign.left,
                                  //               style: const TextStyle(
                                  //                   color: Color(0xFF243757),
                                  //                   fontSize: 14),
                                  //               keyboardType:
                                  //                   TextInputType.text,
                                  //               onFieldSubmitted: (value) {
                                  //                 _recipientNoController.text =
                                  //                     value;
                                  //               },
                                  //             ),
                                  //             ScreenUtil()
                                  //                 .setVerticalSpacing(16),
                                  //             const Text(
                                  //               "Message Preview",
                                  //               style: TextStyle(
                                  //                   color: Color(0xFF000000),
                                  //                   fontSize: 14,
                                  //                   fontWeight:
                                  //                       FontWeight.w600),
                                  //             ),
                                  //             ScreenUtil()
                                  //                 .setVerticalSpacing(4),
                                  //             Container(
                                  //               padding:
                                  //                   const EdgeInsets.symmetric(
                                  //                       vertical: 10,
                                  //                       horizontal: 10),
                                  //               decoration: BoxDecoration(
                                  //                   borderRadius:
                                  //                       BorderRadius.circular(
                                  //                           4),
                                  //                   color: const Color(
                                  //                       0xFFEDF2FA)),
                                  //               child: Text.rich(
                                  //                 TextSpan(
                                  //                     text:
                                  //                         '**** is your one time password (OTP) for user authentication from ',
                                  //                     children: <InlineSpan>[
                                  //                       TextSpan(
                                  //                           text:
                                  //                               "${LocalStateCache().brandName} ",
                                  //                           style: const TextStyle(
                                  //                               fontSize: 14,
                                  //                               fontWeight:
                                  //                                   FontWeight
                                  //                                       .w600,
                                  //                               color: Color(
                                  //                                   0xFF243757))),
                                  //                       TextSpan(
                                  //                           text: LocalStateCache()
                                  //                                       .countryCode ==
                                  //                                   "91"
                                  //                               ? '- Powered by U2OPIA'
                                  //                               : "",
                                  //                           style: const TextStyle(
                                  //                               fontSize: 14,
                                  //                               fontWeight:
                                  //                                   FontWeight
                                  //                                       .w400,
                                  //                               color: Color(
                                  //                                   0xFF243757))),
                                  //                     ]),
                                  //                 style: const TextStyle(
                                  //                     color: Color(0xFF243757),
                                  //                     fontSize: 14,
                                  //                     // decoration:
                                  //                     //     TextDecoration
                                  //                     //         .underline,
                                  //                     fontWeight:
                                  //                         FontWeight.w400),
                                  //               ),
                                  //             ),
                                  //             const SizedBox(
                                  //               height: 16,
                                  //             ),
                                  //             BlocListener<VerifyAUserBloc,
                                  //                 VerifyAUserState>(
                                  //               listener: (context, state) {
                                  //                 if (state
                                  //                         is VerifyAUserStateSuccess &&
                                  //                     state.verifyAUserEntity
                                  //                             ?.userData !=
                                  //                         null) {
                                  //                   setState(() {
                                  //                     LocalStateCache()
                                  //                         .setVerificationId = state
                                  //                             .verifyAUserEntity
                                  //                             ?.userData
                                  //                             ?.verificationId ??
                                  //                         "";
                                  //                   });
                                  //                 }
                                  //               },
                                  //               child: Column(
                                  //                 mainAxisAlignment:
                                  //                     MainAxisAlignment.start,
                                  //                 crossAxisAlignment:
                                  //                     CrossAxisAlignment.start,
                                  //                 mainAxisSize:
                                  //                     MainAxisSize.max,
                                  //                 children: [
                                  //                   if (!Responsive.isMobile(
                                  //                       context))
                                  //                     IntrinsicHeight(
                                  //                       child: Row(
                                  //                         children: [
                                  //                           Expanded(
                                  //                             child: Column(
                                  //                               crossAxisAlignment:
                                  //                                   CrossAxisAlignment
                                  //                                       .start,
                                  //                               mainAxisAlignment:
                                  //                                   MainAxisAlignment
                                  //                                       .start,
                                  //                               mainAxisSize:
                                  //                                   MainAxisSize
                                  //                                       .max,
                                  //                               children: [
                                  //                                 ElevatedButton
                                  //                                     .icon(
                                  //                                   icon:
                                  //                                       const Icon(
                                  //                                     FontAwesomeIcons
                                  //                                         .envelope,
                                  //                                     size: 20,
                                  //                                   ),
                                  //                                   style: ElevatedButton
                                  //                                       .styleFrom(
                                  //                                     elevation:
                                  //                                         0.1,
                                  //                                     disabledBackgroundColor:
                                  //                                         const Color(
                                  //                                             0xFFB1DDC4),
                                  //                                     backgroundColor:
                                  //                                         const Color(
                                  //                                             0xff11984A),
                                  //                                     minimumSize: Size(
                                  //                                         MediaQuery.of(context).size.width /
                                  //                                             2,
                                  //                                         52),
                                  //                                   ),
                                  //                                   onPressed:
                                  //                                       isTimersendsmsVisible
                                  //                                           ? null
                                  //                                           : () {
                                  //                                               // Check if recipient number is not null and not empty
                                  //                                               if (_recipientNoController.text.isNotEmpty) {
                                  //                                                 setState(() {
                                  //                                                   _controllerotpSMS.start();

                                  //                                                   isTimersendsmsVisible = true;
                                  //                                                   if (currentStep != 3) {
                                  //                                                     currentStep = 2;
                                  //                                                   }
                                  //                                                 });
                                  //                                                 context.read<VerifyAUserBloc>().add(
                                  //                                                       GetVerifyAUserPressedButton(
                                  //                                                         flowType: 'SMS',
                                  //                                                         customerId: LocalStateCache().customerId,
                                  //                                                         countryCode: LocalStateCache().countryCode,
                                  //                                                         mobileNumber: findbyCustomerSate.findByCustomerIdEntity?.data?.phoneNo ?? "",
                                  //                                                         authToken: LocalStateCache().authToken,
                                  //                                                       ),
                                  //                                                     );
                                  //                                               } else {
                                  //                                                 // Show error message if recipient number is null or empty
                                  //                                                 ScaffoldMessenger.of(context).showSnackBar(
                                  //                                                   SnackBar(
                                  //                                                     content: Text(
                                  //                                                       'Recipient number is required to send OTP.',
                                  //                                                       style: GoogleFonts.getFont(
                                  //                                                         'Plus Jakarta Sans',
                                  //                                                         color: FlutterFlowTheme.of(context).whiteColor,
                                  //                                                         fontSize: 14.0,
                                  //                                                       ),
                                  //                                                     ),
                                  //                                                     duration: const Duration(milliseconds: 2000),
                                  //                                                     backgroundColor: FlutterFlowTheme.of(context).primary,
                                  //                                                   ),
                                  //                                                 );
                                  //                                               }
                                  //                                               MixPanelAnalyticsManager().sendEvent('Getting_started_send_otp', 'Getting Started send otp', null);
                                  //                                             },
                                  //                                   label: const Text(
                                  //                                       "Send via SMS"), //Send OTP via SMS
                                  //                                 ),
                                  //                                 if (isTimersendsmsVisible)
                                  //                                   Padding(
                                  //                                     padding: const EdgeInsets
                                  //                                         .only(
                                  //                                         top:
                                  //                                             5),
                                  //                                     child:
                                  //                                         Row(
                                  //                                       mainAxisSize:
                                  //                                           MainAxisSize.max,
                                  //                                       mainAxisAlignment:
                                  //                                           MainAxisAlignment.start,
                                  //                                       children: [
                                  //                                         const Icon(
                                  //                                           FontAwesomeIcons.circleInfo,
                                  //                                           color:
                                  //                                               Color(0xFF7A8699),
                                  //                                           size:
                                  //                                               16,
                                  //                                         ),
                                  //                                         const SizedBox(
                                  //                                           width:
                                  //                                               5,
                                  //                                         ),
                                  //                                         const Text(
                                  //                                           'Try in ',
                                  //                                           style:
                                  //                                               TextStyle(
                                  //                                             color: Color(0xFF243757),
                                  //                                             fontWeight: FontWeight.w400,
                                  //                                             fontSize: 12.0,
                                  //                                           ),
                                  //                                         ),
                                  //                                         Countdown(
                                  //                                           controller:
                                  //                                               _controllerotpSMS,
                                  //                                           seconds:
                                  //                                               duration,
                                  //                                           build: (_, double time) =>
                                  //                                               Text(
                                  //                                             formatDuration(time.floor()),
                                  //                                             style: const TextStyle(
                                  //                                               color: Color(0xFF42526D),
                                  //                                               fontWeight: FontWeight.w400,
                                  //                                               fontSize: 11.7,
                                  //                                             ),
                                  //                                           ),
                                  //                                           interval:
                                  //                                               const Duration(milliseconds: 100),
                                  //                                           onFinished:
                                  //                                               () {
                                  //                                             setState(() {
                                  //                                               isTimersendsmsVisible = false;
                                  //                                             });
                                  //                                           },
                                  //                                         ),
                                  //                                       ],
                                  //                                     ),
                                  //                                   ),
                                  //                               ],
                                  //                             ),
                                  //                           ),
                                  //                           Row(
                                  //                             mainAxisAlignment:
                                  //                                 MainAxisAlignment
                                  //                                     .center,
                                  //                             crossAxisAlignment:
                                  //                                 CrossAxisAlignment
                                  //                                     .center,
                                  //                             children: [
                                  //                               Container(
                                  //                                   height: 1,
                                  //                                   width: 5,
                                  //                                   color: const Color(
                                  //                                       0xFFDFE2E6)),
                                  //                               const SizedBox(
                                  //                                 width: 5,
                                  //                               ),
                                  //                               const Text(
                                  //                                 'or',
                                  //                                 style: TextStyle(
                                  //                                     fontSize:
                                  //                                         11.7,
                                  //                                     color: Color(
                                  //                                         0xFF98A1B0)),
                                  //                               ),
                                  //                               const SizedBox(
                                  //                                 width: 5,
                                  //                               ),
                                  //                               Container(
                                  //                                   height: 1,
                                  //                                   width: 5,
                                  //                                   color: const Color(
                                  //                                       0xFFDFE2E6)),
                                  //                             ],
                                  //                           ),
                                  //                           Expanded(
                                  //                             child: Column(
                                  //                               mainAxisSize:
                                  //                                   MainAxisSize
                                  //                                       .max,
                                  //                               mainAxisAlignment:
                                  //                                   MainAxisAlignment
                                  //                                       .start,
                                  //                               crossAxisAlignment:
                                  //                                   CrossAxisAlignment
                                  //                                       .start,
                                  //                               children: [
                                  //                                 ElevatedButton
                                  //                                     .icon(
                                  //                                   icon:
                                  //                                       const Icon(
                                  //                                     FontAwesomeIcons
                                  //                                         .whatsapp,
                                  //                                     size: 25,
                                  //                                   ),
                                  //                                   style: ElevatedButton
                                  //                                       .styleFrom(
                                  //                                     elevation:
                                  //                                         0.1,
                                  //                                     disabledBackgroundColor:
                                  //                                         const Color(
                                  //                                             0xFFB1DDC4),
                                  //                                     backgroundColor:
                                  //                                         const Color(
                                  //                                             0xff11984A),
                                  //                                     minimumSize: Size(
                                  //                                         MediaQuery.of(context).size.width /
                                  //                                             2,
                                  //                                         52),
                                  //                                   ),
                                  //                                   onPressed:
                                  //                                       isTimersendsmsviaWhatsAppVisible
                                  //                                           ? null
                                  //                                           : () {
                                  //                                               // Check if recipient number is not null and not empty
                                  //                                               if (_recipientNoController.text.isNotEmpty) {
                                  //                                                 _controllerotpWhatsapp.start();
                                  //                                                 setState(() {
                                  //                                                   isTimersendsmsviaWhatsAppVisible = true;

                                  //                                                   if (currentStep != 3) {
                                  //                                                     currentStep = 2;
                                  //                                                   }
                                  //                                                 });
                                  //                                                 context.read<VerifyAUserBloc>().add(
                                  //                                                       GetVerifyAUserPressedButton(
                                  //                                                         flowType: 'WHATSAPP',
                                  //                                                         customerId: LocalStateCache().customerId,
                                  //                                                         countryCode: LocalStateCache().countryCode,
                                  //                                                         mobileNumber: findbyCustomerSate.findByCustomerIdEntity?.data?.phoneNo ?? "",
                                  //                                                         authToken: LocalStateCache().authToken,
                                  //                                                       ),
                                  //                                                     );
                                  //                                               } else {
                                  //                                                 // Show error message if recipient number is null or empty
                                  //                                                 ScaffoldMessenger.of(context).showSnackBar(
                                  //                                                   SnackBar(
                                  //                                                     content: Text(
                                  //                                                       'Recipient number is required to send OTP.',
                                  //                                                       style: GoogleFonts.getFont(
                                  //                                                         'Plus Jakarta Sans',
                                  //                                                         color: FlutterFlowTheme.of(context).whiteColor,
                                  //                                                         fontSize: 14.0,
                                  //                                                       ),
                                  //                                                     ),
                                  //                                                     duration: const Duration(milliseconds: 2000),
                                  //                                                     backgroundColor: FlutterFlowTheme.of(context).primary,
                                  //                                                   ),
                                  //                                                 );
                                  //                                               }
                                  //                                               MixPanelAnalyticsManager().sendEvent('Getting_started_send_otp_via_whatsapp', 'Getting Started send otp via WhatsApp', null);
                                  //                                             },
                                  //                                   label: const Text(
                                  //                                       "Send via WhatsApp"),
                                  //                                 ),
                                  //                                 if (isTimersendsmsviaWhatsAppVisible)
                                  //                                   Padding(
                                  //                                     padding: const EdgeInsets
                                  //                                         .only(
                                  //                                         top:
                                  //                                             5),
                                  //                                     child:
                                  //                                         Row(
                                  //                                       mainAxisSize:
                                  //                                           MainAxisSize.max,
                                  //                                       mainAxisAlignment:
                                  //                                           MainAxisAlignment.start,
                                  //                                       children: [
                                  //                                         const Icon(
                                  //                                           FontAwesomeIcons.circleInfo,
                                  //                                           color:
                                  //                                               Color(0xFF7A8699),
                                  //                                           size:
                                  //                                               16,
                                  //                                         ),
                                  //                                         const SizedBox(
                                  //                                           width:
                                  //                                               5,
                                  //                                         ),
                                  //                                         const Text(
                                  //                                           'Try in ',
                                  //                                           style:
                                  //                                               TextStyle(
                                  //                                             color: Color(0xFF243757),
                                  //                                             fontWeight: FontWeight.w400,
                                  //                                             fontSize: 12.0,
                                  //                                           ),
                                  //                                         ),
                                  //                                         Countdown(
                                  //                                           controller:
                                  //                                               _controllerotpWhatsapp,
                                  //                                           seconds:
                                  //                                               duration,
                                  //                                           build: (_, double time) =>
                                  //                                               Text(
                                  //                                             formatDuration(time.floor()),
                                  //                                             style: const TextStyle(
                                  //                                               color: Color(0xFF42526D),
                                  //                                               fontWeight: FontWeight.w400,
                                  //                                               fontSize: 11.7,
                                  //                                             ),
                                  //                                           ),
                                  //                                           interval:
                                  //                                               const Duration(milliseconds: 100),
                                  //                                           onFinished:
                                  //                                               () {
                                  //                                             setState(() {
                                  //                                               isTimersendsmsviaWhatsAppVisible = false;
                                  //                                             });
                                  //                                           },
                                  //                                         ),
                                  //                                       ],
                                  //                                     ),
                                  //                                   ),
                                  //                               ],
                                  //                             ),
                                  //                           )
                                  //                         ],
                                  //                       ),
                                  //                     ),
                                  //                   if (Responsive.isMobile(
                                  //                       context))
                                  //                     Column(
                                  //                       children: [
                                  //                         Column(
                                  //                           children: [
                                  //                             ElevatedButton
                                  //                                 .icon(
                                  //                               icon:
                                  //                                   const Icon(
                                  //                                 FontAwesomeIcons
                                  //                                     .envelope,
                                  //                                 size: 20,
                                  //                               ),
                                  //                               style: ElevatedButton
                                  //                                   .styleFrom(
                                  //                                 elevation:
                                  //                                     0.1,
                                  //                                 disabledBackgroundColor:
                                  //                                     const Color(
                                  //                                         0xFFB1DDC4),
                                  //                                 backgroundColor:
                                  //                                     const Color(
                                  //                                         0xff11984A),
                                  //                                 minimumSize:
                                  //                                     const Size(
                                  //                                         double
                                  //                                             .infinity,
                                  //                                         52),
                                  //                                 // fixedSize:
                                  //                                 //     const Size(
                                  //                                 //         235,
                                  //                                 //         44),
                                  //                               ),
                                  //                               onPressed:
                                  //                                   isTimersendsmsVisible
                                  //                                       ? null
                                  //                                       : () {
                                  //                                           // Check if recipient number is not null and not empty
                                  //                                           if (_recipientNoController.text.isNotEmpty) {
                                  //                                             _controllerotpSMS.start();
                                  //                                             setState(() {
                                  //                                               isTimersendsmsVisible = true;
                                  //                                               if (currentStep != 3) {
                                  //                                                 currentStep = 2;
                                  //                                               }
                                  //                                             });
                                  //                                             context.read<VerifyAUserBloc>().add(
                                  //                                                   GetVerifyAUserPressedButton(
                                  //                                                     flowType: 'SMS',
                                  //                                                     customerId: LocalStateCache().customerId,
                                  //                                                     countryCode: LocalStateCache().countryCode,
                                  //                                                     mobileNumber: findbyCustomerSate.findByCustomerIdEntity?.data?.phoneNo ?? "",
                                  //                                                     authToken: LocalStateCache().authToken,
                                  //                                                   ),
                                  //                                                 );
                                  //                                           } else {
                                  //                                             // Show error message if recipient number is null or empty
                                  //                                             ScaffoldMessenger.of(context).showSnackBar(
                                  //                                               SnackBar(
                                  //                                                 content: Text(
                                  //                                                   'Recipient number is required to send OTP.',
                                  //                                                   style: GoogleFonts.getFont(
                                  //                                                     'Plus Jakarta Sans',
                                  //                                                     color: FlutterFlowTheme.of(context).whiteColor,
                                  //                                                     fontSize: 14.0,
                                  //                                                   ),
                                  //                                                 ),
                                  //                                                 duration: const Duration(milliseconds: 2000),
                                  //                                                 backgroundColor: FlutterFlowTheme.of(context).primary,
                                  //                                               ),
                                  //                                             );
                                  //                                           }
                                  //                                           MixPanelAnalyticsManager().sendEvent(
                                  //                                               'Getting_started_send_otp',
                                  //                                               'Getting Started send otp',
                                  //                                               null);
                                  //                                         },
                                  //                               label: const Text(
                                  //                                   "Send via SMS"), //Send OTP via SMS
                                  //                             ),
                                  //                             if (isTimersendsmsVisible)
                                  //                               Padding(
                                  //                                 padding:
                                  //                                     const EdgeInsets
                                  //                                         .only(
                                  //                                         top:
                                  //                                             5),
                                  //                                 child: Row(
                                  //                                   mainAxisSize:
                                  //                                       MainAxisSize
                                  //                                           .max,
                                  //                                   mainAxisAlignment:
                                  //                                       MainAxisAlignment
                                  //                                           .start,
                                  //                                   children: [
                                  //                                     const Icon(
                                  //                                       FontAwesomeIcons
                                  //                                           .circleInfo,
                                  //                                       color: Color(
                                  //                                           0xFF7A8699),
                                  //                                       size:
                                  //                                           16,
                                  //                                     ),
                                  //                                     const SizedBox(
                                  //                                       width:
                                  //                                           5,
                                  //                                     ),
                                  //                                     const Text(
                                  //                                       'Try in ',
                                  //                                       style:
                                  //                                           TextStyle(
                                  //                                         color:
                                  //                                             Color(0xFF243757),
                                  //                                         fontWeight:
                                  //                                             FontWeight.w400,
                                  //                                         fontSize:
                                  //                                             12.0,
                                  //                                       ),
                                  //                                     ),
                                  //                                     Countdown(
                                  //                                       controller:
                                  //                                           _controllerotpSMS,
                                  //                                       seconds:
                                  //                                           duration,
                                  //                                       build: (_,
                                  //                                               double time) =>
                                  //                                           Text(
                                  //                                         formatDuration(
                                  //                                             time.floor()),
                                  //                                         style:
                                  //                                             const TextStyle(
                                  //                                           color:
                                  //                                               Color(0xFF42526D),
                                  //                                           fontWeight:
                                  //                                               FontWeight.w400,
                                  //                                           fontSize:
                                  //                                               11.7,
                                  //                                         ),
                                  //                                       ),
                                  //                                       interval:
                                  //                                           const Duration(milliseconds: 100),
                                  //                                       onFinished:
                                  //                                           () {
                                  //                                         setState(
                                  //                                             () {
                                  //                                           isTimersendsmsVisible =
                                  //                                               false;
                                  //                                         });
                                  //                                       },
                                  //                                     ),
                                  //                                   ],
                                  //                                 ),
                                  //                               ),
                                  //                           ],
                                  //                         ),
                                  //                         Visibility(
                                  //                           visible: true,
                                  //                           child: Row(
                                  //                             mainAxisAlignment:
                                  //                                 MainAxisAlignment
                                  //                                     .center,
                                  //                             children: [
                                  //                               Container(
                                  //                                   height: 1,
                                  //                                   width: 5,
                                  //                                   color: const Color(
                                  //                                       0xFFDFE2E6)),
                                  //                               const SizedBox(
                                  //                                 width: 5,
                                  //                               ),
                                  //                               const Text(
                                  //                                 'or',
                                  //                                 style: TextStyle(
                                  //                                     fontSize:
                                  //                                         11.7,
                                  //                                     color: Color(
                                  //                                         0xFF98A1B0)),
                                  //                               ),
                                  //                               const SizedBox(
                                  //                                 width: 5,
                                  //                               ),
                                  //                               Container(
                                  //                                   height: 1,
                                  //                                   width: 5,
                                  //                                   color: const Color(
                                  //                                       0xFFDFE2E6)),
                                  //                             ],
                                  //                           ),
                                  //                         ),
                                  //                         Column(
                                  //                           mainAxisAlignment:
                                  //                               MainAxisAlignment
                                  //                                   .start,
                                  //                           crossAxisAlignment:
                                  //                               CrossAxisAlignment
                                  //                                   .start,
                                  //                           children: [
                                  //                             Visibility(
                                  //                               visible: true,
                                  //                               child:
                                  //                                   ElevatedButton
                                  //                                       .icon(
                                  //                                 icon:
                                  //                                     const Icon(
                                  //                                   FontAwesomeIcons
                                  //                                       .whatsapp,
                                  //                                   size: 25,
                                  //                                 ),
                                  //                                 style: ElevatedButton
                                  //                                     .styleFrom(
                                  //                                   elevation:
                                  //                                       0.1,
                                  //                                   disabledBackgroundColor:
                                  //                                       const Color(
                                  //                                           0xFFB1DDC4),
                                  //                                   backgroundColor:
                                  //                                       const Color(
                                  //                                           0xff11984A),
                                  //                                   minimumSize:
                                  //                                       const Size(
                                  //                                           double.infinity,
                                  //                                           52),
                                  //                                 ),
                                  //                                 onPressed:
                                  //                                     isTimersendsmsviaWhatsAppVisible
                                  //                                         ? null
                                  //                                         : () {
                                  //                                             // Check if recipient number is not null and not empty
                                  //                                             if (_recipientNoController.text.isNotEmpty) {
                                  //                                               _controllerotpWhatsapp.start();
                                  //                                               setState(() {
                                  //                                                 isTimersendsmsviaWhatsAppVisible = true;
                                  //                                                 if (currentStep != 3) {
                                  //                                                   currentStep = 2;
                                  //                                                 }
                                  //                                               });
                                  //                                               context.read<VerifyAUserBloc>().add(
                                  //                                                     GetVerifyAUserPressedButton(
                                  //                                                       flowType: 'WHATSAPP',
                                  //                                                       customerId: LocalStateCache().customerId,
                                  //                                                       countryCode: LocalStateCache().countryCode,
                                  //                                                       mobileNumber: findbyCustomerSate.findByCustomerIdEntity?.data?.phoneNo ?? "",
                                  //                                                       authToken: LocalStateCache().authToken,
                                  //                                                     ),
                                  //                                                   );
                                  //                                             } else {
                                  //                                               // Show error message if recipient number is null or empty
                                  //                                               ScaffoldMessenger.of(context).showSnackBar(
                                  //                                                 SnackBar(
                                  //                                                   content: Text(
                                  //                                                     'Recipient number is required to send OTP.',
                                  //                                                     style: GoogleFonts.getFont(
                                  //                                                       'Plus Jakarta Sans',
                                  //                                                       color: FlutterFlowTheme.of(context).whiteColor,
                                  //                                                       fontSize: 14.0,
                                  //                                                     ),
                                  //                                                   ),
                                  //                                                   duration: const Duration(milliseconds: 2000),
                                  //                                                   backgroundColor: FlutterFlowTheme.of(context).primary,
                                  //                                                 ),
                                  //                                               );
                                  //                                             }
                                  //                                             MixPanelAnalyticsManager().sendEvent('Getting_started_send_otp_via_whatsapp', 'Getting Started send otp via WhatsApp', null);
                                  //                                           },
                                  //                                 label: const Text(
                                  //                                     "Send via WhatsApp"),
                                  //                               ),
                                  //                             ),
                                  //                             if (isTimersendsmsviaWhatsAppVisible)
                                  //                               Padding(
                                  //                                 padding:
                                  //                                     const EdgeInsets
                                  //                                         .only(
                                  //                                         top:
                                  //                                             5),
                                  //                                 child: Row(
                                  //                                   mainAxisSize:
                                  //                                       MainAxisSize
                                  //                                           .max,
                                  //                                   mainAxisAlignment:
                                  //                                       MainAxisAlignment
                                  //                                           .start,
                                  //                                   children: [
                                  //                                     const Icon(
                                  //                                       FontAwesomeIcons
                                  //                                           .circleInfo,
                                  //                                       color: Color(
                                  //                                           0xFF7A8699),
                                  //                                       size:
                                  //                                           16,
                                  //                                     ),
                                  //                                     const SizedBox(
                                  //                                       width:
                                  //                                           5,
                                  //                                     ),
                                  //                                     const Text(
                                  //                                       'Try in ',
                                  //                                       style:
                                  //                                           TextStyle(
                                  //                                         color:
                                  //                                             Color(0xFF243757),
                                  //                                         fontWeight:
                                  //                                             FontWeight.w400,
                                  //                                         fontSize:
                                  //                                             12.0,
                                  //                                       ),
                                  //                                     ),
                                  //                                     Countdown(
                                  //                                       controller:
                                  //                                           _controllerotpWhatsapp,
                                  //                                       seconds:
                                  //                                           duration,
                                  //                                       build: (_,
                                  //                                               double time) =>
                                  //                                           Text(
                                  //                                         formatDuration(
                                  //                                             time.floor()),
                                  //                                         style:
                                  //                                             const TextStyle(
                                  //                                           color:
                                  //                                               Color(0xFF42526D),
                                  //                                           fontWeight:
                                  //                                               FontWeight.w400,
                                  //                                           fontSize:
                                  //                                               11.7,
                                  //                                         ),
                                  //                                       ),
                                  //                                       interval:
                                  //                                           const Duration(milliseconds: 100),
                                  //                                       onFinished:
                                  //                                           () {
                                  //                                         setState(
                                  //                                             () {
                                  //                                           isTimersendsmsviaWhatsAppVisible =
                                  //                                               false;
                                  //                                         });
                                  //                                       },
                                  //                                     ),
                                  //                                   ],
                                  //                                 ),
                                  //                               ),
                                  //                           ],
                                  //                         )
                                  //                       ],
                                  //                     ),
                                  //                 ],
                                  //               ),
                                  //             ),
                                  //           ],
                                  //         )
                                  //       ],
                                  //     ),
                                  //   ),
                                  // ),

                                  Visibility(
                                    visible: currentStep == 1 &&
                                        LocalStateCache().countryCode == '91',
                                    maintainState: true,
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 0),
                                      padding: const EdgeInsets.all(20),
                                      width: 552,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: const Color(0xFFDFE2E6)),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color(0x0D000000),
                                            ),
                                            BoxShadow(
                                              color: Color(0x0D000000),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              const Text(
                                                "Configure OTP settings according to your brand need",
                                                style: TextStyle(
                                                    color: Color(0xFF243757),
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: !Responsive.isMobile(
                                                            context)
                                                        ? 2
                                                        : 1,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Brand Name',
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .bodyMedium!
                                                              .copyWith(
                                                                  color: const Color(
                                                                      0xFF243757),
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                        ),
                                                        ScreenUtil()
                                                            .setVerticalSpacing(
                                                                4),
                                                        BlocListener<
                                                            VerifyBrandNameBloc,
                                                            VerifyBrandNameState>(
                                                          listener:
                                                              (context, state) {
                                                            if (state
                                                                is VerifyAUserUpdateBrandNameStateSuccess) {
                                                              showOverlaySnackbar(
                                                                  context,
                                                                  "Brand name is updated successfully.",
                                                                  Icons
                                                                      .check_circle_outline_outlined,
                                                                  Colors.green);
                                                              context
                                                                  .read<
                                                                      FindByCustomerIdBloc>()
                                                                  .add(
                                                                      const FindByCustomerIdCall());
                                                            }
                                                          },
                                                          child: BlocConsumer<
                                                              WalletBalanceBloc,
                                                              WalletBalanceState>(
                                                            builder: (context,
                                                                walletState_) {
                                                              if (walletState_
                                                                  is WalletBalanceStateSuccess) {
                                                                if (walletState_
                                                                    .walletBalanceEntity!
                                                                    .data!
                                                                    .userPaid!) {}
                                                              }
                                                              return SuperTooltip(
                                                                touchThroughAreaCornerRadius:
                                                                    0,
                                                                barrierColor: Colors
                                                                    .transparent,
                                                                hasShadow:
                                                                    false,
                                                                borderColor: Colors
                                                                    .transparent,
                                                                backgroundColor:
                                                                    const Color
                                                                        .fromARGB(
                                                                        255,
                                                                        6,
                                                                        21,
                                                                        43),
                                                                borderRadius: 4,
                                                                arrowBaseWidth:
                                                                    16,
                                                                arrowLength: 12,
                                                                popupDirection:
                                                                    TooltipDirection
                                                                        .right,
                                                                controller:
                                                                    _controller,
                                                                content:
                                                                    const Text(
                                                                  "Top up credits to enable brand name edit.",
                                                                  softWrap:
                                                                      true,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          13,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400),
                                                                ),
                                                                child:
                                                                    TextFormField(
                                                                  onTapOutside:
                                                                      (event) {
                                                                    FocusManager
                                                                        .instance
                                                                        .primaryFocus
                                                                        ?.unfocus();
                                                                    context
                                                                        .read<
                                                                            VerifyBrandNameBloc>()
                                                                        .add(
                                                                          GetVerifyAUserUpdateBrandNamePressedButton(
                                                                            customerId:
                                                                                LocalStateCache().customerId,
                                                                            brandName:
                                                                                _brandNameController.text,
                                                                            authToken:
                                                                                LocalStateCache().authToken,
                                                                          ),
                                                                        );
                                                                  },
                                                                  onTap:
                                                                      () async {
                                                                    if (walletState_.walletBalanceEntity !=
                                                                            null &&
                                                                        !walletState_
                                                                            .walletBalanceEntity!
                                                                            .data!
                                                                            .userPaid!) {
                                                                      await _controller
                                                                          .showTooltip();
                                                                    } else {
                                                                      await _controller
                                                                          .hideTooltip();
                                                                      MixPanelAnalyticsManager().sendEvent(
                                                                          'Getting_started_edit',
                                                                          'Getting Started edit',
                                                                          null);
                                                                    }
                                                                  },
                                                                  autovalidateMode:
                                                                      AutovalidateMode
                                                                          .onUserInteraction,
                                                                  controller:
                                                                      _brandNameController,
                                                                  enabled: walletState_
                                                                          .walletBalanceEntity
                                                                          ?.data
                                                                          ?.userPaid ??
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          const BorderSide(
                                                                        color: Color(
                                                                            0xFFB3B9C4),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                    disabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          const BorderSide(
                                                                        color: Color(
                                                                            0xFFB3B9C4),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          const BorderSide(
                                                                        color: Color(
                                                                            0xFFB3B9C4),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          const BorderSide(
                                                                        color: Color(
                                                                            0xFFB3B9C4),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          const BorderSide(
                                                                        color: Color(
                                                                            0xFFB3B9C4),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                  obscureText:
                                                                      false,
                                                                  maxLength: 20,
                                                                  inputFormatters: [
                                                                    LengthLimitingTextInputFormatter(
                                                                        20)
                                                                  ],
                                                                  textInputAction:
                                                                      TextInputAction
                                                                          .next,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: const TextStyle(
                                                                      color: Color(
                                                                          0xFF243757),
                                                                      fontSize:
                                                                          14),
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .text,
                                                                  onFieldSubmitted:
                                                                      (value) {
                                                                    _brandNameController
                                                                            .text =
                                                                        value;
                                                                  },
                                                                  onEditingComplete:
                                                                      () {
                                                                    context
                                                                        .read<
                                                                            VerifyBrandNameBloc>()
                                                                        .add(
                                                                          GetVerifyAUserUpdateBrandNamePressedButton(
                                                                            customerId:
                                                                                LocalStateCache().customerId,
                                                                            brandName:
                                                                                _brandNameController.text,
                                                                            authToken:
                                                                                LocalStateCache().authToken,
                                                                          ),
                                                                        );
                                                                  },
                                                                  validator:
                                                                      (value) {
                                                                    if (value!
                                                                            .length >
                                                                        20) {
                                                                      return 'Please enter 20 character only';
                                                                    } else {
                                                                      return null;
                                                                    }
                                                                  },
                                                                ),
                                                              );
                                                            },
                                                            listener: (BuildContext
                                                                    context,
                                                                WalletBalanceState
                                                                    state) {
                                                              if (state
                                                                  is WalletBalanceStateSuccess) {
                                                                if (state.walletBalanceEntity !=
                                                                        null &&
                                                                    state
                                                                        .walletBalanceEntity!
                                                                        .data!
                                                                        .userPaid!) {
                                                                  setState(() {
                                                                    isBrandNameEnable =
                                                                        false;
                                                                  });
                                                                } else {
                                                                  setState(() {
                                                                    isBrandNameEnable =
                                                                        true;
                                                                  });
                                                                }
                                                              }
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(width: 10.0),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Validity time',
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .bodyMedium!
                                                              .copyWith(
                                                                  color: const Color(
                                                                      0xFF243757),
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                        ),
                                                        ScreenUtil()
                                                            .setVerticalSpacing(
                                                                4),
                                                        TextFormField(
                                                          autovalidateMode:
                                                              AutovalidateMode
                                                                  .onUserInteraction,
                                                          controller:
                                                              _validateDurationController,
                                                          decoration:
                                                              InputDecoration(
                                                            suffixIcon:
                                                                const Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 10,
                                                                      right:
                                                                          10),
                                                              child: Text(
                                                                'seconds',
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xFF7A8699)),
                                                              ),
                                                            ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Color(
                                                                    0xFFB3B9C4),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4.0),
                                                            ),
                                                            disabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Color(
                                                                    0xFFB3B9C4),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Color(
                                                                    0xFFB3B9C4),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Color(
                                                                    0xFFB3B9C4),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Color(
                                                                    0xFFB3B9C4),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4.0),
                                                            ),
                                                          ),
                                                          obscureText: false,
                                                          textInputAction:
                                                              TextInputAction
                                                                  .done,
                                                          // textAlign:
                                                          //     TextAlign.left,
                                                          style: const TextStyle(
                                                              color: Color(
                                                                  0xFF243757),
                                                              fontSize: 14),
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          // onFieldSubmitted:
                                                          //     (value) {
                                                          //   _validateDurationController
                                                          //       .text = value;
                                                          // },
                                                          onTapOutside:
                                                              (event) async {
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();
                                                            await otpTImer(
                                                                _validateDurationController
                                                                    .text,
                                                                context);
                                                          },
                                                          validator: (value) {
                                                            if (value!
                                                                .isEmpty) {
                                                              return 'Please enter validity time';
                                                            } else {
                                                              return null;
                                                            }
                                                          },
                                                          onEditingComplete:
                                                              () async {
                                                            await otpTImer(
                                                                _validateDurationController
                                                                    .text,
                                                                context);
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              BlocBuilder<WalletBalanceBloc,
                                                      WalletBalanceState>(
                                                  builder: (context, state) {
                                                if (state
                                                        is WalletBalanceStateSuccess &&
                                                    state.walletBalanceEntity !=
                                                        null) {
                                                  return Visibility(
                                                    visible: !state
                                                        .walletBalanceEntity!
                                                        .data!
                                                        .userPaid!,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .only(
                                                            top: 5,
                                                            bottom: 16,
                                                          ),
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  vertical: 10,
                                                                  horizontal:
                                                                      10),
                                                          decoration: BoxDecoration(
                                                              color: const Color(
                                                                  0xFFCAF2FF),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4)),
                                                          child: Row(
                                                            children: [
                                                              const Icon(
                                                                Icons
                                                                    .info_rounded,
                                                                color: Color(
                                                                    0xFF0F8AB0),
                                                              ),
                                                              Flexible(
                                                                child:
                                                                    Text.rich(
                                                                  TextSpan(
                                                                      text: '',
                                                                      children: <InlineSpan>[
                                                                        TextSpan(
                                                                            text:
                                                                                'Top up credits ',
                                                                            recognizer: TapGestureRecognizer()
                                                                              ..onTap = () async => await showModalBottomSheet(
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
                                                                                  ),
                                                                            style: const TextStyle(
                                                                              decoration: TextDecoration.underline,
                                                                              fontSize: 14,
                                                                              fontWeight: FontWeight.w400,
                                                                              color: Color(0xFF0F8AB0),
                                                                            )),
                                                                        const TextSpan(
                                                                            text:
                                                                                'to enable brand name edit',
                                                                            style: TextStyle(
                                                                                fontSize: 14,
                                                                                overflow: TextOverflow.ellipsis,
                                                                                fontWeight: FontWeight.w400,
                                                                                color: Color(0xFF243757))),
                                                                      ]),
                                                                  style: const TextStyle(
                                                                      color: Color(0xFF0F8AB0),
                                                                      fontSize: 14,
                                                                      // decoration:
                                                                      //     TextDecoration
                                                                      //         .underline,
                                                                      fontWeight: FontWeight.w400),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        ScreenUtil()
                                                            .setVerticalSpacing(
                                                                16),
                                                      ],
                                                    ),
                                                  );
                                                } else {
                                                  return const SizedBox
                                                      .shrink();
                                                }
                                              }),
                                              Text(
                                                'Recipient number',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                      color: const Color(
                                                          0xFF243757),
                                                      fontSize: 14.0,
                                                    ),
                                              ),
                                              ScreenUtil()
                                                  .setVerticalSpacing(4),
                                              TextFormField(
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                controller:
                                                    _recipientNoController,
                                                obscureText: false,
                                                enabled: false,
                                                textInputAction:
                                                    TextInputAction.next,
                                                decoration:
                                                    const InputDecoration(
                                                  fillColor: Color(0xFFF5F6F7),
                                                  filled: true,
                                                  hoverColor: Color(0xFFF5F6F7),
                                                  focusColor: Color(0xFFF5F6F7),
                                                ),
                                                textAlign: TextAlign.left,
                                                style: const TextStyle(
                                                    color: Color(0xFF243757),
                                                    fontSize: 14),
                                                keyboardType:
                                                    TextInputType.text,
                                                onFieldSubmitted: (value) {
                                                  _recipientNoController.text =
                                                      value;
                                                },
                                              ),
                                              ScreenUtil()
                                                  .setVerticalSpacing(16),
                                              BlocListener<VerifyAUserBloc,
                                                  VerifyAUserState>(
                                                listener: (context, state) {
                                                  if (state
                                                          is VerifyAUserStateSuccess &&
                                                      state.verifyAUserEntity
                                                              ?.userData !=
                                                          null) {
                                                    setState(() {
                                                      LocalStateCache()
                                                          .setVerificationId = state
                                                              .verifyAUserEntity
                                                              ?.userData
                                                              ?.verificationId ??
                                                          "";
                                                    });
                                                  }
                                                },
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Row(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .info_outline,
                                                              size: 20,
                                                              color: AppColors
                                                                  .blue90,
                                                            ),
                                                            Flexible(
                                                              child: Text(
                                                                "Our pricing in India is 30 paisa per WhatsApp OTP sent and verified",
                                                                style: TextStyle(
                                                                  fontSize: 11.7,
                                                                  color: Color(
                                                                      0xFF243757),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 8,
                                                        ),
                                                        Visibility(
                                                          visible: true,
                                                          child: ElevatedButton
                                                              .icon(
                                                            icon: const Icon(
                                                              FontAwesomeIcons
                                                                  .whatsapp,
                                                              size: 25,
                                                            ),
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              elevation: 0.1,
                                                              disabledBackgroundColor:
                                                                  const Color(
                                                                      0xFFB1DDC4),
                                                              backgroundColor:
                                                                  const Color(
                                                                      0xff11984A),
                                                              minimumSize: Size(
                                                                  MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      9,
                                                                  52),
                                                            ),
                                                            onPressed:
                                                                isTimersendsmsviaWhatsAppVisible
                                                                    ? null
                                                                    : () {
                                                                        // Check if recipient number is not null and not empty
                                                                        if (_recipientNoController
                                                                            .text
                                                                            .isNotEmpty) {
                                                                          _controllerotpWhatsapp
                                                                              .start();
                                                                          setState(
                                                                              () {
                                                                            isTimersendsmsviaWhatsAppVisible =
                                                                                true;
                                                                            if (currentStep !=
                                                                                3) {
                                                                              currentStep = 2;
                                                                            }
                                                                          });
                                                                          context
                                                                              .read<VerifyAUserBloc>()
                                                                              .add(
                                                                                GetVerifyAUserPressedButton(
                                                                                  flowType: 'WHATSAPP',
                                                                                  customerId: LocalStateCache().customerId,
                                                                                  countryCode: LocalStateCache().countryCode,
                                                                                  mobileNumber: findbyCustomerSate.findByCustomerIdEntity?.data?.phoneNo ?? "",
                                                                                  authToken: LocalStateCache().authToken,
                                                                                ),
                                                                              );
                                                                        } else {
                                                                          // Show error message if recipient number is null or empty
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(
                                                                            SnackBar(
                                                                              content: Text(
                                                                                'Recipient number is required to send OTP.',
                                                                                style: GoogleFonts.getFont(
                                                                                  'Plus Jakarta Sans',
                                                                                  color: FlutterFlowTheme.of(context).whiteColor,
                                                                                  fontSize: 14.0,
                                                                                ),
                                                                              ),
                                                                              duration: const Duration(milliseconds: 2000),
                                                                              backgroundColor: FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                          );
                                                                        }
                                                                        MixPanelAnalyticsManager().sendEvent(
                                                                            'Getting_started_send_otp_via_whatsapp',
                                                                            'Getting Started send otp via WhatsApp',
                                                                            null);
                                                                      },
                                                            label: const Text(
                                                                "Send via WhatsApp"),
                                                          ),
                                                        ),
                                                        if (isTimersendsmsviaWhatsAppVisible)
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 5),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                const Icon(
                                                                  FontAwesomeIcons
                                                                      .circleInfo,
                                                                  color: Color(
                                                                      0xFF7A8699),
                                                                  size: 16,
                                                                ),
                                                                const SizedBox(
                                                                  width: 5,
                                                                ),
                                                                const Text(
                                                                  'Try in ',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0xFF243757),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                                ),
                                                                Countdown(
                                                                  controller:
                                                                      _controllerotpWhatsapp,
                                                                  seconds:
                                                                      duration,
                                                                  build: (_,
                                                                          double
                                                                              time) =>
                                                                      Text(
                                                                    formatDuration(
                                                                        time.floor()),
                                                                    style:
                                                                        const TextStyle(
                                                                      color: Color(
                                                                          0xFF42526D),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          11.7,
                                                                    ),
                                                                  ),
                                                                  interval: const Duration(
                                                                      milliseconds:
                                                                          100),
                                                                  onFinished:
                                                                      () {
                                                                    setState(
                                                                        () {
                                                                      isTimersendsmsviaWhatsAppVisible =
                                                                          false;
                                                                    });
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),

                                  if (currentStep == 2)
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 0),
                                      padding: const EdgeInsets.all(20),
                                      width: 552,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: const Color(0xFFDFE2E6)),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color(0x0D000000),
                                            ),
                                            BoxShadow(
                                              color: Color(0x0D000000),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 16,
                                              ),
                                              Container(
                                                color: const Color(0xFFCAF2FF),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    children: [
                                                      const FaIcon(
                                                        FontAwesomeIcons
                                                            .circleInfo,
                                                        color:
                                                            Color(0xFF0F8AB0),
                                                        size: 20.0,
                                                      ),
                                                      const SizedBox(
                                                          width: 8.0),
                                                      Expanded(
                                                        child: Text(
                                                          'We\'ve sent OTP to the registered number. Please enter it before it expires.',
                                                          style: GoogleFonts
                                                              .getFont(
                                                            'Plus Jakarta Sans',
                                                            color: const Color(
                                                                0xFF243757),
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontSize: 11.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              ScreenUtil()
                                                  .setVerticalSpacing(16),
                                              Text(
                                                'Enter 4 digit OTP',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                      color: const Color(
                                                          0xFF243757),
                                                      fontSize: 14.0,
                                                    ),
                                              ),
                                              ScreenUtil()
                                                  .setVerticalSpacing(4),
                                              TextFormField(
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                controller: _otpController,
                                                obscureText: false,
                                                textInputAction:
                                                    TextInputAction.done,
                                                textAlign: TextAlign.left,
                                                style: const TextStyle(
                                                    color: Color(0xFF243757),
                                                    fontSize: 14),
                                                keyboardType:
                                                    TextInputType.text,
                                                onFieldSubmitted: (value) {
                                                  _otpController.text = value;
                                                },
                                                validator: validateVerifyOtp,
                                              ),
                                              ScreenUtil()
                                                  .setVerticalSpacing(16),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  BlocListener<VerifyAUserBloc,
                                                      VerifyAUserState>(
                                                    listener: (context, state) {
                                                      if (state
                                                              is VerifyAUserOtpVerificationStateSuccess &&
                                                          state.verifyAUserOtpVerificationEntity
                                                                  ?.userData !=
                                                              null) {
                                                        _otpController.clear();
                                                        setState(() {
                                                          currentStep = 3;
                                                          isTimersendsmsVisible =
                                                              false;
                                                          isTimersendsmsviaWhatsAppVisible =
                                                              false;
                                                          _controllerotpSMS
                                                              .pause();
                                                          _controllerotpWhatsapp
                                                              .pause();
                                                        });
                                                        context.read<OtpAnalyticsCubit>().getAnalytics(
                                                            fromDate: DateFormat(
                                                                    "d/M/yyyy")
                                                                .format(DateTime
                                                                    .now()),
                                                            toDate: DateFormat(
                                                                    "d/M/yyyy")
                                                                .format(DateTime
                                                                    .now()));
                                                        context
                                                            .read<
                                                                DashboardBloc>()
                                                            .add(
                                                              GetDashboardOtpEventCall(
                                                                  customerId:
                                                                      LocalStateCache()
                                                                          .customerId,
                                                                  fromDate: DateFormat(
                                                                          "d/M/yyyy")
                                                                      .format(DateTime
                                                                          .now()),
                                                                  toDate: DateFormat(
                                                                          "d/M/yyyy")
                                                                      .format(DateTime
                                                                          .now()),
                                                                  authToken:
                                                                      LocalStateCache()
                                                                          .authToken),
                                                            );

                                                        context
                                                            .read<
                                                                GetUserDetailsBloc>()
                                                            .add(
                                                                const GetUserDetailsCall());

                                                        context
                                                            .read<
                                                                PaymnetHistoryCubit>()
                                                            .getPaymentHistory(
                                                              fromDate: (DateFormat(
                                                                      'dd/MM/yyyy')
                                                                  .format(DateTime
                                                                      .now())),
                                                              toDate: (DateFormat(
                                                                      'dd/MM/yyyy')
                                                                  .format(DateTime
                                                                      .now())),
                                                            );
                                                        context
                                                            .read<
                                                                OtpDetailsReportingCubit>()
                                                            .getDetailsReporting(
                                                              from: (DateFormat(
                                                                      'd/M/yyyy')
                                                                  .format(DateTime
                                                                      .now())),
                                                              to: (DateFormat(
                                                                      'd/M/yyyy')
                                                                  .format(DateTime
                                                                      .now())),
                                                              pageNo: "0",
                                                              size: "10",
                                                            );
                                                      } else if (state
                                                              is VerifyAUserOtpVerificationStateSuccess &&
                                                          state.verifyAUserOtpVerificationEntity!
                                                                  .responseCode ==
                                                              702) {
                                                        showOverlaySnackbar(
                                                            context,
                                                            "Incorrect OTP.",
                                                            Icons
                                                                .info_outline_rounded,
                                                            Colors.red);

                                                        return;
                                                      }
                                                    },
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          elevation: 0.1,
                                                          minimumSize:
                                                              const Size(
                                                                  150, 52),
                                                        ),
                                                        onPressed: () {
                                                          // Check if OTP is not null and not empty
                                                          if (_otpController
                                                              .text
                                                              .isNotEmpty) {
                                                            context
                                                                .read<
                                                                    VerifyAUserBloc>()
                                                                .add(
                                                                  GetVerifyAUserOtpVerificationPressedButton(
                                                                    customerId:
                                                                        LocalStateCache()
                                                                            .customerId,
                                                                    code: _otpController
                                                                        .text,
                                                                    verificationId:
                                                                        LocalStateCache()
                                                                            .verificationId,
                                                                    authToken:
                                                                        LocalStateCache()
                                                                            .authToken,
                                                                  ),
                                                                );
                                                          } else {
                                                            // Show error message if OTP is null or empty
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Please enter the OTP to verify.',
                                                                  style: GoogleFonts
                                                                      .getFont(
                                                                    'Plus Jakarta Sans',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .whiteColor,
                                                                    fontSize:
                                                                        14.0,
                                                                  ),
                                                                ),
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        2000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                              ),
                                                            );
                                                          }
                                                          MixPanelAnalyticsManager()
                                                              .sendEvent(
                                                                  'Getting_started_submit_otp',
                                                                  'Getting Started submit otp',
                                                                  null);
                                                        },
                                                        child: const Text(
                                                            "Submit OTP"),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    _otpController.text = '';
                                                    currentStep = 1;
                                                  });
                                                  MixPanelAnalyticsManager()
                                                      .sendEvent(
                                                          'Getting_started_reset',
                                                          'Getting Started reset',
                                                          null);
                                                },
                                                child: const Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                                  child: Text(
                                                    "Reset Process",
                                                    style: TextStyle(
                                                      color: Colors.blue,
                                                      fontSize: 12.0,
                                                      decoration: TextDecoration
                                                          .underline,
                                                      decorationColor:
                                                          Colors.blue,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  if (currentStep == 3)
                                    Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 0),
                                        padding: const EdgeInsets.all(20),
                                        width: 552,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: const Color(0xFFDFE2E6)),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Color(0x0D000000),
                                              ),
                                              BoxShadow(
                                                color: Color(0x0D000000),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Center(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(10.0,
                                                              10.0, 10.0, 10.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        child: SvgPicture.asset(
                                                          'assets/images/verifiedImage.svg',
                                                          width:
                                                              double.infinity,
                                                          height: 153.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 24,
                                                  ),
                                                  Center(
                                                    child: Container(
                                                      width: 295,
                                                      alignment:
                                                          Alignment.center,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              12),
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xFFDDF3E6),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                      ),
                                                      child: const Column(
                                                        children: [
                                                          Text(
                                                            "Verification Successful",
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: Color(
                                                                    0xFF084B25)),
                                                          ),
                                                          Text(
                                                            "Credit used \$ 0.00375 from your balance",
                                                            style: TextStyle(
                                                                fontSize: 11,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: Color(
                                                                    0xFF084B25)),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 24,
                                                  ),
                                                  SizedBox(
                                                    width: double.infinity,
                                                    child: Center(
                                                      child: Wrap(
                                                        runSpacing: 10,
                                                        spacing: 10,
                                                        crossAxisAlignment:
                                                            WrapCrossAlignment
                                                                .center,
                                                        runAlignment:
                                                            WrapAlignment
                                                                .center,
                                                        children: [
                                                          ElevatedButton(
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              elevation: 0.1,
                                                              backgroundColor:
                                                                  const Color(
                                                                      0xFF11984A),
                                                              minimumSize:
                                                                  const Size(
                                                                      150, 52),
                                                            ),
                                                            onPressed: () {
                                                              setState(() {
                                                                optSent = true;
                                                                optEntered =
                                                                    false;
                                                                verificationStatus =
                                                                    false;
                                                                currentStep = 1;
                                                              });
                                                              MixPanelAnalyticsManager()
                                                                  .sendEvent(
                                                                      'Top_up_balance',
                                                                      'Top up balance',
                                                                      null);
                                                              showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                enableDrag:
                                                                    false,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return Padding(
                                                                    padding: MediaQuery
                                                                        .viewInsetsOf(
                                                                            context),
                                                                    child:
                                                                        const AddCreditWidget(),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                            child: const Text(
                                                                "Top up balance"),
                                                          ),
                                                          OutlinedButton(
                                                            style:
                                                                OutlinedButton
                                                                    .styleFrom(
                                                              elevation: 0.1,
                                                              side:
                                                                  const BorderSide(
                                                                color: Color(
                                                                    0xFF11984A),
                                                              ),
                                                              backgroundColor:
                                                                  Colors.white,
                                                              foregroundColor:
                                                                  const Color(
                                                                      0xFF11984A),
                                                              minimumSize:
                                                                  const Size(
                                                                      150, 52),
                                                            ),
                                                            onPressed: () {
                                                              setState(() {
                                                                optSent = true;
                                                                optEntered =
                                                                    false;
                                                                verificationStatus =
                                                                    false;
                                                                currentStep = 1;
                                                              });
                                                              MixPanelAnalyticsManager()
                                                                  .sendEvent(
                                                                      'Getting_started_try_again',
                                                                      'Getting Started try again',
                                                                      null);
                                                            },
                                                            child: const Text(
                                                                "Try Again"),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 24,
                                                  ),
                                                  Center(
                                                    child: Text.rich(
                                                      TextSpan(
                                                          text:
                                                              'Have a high  OTP volume? ',
                                                          children: <InlineSpan>[
                                                            TextSpan(
                                                                text:
                                                                    'Contact Sales',
                                                                recognizer:
                                                                    TapGestureRecognizer()
                                                                      ..onTap =
                                                                          () async {
                                                                        await launchURL(
                                                                            "https://www.messagecentral.com/talk-to-expert");
                                                                        MixPanelAnalyticsManager().sendEvent(
                                                                            'Verify_now_talk-to-expert',
                                                                            'Verify_now_talk-to-expert',
                                                                            null);
                                                                      },
                                                                style:
                                                                    const TextStyle(
                                                                  decorationColor:
                                                                      Color(
                                                                          0xFF0F8AB0),
                                                                  decoration:
                                                                      TextDecoration
                                                                          .underline,
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Color(
                                                                      0xFF0F8AB0),
                                                                )),
                                                          ]),
                                                      style: const TextStyle(
                                                          color:
                                                              Color(0xFF42526D),
                                                          fontSize: 14,
                                                          // decoration:
                                                          //     TextDecoration
                                                          //         .underline,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ])),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  //
                  if (Responsive.isMobile(context))
                    Container(
                      color: const Color(0xFFDFE2E6),
                      child: Container(
                        alignment: Alignment.topLeft,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: const Color(0xFFDFE2E6)),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x0D000000),
                              ),
                              BoxShadow(
                                color: Color(0x0D000000),
                              )
                            ],
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(
                                    left: 16, right: 16, top: 16),
                                child: Text(
                                  "Resources",
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Color(0xFF243757),
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(16),
                                margin: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    color: const Color(0xFFFFFFFF),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: const Color(0xFFDFE2E6))),
                                child: InkWell(
                                  onTap: () async {
                                    await launchURL(LocalStateCache()
                                                .countryCode ==
                                            "91"
                                        ? 'https://www.youtube.com/watch?v=bRnaH7fD374'
                                        : "https://www.youtube.com/watch?v=Z_vhlcnQ8VA");
                                    MixPanelAnalyticsManager().sendEvent(
                                        'Resources_Integration_Video',
                                        'Resources Integration Video',
                                        null);
                                  },
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              ImagePath.videoRectangle),
                                          const SizedBox(
                                            width: 6,
                                          ),
                                          const Flexible(
                                            child: Text(
                                              "Integration Video",
                                              softWrap: true,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Color(0xFF243757),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          SvgPicture.asset(
                                            ImagePath.arrowRight,
                                            height: 15,
                                            width: 20,
                                            color: const Color(0xFF42526D),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Stack(
                                            children: [
                                              Image.asset(
                                                  ImagePath.videoGuidesmall),
                                              const Positioned.fill(
                                                  child: Icon(
                                                Icons.play_arrow_rounded,
                                                color: Colors.white,
                                                size: 60,
                                              ))
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Flexible(
                                              child: Text(
                                            "🔐 Learn how to authenticate users with SMS OTP APIs using Message Central in NodeJS, Python, Java, PHP, Ruby, and C#!",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFF42526D)),
                                          ))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(16),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                decoration: BoxDecoration(
                                    color: const Color(0xFFFFFFFF),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: const Color(0xFFDFE2E6))),
                                child: InkWell(
                                  onTap: () async {
                                    await launchApiDocUrl();
                                    MixPanelAnalyticsManager().sendEvent(
                                        'Resources_API_Documentation',
                                        'Resources API Documentation',
                                        null);
                                  },
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(ImagePath.api),
                                          const SizedBox(
                                            width: 6,
                                          ),
                                          const Flexible(
                                            child: Text(
                                              "API Documentation",
                                              softWrap: true,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Color(0xFF243757),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          SvgPicture.asset(
                                            ImagePath.arrowRight,
                                            height: 15,
                                            width: 20,
                                            color: const Color(0xFF42526D),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        "Authenticate users with OTP SMS APIs in multiple languages including NodeJS, Python, Java, PHP, Ruby and C#.",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFF42526D)),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Container(
                                padding: const EdgeInsets.all(16),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                decoration: BoxDecoration(
                                    color: const Color(0xFFFFFFFF),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: const Color(0xFFDFE2E6))),
                                child: InkWell(
                                  onTap: () async {
                                    await launchURL(
                                        'https://cpaas-bucket.s3.ap-south-1.amazonaws.com/Verify_Now_User_Guide.pdf');
                                    MixPanelAnalyticsManager().sendEvent(
                                        'Resources_Verify_Now_User_Guide',
                                        'Resources Verify Now User Guide',
                                        null);
                                  },
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(ImagePath.bookopen),
                                          const SizedBox(
                                            width: 6,
                                          ),
                                          const Text(
                                            "User Guide",
                                            softWrap: true,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Color(0xFF243757),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          SvgPicture.asset(
                                            ImagePath.arrowRight,
                                            height: 15,
                                            width: 20,
                                            color: const Color(0xFF42526D),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        "FAQs solutions to common issues, providing instructions to resolve all your queries.",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFF42526D)),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              if (LocalStateCache().countryCode == "91")
                                Container(
                                  padding: const EdgeInsets.all(16),
                                  margin: const EdgeInsets.only(
                                      left: 16, right: 16, bottom: 16),
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFFFFFFF),
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: const Color(0xFFDFE2E6))),
                                  child: InkWell(
                                    onTap: () async {
                                      // MixPanelAnalyticsManager().sendEvent(
                                      //     'Resources_Verify_Now_User_Guide',
                                      //     'Resources Verify Now User Guide',
                                      //     null);
                                      context.goNamed('VerifyUser');
                                    },
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(
                                              FontAwesomeIcons.sms,
                                              color: AppColors.blue80,
                                            ),
                                            const SizedBox(
                                              width: 6,
                                            ),
                                            const Text(
                                              "Explore SMS OTP",
                                              softWrap: true,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Color(0xFF243757),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            SvgPicture.asset(
                                              ImagePath.arrowRight,
                                              height: 15,
                                              width: 20,
                                              color: const Color(0xFF42526D),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text(
                                          "Authenticate users with our WhatsApp OTP without having any Facebook Business Manager account.",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xFF42526D)),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                            ]),
                      ),
                    )
                ],
              ),
            ),
            if (Responsive.isDesktop(context))
              Expanded(
                flex: 1,
                child: Container(
                  height: double.infinity,
                  color: const Color(0xFFDFE2E6),
                  padding: const EdgeInsets.all(30),
                  child: Container(
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: const Color(0xFFDFE2E6)),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x0D000000),
                          ),
                          BoxShadow(
                            color: Color(0x0D000000),
                          )
                        ],
                        borderRadius: BorderRadius.circular(8)),
                    child: ListView(children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                        child: Text(
                          "Resources",
                          style: TextStyle(
                              fontSize: 17,
                              color: Color(0xFF243757),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: const Color(0xFFDFE2E6))),
                        child: InkWell(
                          onTap: () async {
                            await launchURL(LocalStateCache().countryCode ==
                                    "91"
                                ? 'https://www.youtube.com/watch?v=bRnaH7fD374'
                                : "https://www.youtube.com/watch?v=Z_vhlcnQ8VA");
                            MixPanelAnalyticsManager().sendEvent(
                                'Resources_Integration_Video',
                                'Resources Integration Video',
                                null);
                          },
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(ImagePath.videoRectangle),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  const Flexible(
                                    child: Text(
                                      "Integration Video",
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Color(0xFF243757),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  SvgPicture.asset(
                                    ImagePath.arrowRight,
                                    height: 15,
                                    width: 20,
                                    color: const Color(0xFF42526D),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Image.asset(ImagePath.videoGuidesmall),
                                      const Positioned.fill(
                                          child: Icon(
                                        Icons.play_arrow_rounded,
                                        color: Colors.white,
                                        size: 60,
                                      ))
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Flexible(
                                      child: Text(
                                    "🔐 Learn how to authenticate users with SMS OTP APIs using Message Central in NodeJS, Python, Java & PHP",
                                    style: TextStyle(
                                        fontSize: 12, color: Color(0xFF42526D)),
                                  ))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: const Color(0xFFDFE2E6))),
                        child: InkWell(
                          onTap: () async {
                            await launchApiDocUrl();
                            MixPanelAnalyticsManager().sendEvent(
                                'Resources_API_Documentation',
                                'Resources API Documentation',
                                null);
                          },
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(ImagePath.api),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  const Text(
                                    "API Documentation",
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Color(0xFF243757),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  SvgPicture.asset(
                                    ImagePath.arrowRight,
                                    height: 15,
                                    width: 20,
                                    color: const Color(0xFF42526D),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Authenticate users with OTP SMS APIs in multiple languages including NodeJS, Python, Java, PHP, Ruby and C#.",
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xFF42526D)),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: const Color(0xFFDFE2E6))),
                        child: InkWell(
                          onTap: () async {
                            await launchURL(
                                'https://cpaas-bucket.s3.ap-south-1.amazonaws.com/Verify_Now_User_Guide.pdf');
                            MixPanelAnalyticsManager().sendEvent(
                                'Resources_Verify_Now_User_Guide',
                                'Resources Verify Now User Guide',
                                null);
                          },
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(ImagePath.bookopen),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  const Text(
                                    "User Guide",
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Color(0xFF243757),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  SvgPicture.asset(
                                    ImagePath.arrowRight,
                                    height: 15,
                                    width: 20,
                                    color: const Color(0xFF42526D),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "FAQs solutions to common issues, providing instructions to resolve all your queries.",
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xFF42526D)),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      if (LocalStateCache().countryCode == "91")
                        Container(
                          padding: const EdgeInsets.all(16),
                          margin: const EdgeInsets.only(
                              left: 16, right: 16, bottom: 16),
                          decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(8),
                              border:
                                  Border.all(color: const Color(0xFFDFE2E6))),
                          child: InkWell(
                            onTap: () async {
                              // MixPanelAnalyticsManager().sendEvent(
                              //     'Resources_Verify_Now_User_Guide',
                              //     'Resources Verify Now User Guide',
                              //     null);
                              context.goNamed('VerifyUser');
                            },
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      FontAwesomeIcons.sms,
                                      color: AppColors.blue80,
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    const Text(
                                      "Explore SMS OTP",
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Color(0xFF243757),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    SvgPicture.asset(
                                      ImagePath.arrowRight,
                                      height: 15,
                                      width: 20,
                                      color: const Color(0xFF42526D),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "Authenticate users with our WhatsApp OTP without having any Facebook Business Manager account.",
                                  style: TextStyle(
                                      fontSize: 12, color: Color(0xFF42526D)),
                                )
                              ],
                            ),
                          ),
                        ),
                    ]),
                  ),
                ),
              )
          ],
        );
      },
      listener: (BuildContext context, FindByCustomerIdState state) {
        if (state is FindByCustomerIdStateSuccess &&
            state.findByCustomerIdEntity != null) {
          setState(() {
            _brandNameController.text =
                state.findByCustomerIdEntity?.data?.brandName ??
                    "Message Central";
          });
          _recipientNoController.text =
              state.findByCustomerIdEntity?.data?.phoneCode != null
                  ? "+"
                      "${state.findByCustomerIdEntity?.data?.phoneCode ?? ""} "
                      "${state.findByCustomerIdEntity?.data?.phoneNo ?? ""}"
                  : state.findByCustomerIdEntity?.data?.phoneNo ?? "";
        }
      },
    );
  }
}
