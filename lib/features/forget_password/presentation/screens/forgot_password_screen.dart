import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:messagecentral/core/constants/image_path.dart';
import 'package:messagecentral/core/global_widgets/flutter_timer.dart';
import 'package:messagecentral/core/global_widgets/global_widgets.dart';
import 'package:messagecentral/core/utils/app_environment.dart';
import 'package:messagecentral/core/utils/extention_util.dart';
import 'package:messagecentral/core/utils/local_state_cache.dart';
import 'package:messagecentral/core/utils/mix_pannel.dart';
import 'package:messagecentral/core/utils/responsive.dart';
import 'package:messagecentral/core/utils/responsive_layout.dart';
import 'package:messagecentral/core/utils/validator.dart';
import 'package:messagecentral/features/forget_password/presentation/screens/bloc/forget_password_bloc.dart';
import 'package:messagecentral/features/forget_password/presentation/screens/bloc/forget_password_event.dart';
import 'package:messagecentral/features/forget_password/presentation/screens/bloc/forget_password_otp_bloc.dart';
import 'package:messagecentral/features/forget_password/presentation/screens/bloc/forget_password_otp_event.dart';
import 'package:messagecentral/features/forget_password/presentation/screens/bloc/forget_password_otp_state.dart';
import 'package:messagecentral/features/forget_password/presentation/screens/bloc/forget_password_state.dart';
import 'package:messagecentral/features/forget_password/presentation/screens/widgets/confirm_password_widget.dart';
import 'package:messagecentral/features/forget_password/presentation/screens/widgets/email_verify_widget.dart';
import 'package:messagecentral/features/forget_password/presentation/screens/widgets/otp_verify_widget.dart';
import 'package:messagecentral/features/signup/presentation/bloc/resend_otp_bloc.dart';
import 'package:messagecentral/features/signup/presentation/bloc/resend_otp_event.dart';
import 'package:messagecentral/features/signup/presentation/bloc/resend_otp_state.dart';

import 'package:stop_watch_timer/stop_watch_timer.dart';

import 'widgets/password_updated_widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({
    super.key,
  });

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen>
    with Validator {
  final unfocusNode = FocusNode();

  final formKey = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _otpController = TextEditingController();

  int timerMilliseconds = 60000;
  String timerValue = StopWatchTimer.getDisplayTime(
    60000,
    hours: false,
    milliSecond: false,
  );
  StopWatchTimer timerController =
      StopWatchTimer(mode: StopWatchMode.countDown);
  final TextEditingController confirmPasswordController =
      TextEditingController();
  @override
  void initState() {
    super.initState();
    email = '';
    authToken = '';
    verificationId = '';
  }

  bool enableResendOtp = false;
  String verificationId = '';
  String authToken = '';
  String email = '';
  bool isvisibleEmailOtp = true;
  bool isVisibleCOnfirmPassword = false;
  bool isVisibleUpdate = false;
  bool requestAlreadyExsit = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Visibility(
        visible: true,
        replacement: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                    ))
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.5,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        decoration: const BoxDecoration(
                          color: Color(0xFF215196),
                        ),
                        child: Image.asset(
                          ImagePath.imgLogin,
                          width: MediaQuery.sizeOf(context).width * 0.5,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          50.0, 50.0, 50.0, 50.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            ImagePath.brandlogo,
                            width: 251.0,
                            height: 64.0.h,
                            fit: BoxFit.contain,
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 32.0, 0.0, 2.0),
                            child: Text("Reset your password",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 21,
                                        color: const Color(0xFF091E42))),
                          ),
                          ScreenUtil().setVerticalSpacing(32),
                          // email
                          Visibility(
                              visible: requestAlreadyExsit,
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 16),
                                padding:
                                    const EdgeInsets.only(left: 8, right: 4),
                                decoration: BoxDecoration(
                                    color: const Color(0xFFFCD3D0),
                                    borderRadius: BorderRadius.circular(4.0)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Request already exists try again...",
                                      style: TextStyle(
                                          color: Color(0xFFC13A31),
                                          fontSize: 12.0),
                                    ),
                                    IconButton(
                                      splashRadius: 10,
                                      onPressed: () {
                                        setState(() {
                                          requestAlreadyExsit = false;
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.clear,
                                        color: Color(0xFF42526D),
                                        size: 20.0,
                                      ),
                                    )
                                  ],
                                ),
                              )),
                          BlocListener<ForgetPasswordBloc,
                              ForgetPasswordState>(
                            listener: (context, state) {
                              if (state is ForgetPasswordStateEmailSuccess) {
                                setState(() {
                                  verificationId = context
                                      .read<ForgetPasswordBloc>()
                                      .state
                                      .forgetEmailEntity!
                                      .data!
                                      .verificationId!;
                                  isvisibleEmailOtp = false;
    
                                  _emailController.clear();
                                  _otpController.clear();
                                });
                              }
                            },
                            child: Visibility(
                              visible: isvisibleEmailOtp,
                              child: Form(
                                key: formKey,
                                child: EmailVerifyWidget(
                                  onFieldSubmitted: (p0) {
                                    _emailController.text = p0;
                                  },
                                  emailController: _emailController,
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      context.read<ForgetPasswordBloc>().add(
                                          GetForgetPasswordEmailPressedButton(
                                              email: _emailController.text));
    
                                      if (!requestAlreadyExsit) {
                                        timerController.onExecute
                                            .add(StopWatchExecute.start);
                                      }
    
                                      // _otpController.clear();
                                      setState(() {
                                        email = _emailController.text;
    
                                        // isvisibleEmailOtp = false;
                                      });
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                          BlocListener<ForgetPasswordBloc,
                              ForgetPasswordState>(
                            listener: (context, state) {
                              if (state is ForgetPasswordStateEmailSuccess &&
                                  state.forgetEmailEntity!.responseCode ==
                                      506) {
                                setState(() {
                                  requestAlreadyExsit = true;
                                  enableResendOtp = true;
                                });
                              } else if (state
                                  is ForgetPasswordStateEmailSuccess) {
                                setState(() {
                                  verificationId = context
                                      .read<ForgetPasswordBloc>()
                                      .state
                                      .forgetEmailEntity!
                                      .data!
                                      .verificationId!;
                                });
                              }
                            },
                            child: Visibility(
                                visible: isvisibleEmailOtp == false &&
                                    isVisibleCOnfirmPassword == false &&
                                    isVisibleUpdate == false,
                                child: Form(
                                  key: formKey2,
                                  child: OtpVerifyWidget(
                                    otpController: _otpController,
                                    onFieldSubmitted: (p0) {
                                      _otpController.text = p0;
                                    },
                                    onPressed: () {
                                      if (formKey2.currentState!.validate()) {
                                        context.read<ForgetPasswordOtpBloc>().add(
                                            GetForgetPasswordOTpPressedButton(
                                                email: _emailController.text,
                                                code: _otpController.text,
                                                verificationId:
                                                    verificationId));
                                        _otpController.clear();
                                        _emailController.clear();
    
                                        setState(() {
                                          requestAlreadyExsit = false;
                                          isVisibleCOnfirmPassword = true;
                                        });
                                      }
                                    },
                                    otpTimerChild: Visibility(
                                      visible: enableResendOtp,
                                      replacement: !enableResendOtp
                                          ? Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                const Text(
                                                  'Resend in ',
                                                  style: TextStyle(
                                                    color: Color(0xFF243757),
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 12.0,
                                                  ),
                                                ),
                                                FlutterTimer(
                                                  initialTime:
                                                      timerMilliseconds,
                                                  getDisplayTime: (value) =>
                                                      StopWatchTimer
                                                          .getDisplayTime(
                                                    value,
                                                    hours: false,
                                                    milliSecond: false,
                                                  ),
                                                  timer: timerController,
                                                  updateStateInterval:
                                                      const Duration(
                                                          milliseconds: 1000),
                                                  onChanged: (value,
                                                      displayTime,
                                                      shouldUpdate) {
                                                    timerMilliseconds = value;
                                                    timerValue = displayTime;
    
                                                    if (shouldUpdate) {
                                                      setState(() {});
                                                    }
                                                  },
                                                  onEnded: () async {
                                                    timerController.onExecute
                                                        .add(StopWatchExecute
                                                            .reset);
                                                    setState(() {
                                                      enableResendOtp = true;
                                                    });
                                                  },
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    color: Color(0xFF243757),
                                                    fontWeight:
                                                        FontWeight.bold,
                                                    fontSize: 12.0,
                                                  ),
                                                ),
                                                const Text(
                                                  's',
                                                  style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            )
                                          : const SizedBox.shrink(),
                                      child: BlocListener<ResendOtpBloc,
                                          ResendOtpState>(
                                        listener: (context, state) {
                                          if (state
                                                  is ResendOtpStateSuccess &&
                                              state.resendOtpEntity
                                                      ?.userData !=
                                                  null) {
                                            setState(() {
                                              verificationId = state
                                                      .resendOtpEntity
                                                      ?.userData
                                                      ?.verificationId ??
                                                  "";
                                              enableResendOtp = false;
                                              requestAlreadyExsit = false;
                                            });
                                          }
                                          if (state
                                                  is ResendOtpStateSuccess &&
                                              state.resendOtpEntity
                                                      ?.responseCode ==
                                                  506) {
                                            setState(() {
                                              requestAlreadyExsit = true;
                                              enableResendOtp = true;
                                            });
                                          }
                                        },
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: InkWell(
                                            onTap: () {
                                              context.read<ResendOtpBloc>().add(
                                                  GetResendOtpPressedButton(
                                                      email: _emailController
                                                          .text
                                                          .trim(),
                                                      phoneNo: "",
                                                      phoneCode: ""));
                                              setState(() {
                                                timerController.onExecute.add(
                                                    StopWatchExecute.start);
                                              });
                                            },
                                            child: const Text(
                                              "Resend OTP",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFF20A4CD),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                          ),
                          BlocListener<ForgetPasswordOtpBloc,
                                  ForgetPasswordOtpState>(
                              listener: (context, state) {
                                setState(() {
                                  authToken = state
                                          .forgetOtpEntity?.data?.authToken ??
                                      "";
                                });
                              },
                              child: Visibility(
                                  visible: isVisibleCOnfirmPassword,
                                  child: BlocListener<ForgetPasswordBloc,
                                      ForgetPasswordState>(
                                    listener: (context, state) {
                                      if (state
                                              is ConfirmPasswordStateSuccess &&
                                          state.confirmPasswordEntity?.data !=
                                              null) {
                                        setState(() {
                                          isVisibleCOnfirmPassword = false;
                                          isVisibleUpdate = true;
                                        });
                                      }
                                    },
                                    child: ConfrimPasswordWidget(
                                      formKey: formKey3,
                                      onFieldSubmitted: (p0) {
                                        confirmPasswordController.text = p0;
                                      },
                                      confirmPasswordController:
                                          confirmPasswordController,
                                      onTap: () {
                                        context.read<ForgetPasswordBloc>().add(
                                            GetConfirmPasswordPressedButton(
                                                authToken: authToken,
                                                email: email,
                                                newPassword:
                                                    confirmPasswordController
                                                        .text
                                                        .base64Function(
                                                            confirmPasswordController
                                                                .text)));
    
                                        MixPanelAnalyticsManager().sendEvent(
                                            "reset_password_confirm",
                                            "Reset password Confirm",
                                            null);
                                      },
                                    ),
                                  ))),
                          Visibility(
                              visible: isVisibleUpdate,
                              child: const PasswordUpdatedWidget()),
                          ScreenUtil().setVerticalSpacing(16),
                        ],
                      ),
                    )),
                  ],
                )
              ],
            ),
          ),
        ),
        child: const ForgetPasswordBlurScreen(),
      ),
    );
  }
}

class ForgetPasswordBlurScreen extends StatefulWidget {
  const ForgetPasswordBlurScreen({super.key});

  @override
  State<ForgetPasswordBlurScreen> createState() =>
      _ForgetPasswordBlurScreenState();
}

class _ForgetPasswordBlurScreenState extends State<ForgetPasswordBlurScreen>
    with Validator {
  final unfocusNode = FocusNode();

  final formKey = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _otpController = TextEditingController();

  int timerMilliseconds = 60000;
  String timerValue = StopWatchTimer.getDisplayTime(
    60000,
    hours: false,
    milliSecond: false,
  );
  StopWatchTimer timerController =
      StopWatchTimer(mode: StopWatchMode.countDown);
  final TextEditingController confirmPasswordController =
      TextEditingController();
  @override
  void initState() {
    super.initState();
    email = '';
    authToken = '';
    verificationId = '';
  }

  bool enableResendOtp = false;
  String verificationId = '';
  String authToken = '';
  String email = '';
  bool isvisibleEmailOtp = true;
  bool isVisibleCOnfirmPassword = false;
  bool isVisibleUpdate = false;
  bool requestAlreadyExsit = false;
  bool emailNotFound = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Responsive(
          mobile: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(50.0, 50.0, 50.0, 50.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    ImagePath.brandlogo,
                    width: 251.0,
                    height: 64.0.h,
                    fit: BoxFit.contain,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 32.0, 0.0, 2.0),
                    child: Text("Reset your password",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 21,
                                color: const Color(0xFF091E42))),
                  ),
                  ScreenUtil().setVerticalSpacing(32),
                  // email
                  Visibility(
                      visible: requestAlreadyExsit,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        padding: const EdgeInsets.only(left: 8, right: 4),
                        decoration: BoxDecoration(
                            color: const Color(0xFFFCD3D0),
                            borderRadius: BorderRadius.circular(4.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Request already exists try again...",
                              style: TextStyle(
                                  color: Color(0xFFC13A31), fontSize: 12.0),
                            ),
                            IconButton(
                              splashRadius: 10,
                              onPressed: () {
                                setState(() {
                                  requestAlreadyExsit = false;
                                });
                              },
                              icon: const Icon(
                                Icons.clear,
                                color: Color(0xFF42526D),
                                size: 20.0,
                              ),
                            )
                          ],
                        ),
                      )),
                  Visibility(
                      visible: emailNotFound,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        padding: const EdgeInsets.only(left: 8, right: 4),
                        decoration: BoxDecoration(
                            color: const Color(0xFFFCD3D0),
                            borderRadius: BorderRadius.circular(4.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Email does not exists",
                              style: TextStyle(
                                  color: Color(0xFFC13A31), fontSize: 12.0),
                            ),
                            IconButton(
                              splashRadius: 10,
                              onPressed: () {
                                setState(() {
                                  emailNotFound = false;
                                });
                              },
                              icon: const Icon(
                                Icons.clear,
                                color: Color(0xFF42526D),
                                size: 20.0,
                              ),
                            )
                          ],
                        ),
                      )),

                  BlocConsumer<ForgetPasswordBloc, ForgetPasswordState>(
                    builder: (context, state) => Visibility(
                      visible: isvisibleEmailOtp,
                      child: Form(
                        key: formKey,
                        child: EmailVerifyWidget(
                          state: state,
                          onFieldSubmitted: (p0) {
                            _emailController.text = p0;
                          },
                          emailController: _emailController,
                          onPressed: (state is ForgetPasswordStateLoading)
                              ? null
                              : () {
                                  if (formKey.currentState!.validate()) {
                                    context.read<ForgetPasswordBloc>().add(
                                        GetForgetPasswordEmailPressedButton(
                                            email: _emailController.text));

                                    if (!requestAlreadyExsit) {
                                      timerController.onExecute
                                          .add(StopWatchExecute.start);
                                    }

                                    MixPanelAnalyticsManager().sendEvent(
                                        "email_confirm_CTA",
                                        "Email Confirm CTA", {
                                      'environment': FlavorConfig.instance!.env,
                                      'userName': LocalStateCache().fName,
                                      'email': _emailController.text,
                                      'countryCode':
                                          LocalStateCache().countryCode,
                                      'mobileNumber': LocalStateCache().phoneNo,
                                      'customerID':
                                          LocalStateCache().customerId,
                                      'displayName': "Email Confirm CTA"
                                    });

                                    _otpController.clear();
                                    setState(() {
                                      email = _emailController.text;
                                      emailNotFound = false;
                                    });
                                  }
                                },
                        ),
                      ),
                    ),
                    listener: (context, state) {
                      if (state is ForgetPasswordStateEmailSuccess &&
                          state.forgetEmailEntity?.data != null) {
                        setState(() {
                          verificationId = context
                              .read<ForgetPasswordBloc>()
                              .state
                              .forgetEmailEntity!
                              .data!
                              .verificationId!;
                          isvisibleEmailOtp = false;
                          _otpController.clear();
                        });
                      } else if (state is ForgetPasswordStateEmailSuccess &&
                          state.forgetEmailEntity?.responseCode == 404) {
                        setState(() {
                          emailNotFound = true;
                        });
                      }
                    },
                  ),
                  BlocListener<ForgetPasswordBloc, ForgetPasswordState>(
                    listener: (context, state) {
                      if (state is ForgetPasswordStateEmailSuccess &&
                          state.forgetEmailEntity!.responseCode == 506) {
                        setState(() {
                          requestAlreadyExsit = true;
                          enableResendOtp = true;
                        });
                      } else if (state is ForgetPasswordStateEmailSuccess &&
                          state.forgetEmailEntity?.data != null) {
                        setState(() {
                          verificationId = context
                              .read<ForgetPasswordBloc>()
                              .state
                              .forgetEmailEntity!
                              .data!
                              .verificationId!;
                        });
                      }
                    },
                    child: Visibility(
                        visible: isvisibleEmailOtp == false &&
                            isVisibleCOnfirmPassword == false &&
                            isVisibleUpdate == false,
                        child: BlocConsumer<ForgetPasswordOtpBloc,
                            ForgetPasswordOtpState>(listener: (context, state) {
                          if (state is ForgetPasswordStateOtpSuccess) {
                            setState(() {
                              isVisibleCOnfirmPassword = true;
                              _otpController.clear();
                              _emailController.clear();
                            });
                          }
                        }, builder: (context, state_) {
                          return Form(
                            key: formKey2,
                            child: OtpVerifyWidget(
                              state: state_,
                              otpController: _otpController,
                              onFieldSubmitted: (p0) {
                                _otpController.text = p0;
                              },
                              onPressed: () {
                                if (formKey2.currentState!.validate()) {
                                  context.read<ForgetPasswordOtpBloc>().add(
                                      GetForgetPasswordOTpPressedButton(
                                          email: _emailController.text,
                                          code: _otpController.text,
                                          verificationId: verificationId));

                                  setState(() {
                                    requestAlreadyExsit = false;
                                  });
                                }
                              },
                              otpTimerChild: Visibility(
                                visible: enableResendOtp,
                                replacement: !enableResendOtp
                                    ? Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          const Text(
                                            'Resend in ',
                                            style: TextStyle(
                                              color: Color(0xFF243757),
                                              fontWeight: FontWeight.normal,
                                              fontSize: 12.0,
                                            ),
                                          ),
                                          FlutterTimer(
                                            initialTime: timerMilliseconds,
                                            getDisplayTime: (value) =>
                                                StopWatchTimer.getDisplayTime(
                                              value,
                                              hours: false,
                                              milliSecond: false,
                                            ),
                                            timer: timerController,
                                            updateStateInterval: const Duration(
                                                milliseconds: 1000),
                                            onChanged: (value, displayTime,
                                                shouldUpdate) {
                                              timerMilliseconds = value;
                                              timerValue = displayTime;

                                              if (shouldUpdate) {
                                                setState(() {});
                                              }
                                            },
                                            onEnded: () async {
                                              timerController.onExecute
                                                  .add(StopWatchExecute.reset);
                                              setState(() {
                                                enableResendOtp = true;
                                              });
                                            },
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              color: Color(0xFF243757),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12.0,
                                            ),
                                          ),
                                          const Text(
                                            's',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      )
                                    : const SizedBox.shrink(),
                                child:
                                    BlocListener<ResendOtpBloc, ResendOtpState>(
                                  listener: (context, state) {
                                    if (state is ResendOtpStateSuccess &&
                                        state.resendOtpEntity?.userData !=
                                            null) {
                                      setState(() {
                                        verificationId = state.resendOtpEntity
                                                ?.userData?.verificationId ??
                                            "";
                                        enableResendOtp = false;
                                        requestAlreadyExsit = false;
                                      });
                                    }
                                    if (state is ResendOtpStateSuccess &&
                                        state.resendOtpEntity?.responseCode ==
                                            506) {
                                      setState(() {
                                        requestAlreadyExsit = true;
                                        enableResendOtp = true;
                                      });
                                    }
                                  },
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: InkWell(
                                      onTap: () {
                                        context.read<ResendOtpBloc>().add(
                                            GetResendOtpPressedButton(
                                                email: _emailController.text
                                                    .trim(),
                                                phoneNo: "",
                                                phoneCode: ""));
                                        setState(() {
                                          timerController.onExecute
                                              .add(StopWatchExecute.start);
                                        });
                                      },
                                      child: const Text(
                                        "Resend OTP",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFF20A4CD),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        })),
                  ),
                  BlocListener<ForgetPasswordOtpBloc, ForgetPasswordOtpState>(
                      listener: (context, state) {
                        setState(() {
                          authToken =
                              state.forgetOtpEntity?.data?.authToken ?? "";
                        });
                      },
                      child: Visibility(
                          visible: isVisibleCOnfirmPassword,
                          child: BlocConsumer<ForgetPasswordBloc,
                              ForgetPasswordState>(
                            builder: (context, _) => ConfrimPasswordWidget(
                              formKey: formKey3,
                              state: _,
                              onFieldSubmitted: (p0) {
                                confirmPasswordController.text = p0;
                              },
                              confirmPasswordController:
                                  confirmPasswordController,
                              onTap: () {
                                context.read<ForgetPasswordBloc>().add(
                                    GetConfirmPasswordPressedButton(
                                        authToken: authToken,
                                        email: email,
                                        newPassword: confirmPasswordController
                                            .text
                                            .base64Function(
                                                confirmPasswordController
                                                    .text)));

                                MixPanelAnalyticsManager().sendEvent(
                                    "reset_password_confirm",
                                    "Reset password Confirm",
                                    null);
                              },
                            ),
                            listener: (context, state) {
                              if (state is ConfirmPasswordStateSuccess &&
                                  state.confirmPasswordEntity?.data != null) {
                                setState(() {
                                  isVisibleCOnfirmPassword = false;
                                  isVisibleUpdate = true;
                                });
                              }
                            },
                          ))),
                  Visibility(
                      visible: isVisibleUpdate,
                      child: const PasswordUpdatedWidget()),
                  ScreenUtil().setVerticalSpacing(16),
                ],
              ),
            ),
          ),
          tablet: Stack(
            alignment: Alignment.center,
            fit: StackFit.passthrough,
            children: [
              GlobalWidgets.blurContainer(),
              Positioned(
                top: 33,
                bottom: 33,
                child: Container(
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 0.8,
                        ),
                      ]),
                  width: 150.w,
                  height: 150.w,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          50.0, 50.0, 50.0, 50.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            ImagePath.brandlogo,
                            width: 251.0,
                            height: 64.0.h,
                            fit: BoxFit.contain,
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 32.0, 0.0, 2.0),
                            child: Text("Reset your password",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 21,
                                        color: const Color(0xFF091E42))),
                          ),
                          ScreenUtil().setVerticalSpacing(32),
                          // email
                          Visibility(
                              visible: requestAlreadyExsit,
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 16),
                                padding:
                                    const EdgeInsets.only(left: 8, right: 4),
                                decoration: BoxDecoration(
                                    color: const Color(0xFFFCD3D0),
                                    borderRadius: BorderRadius.circular(4.0)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Request already exists try again...",
                                      style: TextStyle(
                                          color: Color(0xFFC13A31),
                                          fontSize: 12.0),
                                    ),
                                    IconButton(
                                      splashRadius: 10,
                                      onPressed: () {
                                        setState(() {
                                          requestAlreadyExsit = false;
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.clear,
                                        color: Color(0xFF42526D),
                                        size: 20.0,
                                      ),
                                    )
                                  ],
                                ),
                              )),
                          Visibility(
                              visible: emailNotFound,
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 16),
                                padding:
                                    const EdgeInsets.only(left: 8, right: 4),
                                decoration: BoxDecoration(
                                    color: const Color(0xFFFCD3D0),
                                    borderRadius: BorderRadius.circular(4.0)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Email does not exists",
                                      style: TextStyle(
                                          color: Color(0xFFC13A31),
                                          fontSize: 12.0),
                                    ),
                                    IconButton(
                                      splashRadius: 10,
                                      onPressed: () {
                                        setState(() {
                                          emailNotFound = false;
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.clear,
                                        color: Color(0xFF42526D),
                                        size: 20.0,
                                      ),
                                    )
                                  ],
                                ),
                              )),

                          BlocListener<ForgetPasswordBloc, ForgetPasswordState>(
                            listener: (context, state) {
                              if (state is ForgetPasswordStateEmailSuccess &&
                                  state.forgetEmailEntity?.data != null) {
                                setState(() {
                                  verificationId = context
                                      .read<ForgetPasswordBloc>()
                                      .state
                                      .forgetEmailEntity!
                                      .data!
                                      .verificationId!;
                                  isvisibleEmailOtp = false;
                                  _otpController.clear();
                                });
                              } else if (state
                                      is ForgetPasswordStateEmailSuccess &&
                                  state.forgetEmailEntity!.responseCode ==
                                      404) {
                                setState(() {
                                  emailNotFound = true;
                                });
                              }
                            },
                            child: Visibility(
                              visible: isvisibleEmailOtp,
                              child: BlocBuilder<ForgetPasswordBloc,
                                      ForgetPasswordState>(
                                  builder: (context, state_) {
                                return Form(
                                  key: formKey,
                                  child: EmailVerifyWidget(
                                    state: state_,
                                    onFieldSubmitted: (p0) {
                                      _emailController.text = p0;
                                    },
                                    emailController: _emailController,
                                    onPressed: state_ ==
                                            const ForgetPasswordStateLoading()
                                        ? null
                                        : () {
                                            if (formKey.currentState!
                                                .validate()) {
                                              context
                                                  .read<ForgetPasswordBloc>()
                                                  .add(
                                                      GetForgetPasswordEmailPressedButton(
                                                          email:
                                                              _emailController
                                                                  .text));
                                              MixPanelAnalyticsManager()
                                                  .sendEvent(
                                                      "email_confirm_CTA",
                                                      "Email Confirm CTA", {
                                                'environment':
                                                    FlavorConfig.instance!.env,
                                                'userName':
                                                    LocalStateCache().fName,
                                                'email': _emailController.text,
                                                'countryCode': LocalStateCache()
                                                    .countryCode,
                                                'mobileNumber':
                                                    LocalStateCache().phoneNo,
                                                'customerID': LocalStateCache()
                                                    .customerId,
                                                'displayName':
                                                    "Email Confirm CTA"
                                              });
                                              if (!requestAlreadyExsit) {
                                                timerController.onExecute.add(
                                                    StopWatchExecute.start);
                                              }

                                              _otpController.clear();
                                              setState(() {
                                                email = _emailController.text;
                                                emailNotFound = false;
                                              });
                                            }
                                          },
                                  ),
                                );
                              }),
                            ),
                          ),
                          BlocListener<ForgetPasswordBloc, ForgetPasswordState>(
                            listener: (context, state) {
                              if (state is ForgetPasswordStateEmailSuccess &&
                                  state.forgetEmailEntity!.responseCode ==
                                      506) {
                                setState(() {
                                  requestAlreadyExsit = true;
                                  enableResendOtp = true;
                                });
                              } else if (state
                                      is ForgetPasswordStateEmailSuccess &&
                                  state.forgetEmailEntity?.data != null) {
                                setState(() {
                                  verificationId = context
                                      .read<ForgetPasswordBloc>()
                                      .state
                                      .forgetEmailEntity!
                                      .data!
                                      .verificationId!;
                                });
                              }
                            },
                            child: Visibility(
                                visible: isvisibleEmailOtp == false &&
                                    isVisibleCOnfirmPassword == false &&
                                    isVisibleUpdate == false,
                                child: BlocConsumer<ForgetPasswordOtpBloc,
                                        ForgetPasswordOtpState>(
                                    listener: (context, state) {
                                  if (state is ForgetPasswordStateOtpSuccess) {
                                    setState(() {
                                      isVisibleCOnfirmPassword = true;
                                      _otpController.clear();
                                      _emailController.clear();
                                    });
                                  }
                                }, builder: (context, state2) {
                                  return Form(
                                    key: formKey2,
                                    child: OtpVerifyWidget(
                                      state: state2,
                                      otpController: _otpController,
                                      onFieldSubmitted: (p0) {
                                        _otpController.text = p0;
                                      },
                                      onPressed: () {
                                        if (formKey2.currentState!.validate()) {
                                          context.read<ForgetPasswordOtpBloc>().add(
                                              GetForgetPasswordOTpPressedButton(
                                                  email: _emailController.text,
                                                  code: _otpController.text,
                                                  verificationId:
                                                      verificationId));

                                          _otpController.clear();
                                          _emailController.clear();

                                          setState(() {
                                            requestAlreadyExsit = false;
                                            isVisibleCOnfirmPassword = true;
                                          });
                                        }
                                      },
                                      otpTimerChild: Visibility(
                                        visible: enableResendOtp,
                                        replacement: !enableResendOtp
                                            ? Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  const Text(
                                                    'Resend in ',
                                                    style: TextStyle(
                                                      color: Color(0xFF243757),
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 12.0,
                                                    ),
                                                  ),
                                                  FlutterTimer(
                                                    initialTime:
                                                        timerMilliseconds,
                                                    getDisplayTime: (value) =>
                                                        StopWatchTimer
                                                            .getDisplayTime(
                                                      value,
                                                      hours: false,
                                                      milliSecond: false,
                                                    ),
                                                    timer: timerController,
                                                    updateStateInterval:
                                                        const Duration(
                                                            milliseconds: 1000),
                                                    onChanged: (value,
                                                        displayTime,
                                                        shouldUpdate) {
                                                      timerMilliseconds = value;
                                                      timerValue = displayTime;

                                                      if (shouldUpdate) {
                                                        setState(() {});
                                                      }
                                                    },
                                                    onEnded: () async {
                                                      timerController.onExecute
                                                          .add(StopWatchExecute
                                                              .reset);
                                                      setState(() {
                                                        enableResendOtp = true;
                                                      });
                                                    },
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                      color: Color(0xFF243757),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12.0,
                                                    ),
                                                  ),
                                                  const Text(
                                                    's',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            : const SizedBox.shrink(),
                                        child: BlocListener<ResendOtpBloc,
                                            ResendOtpState>(
                                          listener: (context, state) {
                                            if (state
                                                    is ResendOtpStateSuccess &&
                                                state.resendOtpEntity
                                                        ?.userData !=
                                                    null) {
                                              setState(() {
                                                verificationId = state
                                                        .resendOtpEntity
                                                        ?.userData
                                                        ?.verificationId ??
                                                    "";
                                                enableResendOtp = false;
                                                requestAlreadyExsit = false;
                                              });
                                            }
                                            if (state
                                                    is ResendOtpStateSuccess &&
                                                state.resendOtpEntity
                                                        ?.responseCode ==
                                                    506) {
                                              setState(() {
                                                requestAlreadyExsit = true;
                                                enableResendOtp = true;
                                              });
                                            }
                                          },
                                          child: Align(
                                            alignment: Alignment.topRight,
                                            child: InkWell(
                                              onTap: () {
                                                context.read<ResendOtpBloc>().add(
                                                    GetResendOtpPressedButton(
                                                        email: _emailController
                                                            .text
                                                            .trim(),
                                                        phoneNo: "",
                                                        phoneCode: ""));
                                                setState(() {
                                                  timerController.onExecute.add(
                                                      StopWatchExecute.start);
                                                });
                                              },
                                              child: const Text(
                                                "Resend OTP",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xFF20A4CD),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                })),
                          ),
                          BlocListener<ForgetPasswordOtpBloc,
                                  ForgetPasswordOtpState>(
                              listener: (context, state) {
                                setState(() {
                                  authToken =
                                      state.forgetOtpEntity?.data?.authToken ??
                                          "";
                                });
                              },
                              child: Visibility(
                                  visible: isVisibleCOnfirmPassword,
                                  child: BlocConsumer<ForgetPasswordBloc,
                                      ForgetPasswordState>(
                                    builder: (context, state3) =>
                                        ConfrimPasswordWidget(
                                      formKey: formKey3,
                                      state: state3,
                                      onFieldSubmitted: (p0) {
                                        confirmPasswordController.text = p0;
                                      },
                                      confirmPasswordController:
                                          confirmPasswordController,
                                      onTap: () {
                                        context.read<ForgetPasswordBloc>().add(
                                            GetConfirmPasswordPressedButton(
                                                authToken: authToken,
                                                email: email,
                                                newPassword:
                                                    confirmPasswordController
                                                        .text
                                                        .base64Function(
                                                            confirmPasswordController
                                                                .text)));

                                        MixPanelAnalyticsManager().sendEvent(
                                            "reset_password_confirm",
                                            "Reset password Confirm",
                                            null);
                                      },
                                    ),
                                    listener: (context, state) {
                                      if (state
                                              is ConfirmPasswordStateSuccess &&
                                          state.confirmPasswordEntity?.data !=
                                              null) {
                                        setState(() {
                                          isVisibleCOnfirmPassword = false;
                                          isVisibleUpdate = true;
                                        });
                                      }
                                    },
                                  ))),
                          Visibility(
                              visible: isVisibleUpdate,
                              child: const PasswordUpdatedWidget()),
                          ScreenUtil().setVerticalSpacing(16),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          desktop: Stack(
            alignment: Alignment.center,
            fit: StackFit.passthrough,
            children: [
              GlobalWidgets.blurContainer(),
              Positioned(
                top: 33,
                bottom: 33,
                child: Container(
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 0.8,
                        ),
                      ]),
                  width: 150.w,
                  height: 150.w,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          50.0, 50.0, 50.0, 50.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            ImagePath.brandlogo,
                            width: 251.0,
                            height: 64.0.h,
                            fit: BoxFit.contain,
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 32.0, 0.0, 2.0),
                            child: Text("Reset your password",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 21,
                                        color: const Color(0xFF091E42))),
                          ),
                          ScreenUtil().setVerticalSpacing(32),
                          // email
                          Visibility(
                              visible: requestAlreadyExsit,
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 16),
                                padding:
                                    const EdgeInsets.only(left: 8, right: 4),
                                decoration: BoxDecoration(
                                    color: const Color(0xFFFCD3D0),
                                    borderRadius: BorderRadius.circular(4.0)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Request already exists try again...",
                                      style: TextStyle(
                                          color: Color(0xFFC13A31),
                                          fontSize: 12.0),
                                    ),
                                    IconButton(
                                      splashRadius: 10,
                                      onPressed: () {
                                        setState(() {
                                          requestAlreadyExsit = false;
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.clear,
                                        color: Color(0xFF42526D),
                                        size: 20.0,
                                      ),
                                    )
                                  ],
                                ),
                              )),

                          Visibility(
                              visible: emailNotFound,
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 16),
                                padding:
                                    const EdgeInsets.only(left: 8, right: 4),
                                decoration: BoxDecoration(
                                    color: const Color(0xFFFCD3D0),
                                    borderRadius: BorderRadius.circular(4.0)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Email does not exists",
                                      style: TextStyle(
                                          color: Color(0xFFC13A31),
                                          fontSize: 12.0),
                                    ),
                                    IconButton(
                                      splashRadius: 10,
                                      onPressed: () {
                                        setState(() {
                                          emailNotFound = false;
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.clear,
                                        color: Color(0xFF42526D),
                                        size: 20.0,
                                      ),
                                    )
                                  ],
                                ),
                              )),

                          BlocListener<ForgetPasswordBloc, ForgetPasswordState>(
                            listener: (context, state) {
                              if (state is ForgetPasswordStateEmailSuccess &&
                                  state.forgetEmailEntity?.data != null) {
                                setState(() {
                                  verificationId = context
                                      .read<ForgetPasswordBloc>()
                                      .state
                                      .forgetEmailEntity!
                                      .data!
                                      .verificationId!;
                                  isvisibleEmailOtp = false;
                                  _otpController.clear();
                                });
                              } else if (state
                                      is ForgetPasswordStateEmailSuccess &&
                                  state.forgetEmailEntity!.responseCode ==
                                      404) {
                                setState(() {
                                  emailNotFound = true;
                                });
                              }
                            },
                            child: Visibility(
                              visible: isvisibleEmailOtp,
                              child: BlocBuilder<ForgetPasswordBloc,
                                      ForgetPasswordState>(
                                  builder: (context, state) {
                                return Form(
                                  key: formKey,
                                  child: EmailVerifyWidget(
                                    state: state,
                                    onFieldSubmitted: (p0) {
                                      _emailController.text = p0;
                                    },
                                    emailController: _emailController,
                                    onPressed: state ==
                                            const ForgetPasswordStateLoading()
                                        ? null
                                        : () {
                                            if (formKey.currentState!
                                                .validate()) {
                                              context
                                                  .read<ForgetPasswordBloc>()
                                                  .add(
                                                      GetForgetPasswordEmailPressedButton(
                                                          email:
                                                              _emailController
                                                                  .text));
                                              MixPanelAnalyticsManager()
                                                  .sendEvent(
                                                      "email_confirm_CTA",
                                                      "Email Confirm CTA", {
                                                'environment':
                                                    FlavorConfig.instance!.env,
                                                'userName':
                                                    LocalStateCache().fName,
                                                'email': _emailController.text,
                                                'countryCode': LocalStateCache()
                                                    .countryCode,
                                                'mobileNumber':
                                                    LocalStateCache().phoneNo,
                                                'customerID': LocalStateCache()
                                                    .customerId,
                                                'displayName':
                                                    "Email Confirm CTA"
                                              });
                                              if (!requestAlreadyExsit) {
                                                timerController.onExecute.add(
                                                    StopWatchExecute.start);
                                              }

                                              setState(() {
                                                email = _emailController.text;
                                                emailNotFound = false;
                                              });
                                            }
                                          },
                                  ),
                                );
                              }),
                            ),
                          ),
                          BlocListener<ForgetPasswordBloc, ForgetPasswordState>(
                            listener: (context, state) {
                              if (state is ForgetPasswordStateEmailSuccess &&
                                  state.forgetEmailEntity!.responseCode ==
                                      506) {
                                setState(() {
                                  requestAlreadyExsit = true;
                                  enableResendOtp = true;
                                });
                              } else if (state
                                      is ForgetPasswordStateEmailSuccess &&
                                  state.forgetEmailEntity?.data != null) {
                                setState(() {
                                  verificationId = context
                                      .read<ForgetPasswordBloc>()
                                      .state
                                      .forgetEmailEntity!
                                      .data!
                                      .verificationId!;
                                });
                              }
                            },
                            child: Visibility(
                                visible: isvisibleEmailOtp == false &&
                                    isVisibleCOnfirmPassword == false &&
                                    isVisibleUpdate == false,
                                child: BlocConsumer<ForgetPasswordOtpBloc,
                                        ForgetPasswordOtpState>(
                                    listener: (context, state) {
                                  if (state is ForgetPasswordStateOtpSuccess) {
                                    setState(() {
                                      isVisibleCOnfirmPassword = true;
                                      _otpController.clear();
                                      _emailController.clear();
                                    });
                                  }
                                }, builder: (context, state2) {
                                  return Form(
                                    key: formKey2,
                                    child: OtpVerifyWidget(
                                      state: state2,
                                      otpController: _otpController,
                                      onFieldSubmitted: (p0) {
                                        _otpController.text = p0;
                                      },
                                      onPressed: () {
                                        if (formKey2.currentState!.validate()) {
                                          context.read<ForgetPasswordOtpBloc>().add(
                                              GetForgetPasswordOTpPressedButton(
                                                  email: _emailController.text,
                                                  code: _otpController.text,
                                                  verificationId:
                                                      verificationId));

                                          setState(() {
                                            requestAlreadyExsit = false;
                                          });
                                        }
                                      },
                                      otpTimerChild: Visibility(
                                        visible: enableResendOtp,
                                        replacement: !enableResendOtp
                                            ? Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  const Text(
                                                    'Resend in ',
                                                    style: TextStyle(
                                                      color: Color(0xFF243757),
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 12.0,
                                                    ),
                                                  ),
                                                  FlutterTimer(
                                                    initialTime:
                                                        timerMilliseconds,
                                                    getDisplayTime: (value) =>
                                                        StopWatchTimer
                                                            .getDisplayTime(
                                                      value,
                                                      hours: false,
                                                      milliSecond: false,
                                                    ),
                                                    timer: timerController,
                                                    updateStateInterval:
                                                        const Duration(
                                                            milliseconds: 1000),
                                                    onChanged: (value,
                                                        displayTime,
                                                        shouldUpdate) {
                                                      timerMilliseconds = value;
                                                      timerValue = displayTime;

                                                      if (shouldUpdate) {
                                                        setState(() {});
                                                      }
                                                    },
                                                    onEnded: () async {
                                                      timerController.onExecute
                                                          .add(StopWatchExecute
                                                              .reset);
                                                      setState(() {
                                                        enableResendOtp = true;
                                                      });
                                                    },
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                      color: Color(0xFF243757),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12.0,
                                                    ),
                                                  ),
                                                  const Text(
                                                    's',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            : const SizedBox.shrink(),
                                        child: BlocListener<ResendOtpBloc,
                                            ResendOtpState>(
                                          listener: (context, state) {
                                            if (state
                                                    is ResendOtpStateSuccess &&
                                                state.resendOtpEntity
                                                        ?.userData !=
                                                    null) {
                                              setState(() {
                                                verificationId = state
                                                        .resendOtpEntity
                                                        ?.userData
                                                        ?.verificationId ??
                                                    "";
                                                enableResendOtp = false;
                                                requestAlreadyExsit = false;
                                              });
                                            }
                                            if (state
                                                    is ResendOtpStateSuccess &&
                                                state.resendOtpEntity
                                                        ?.responseCode ==
                                                    506) {
                                              setState(() {
                                                requestAlreadyExsit = true;
                                                enableResendOtp = true;
                                              });
                                            }
                                          },
                                          child: Align(
                                            alignment: Alignment.topRight,
                                            child: InkWell(
                                              onTap: () {
                                                context.read<ResendOtpBloc>().add(
                                                    GetResendOtpPressedButton(
                                                        email: _emailController
                                                            .text
                                                            .trim(),
                                                        phoneNo: "",
                                                        phoneCode: ""));
                                                setState(() {
                                                  timerController.onExecute.add(
                                                      StopWatchExecute.start);
                                                });
                                              },
                                              child: const Text(
                                                "Resend OTP",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xFF20A4CD),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                })),
                          ),
                          BlocListener<ForgetPasswordOtpBloc,
                                  ForgetPasswordOtpState>(
                              listener: (context, state) {
                                setState(() {
                                  authToken =
                                      state.forgetOtpEntity?.data?.authToken ??
                                          "";
                                });
                              },
                              child: Visibility(
                                  visible: isVisibleCOnfirmPassword,
                                  child: BlocConsumer<ForgetPasswordBloc,
                                      ForgetPasswordState>(
                                    builder: (context, state3) =>
                                        ConfrimPasswordWidget(
                                      formKey: formKey3,
                                      state: state3,
                                      onFieldSubmitted: (p0) {
                                        confirmPasswordController.text = p0;
                                      },
                                      confirmPasswordController:
                                          confirmPasswordController,
                                      onTap: () {
                                        context.read<ForgetPasswordBloc>().add(
                                            GetConfirmPasswordPressedButton(
                                                authToken: authToken,
                                                email: email,
                                                newPassword:
                                                    confirmPasswordController
                                                        .text
                                                        .base64Function(
                                                            confirmPasswordController
                                                                .text)));

                                        MixPanelAnalyticsManager().sendEvent(
                                            "reset_password_confirm",
                                            "Reset password Confirm",
                                            null);
                                      },
                                    ),
                                    listener: (context, state) {
                                      if (state
                                              is ConfirmPasswordStateSuccess &&
                                          state.confirmPasswordEntity?.data !=
                                              null) {
                                        setState(() {
                                          isVisibleCOnfirmPassword = false;
                                          isVisibleUpdate = true;
                                        });
                                      }
                                    },
                                  ))),
                          Visibility(
                              visible: isVisibleUpdate,
                              child: const PasswordUpdatedWidget()),
                          ScreenUtil().setVerticalSpacing(16),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
