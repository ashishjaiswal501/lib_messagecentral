import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messagecentral/core/global_widgets/global_widgets.dart';
import 'package:messagecentral/core/utils/firebase_analytics_functions.dart';
import 'package:messagecentral/core/utils/flutter_flow_theme.dart';
import 'package:messagecentral/core/utils/local_state_cache.dart';
import 'package:messagecentral/core/utils/mix_pannel.dart';
import 'package:messagecentral/core/utils/responsive.dart';

import 'package:messagecentral/core/utils/responsive_layout.dart';
import 'package:messagecentral/core/utils/validator.dart';
import 'package:messagecentral/features/login/presentation/bloc/login_bloc.dart';
import 'package:messagecentral/features/login/presentation/bloc/login_state.dart';
import 'package:messagecentral/features/signup/presentation/bloc/signup_bloc.dart';
import 'package:messagecentral/features/signup/presentation/bloc/signup_state.dart';
import 'package:messagecentral/features/signup/presentation/screens/widgets/brand_logo_title_signup.dart';
import 'package:messagecentral/features/signup/presentation/screens/widgets/sign_up_info_widget.dart';
import 'package:messagecentral/features/signup/presentation/screens/widgets/signup_account_details.dart';
import 'package:messagecentral/features/signup/presentation/screens/widgets/signup_otp_details.dart';

class SignupScreen extends StatefulWidget {
  // ignore: use_super_parameters
  final String authToken;
  final String customerId;
  final bool isInitialStepSignup;
  final String emailId;
  const SignupScreen(
      {super.key,
      this.authToken = '',
      this.customerId = '',
      this.isInitialStepSignup = false,
      this.emailId = ''});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> with Validator {
  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  bool isSignupSuccess = false;
  String customerId = "";
  String authToken = "";
  String otpVerificationId = "";
  @override
  void initState() {
    super.initState();
    MixPanelAnalyticsManager()
        .sendEvent('signup_account_landing', 'Sign up account landing', null);
    setScreenFirebase('signup_account_landing', 'Sign up account landing');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Visibility(
        visible: true,
        replacement: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is LoginStateSuccess) {
              final valueotp =
                  state.loginEntity!.userData!.accountStatus == "Active";

              isSignupSuccess = valueotp == false ? true : false;
            }
            return SafeArea(
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
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: MediaQuery.of(context).size.height * 1.0,
                            decoration: const BoxDecoration(
                              color: Color(0xFF215196),
                            ),
                            child: const SignupSideScreen(),
                          ),
                        Expanded(
                          child: Form(
                            key: formKey,
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                50.0,
                                50.0,
                                50.0,
                                50.0,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const BrandLogoTtitle(),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                      0.0,
                                      12.0,
                                      0.0,
                                      32.0,
                                    ),
                                    child: Wrap(
                                      spacing: 12.0,
                                      runSpacing: 12.0,
                                      alignment: WrapAlignment.start,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      direction: Axis.horizontal,
                                      runAlignment: WrapAlignment.start,
                                      verticalDirection: VerticalDirection.down,
                                      clipBehavior: Clip.none,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            if (!isSignupSuccess)
                                              Container(
                                                width: 36.0,
                                                height: 36.0,
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFF11984A),
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color:
                                                        const Color(0xFF11984A),
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                    0.00,
                                                    0.00,
                                                  ),
                                                  child: Text(
                                                    '1',
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts.getFont(
                                                      'Plus Jakarta Sans',
                                                      color: Colors.white,
                                                      fontSize: 20.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            if (isSignupSuccess)
                                              const FaIcon(
                                                // ignore: deprecated_member_use
                                                FontAwesomeIcons.checkCircle,
                                                color: Color(0xFF11984A),
                                                size: 36.0,
                                              ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      12.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'Account Details',
                                                style: GoogleFonts.getFont(
                                                  'Plus Jakarta Sans',
                                                  color: !isSignupSuccess
                                                      ? const Color(0xFF0E7E3E)
                                                      : const Color(0xFF42526D),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14.0,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Icon(
                                          Icons.keyboard_arrow_right,
                                          color: Color(0xFF5D6B82),
                                          size: 24.0,
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              width: 36.0,
                                              height: 36.0,
                                              decoration: BoxDecoration(
                                                color: isSignupSuccess
                                                    ? const Color(0xFF11984A)
                                                    : const Color(0xFFFFFFFF),
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: isSignupSuccess
                                                      ? const Color(0xFF11984A)
                                                      : const Color(0xFF98A1B0),
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Align(
                                                alignment:
                                                    const AlignmentDirectional(
                                                        0.00, 0.00),
                                                child: Text(
                                                  '2',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: isSignupSuccess
                                                        ? const Color(
                                                            0xFFFFFFFF)
                                                        : const Color(
                                                            0xFF98A1B0),
                                                    fontSize: 20.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      12.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'Mobile Number',
                                                style: GoogleFonts.getFont(
                                                  'Plus Jakarta Sans',
                                                  color: isSignupSuccess
                                                      ? const Color(0xFF0E7E3E)
                                                      : const Color(0xFF42526D),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14.0,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Visibility(
                                    visible: !isSignupSuccess,
                                    child:
                                        BlocListener<SignupBloc, SignupState>(
                                            listener: (context, state) {
                                              if (state is SignupStateSuccess &&
                                                  state.signupEntity!
                                                          .responseCode !=
                                                      409) {
                                                setState(() {
                                                  isSignupSuccess = true;
                                                });
                                              }
                                            },
                                            child: SignupAccountDetails(
                                              emailid: widget.emailId,
                                            )),
                                  ),

                                  Visibility(
                                    visible: isSignupSuccess,
                                    child: BlocBuilder<SignupBloc, SignupState>(
                                        builder: (context, state) {
                                      if (state is SignupStateSuccess &&
                                          state.signupEntity!.responseCode !=
                                              409) {
                                        return SignupOtpDetails(
                                          onTap: () {
                                            setState(() {
                                              isSignupSuccess = false;
                                            });
                                          },
                                          authToken: state.signupEntity!
                                              .userData!.tempToken!,
                                          customId: state.signupEntity!
                                              .userData!.customerId!,
                                        );
                                      } else {
                                        if (!LocalStateCache()
                                            .isVerificationOtp) {
                                          return SignupOtpDetails(
                                            onTap: () {
                                              // setState(() {
                                              //   isSignupSuccess = false;
                                              // });
                                            },
                                            authToken: widget.authToken,
                                            customId: widget.customerId,
                                          );
                                        } else {
                                          return const SizedBox.shrink();
                                        }
                                      }
                                    }),
                                  )

                                  //
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        child: SignupblurScreen(
          authToken: widget.authToken,
          customerId: widget.customerId,
          emailId: widget.emailId,
          isInitialStepSignup: widget.isInitialStepSignup,
        ),
      ),
    );
  }
}

class SignupblurScreen extends StatefulWidget {
  final String authToken;
  final String customerId;
  final bool isInitialStepSignup;
  final String emailId;
  const SignupblurScreen(
      {super.key,
      this.authToken = '',
      this.customerId = '',
      this.isInitialStepSignup = false,
      this.emailId = ''});

  @override
  State<SignupblurScreen> createState() => _SignupblurScreenState();
}

class _SignupblurScreenState extends State<SignupblurScreen> with Validator {
  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  bool isSignupSuccess = false;
  String customerId = "";
  String authToken = "";
  String otpVerificationId = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Responsive(
        mobile: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is LoginStateSuccess &&
                state.loginEntity!.responseCode == 200 &&
                widget.isInitialStepSignup) {
              final valueotp =
                  state.loginEntity!.userData!.accountStatus == "Active";

              isSignupSuccess = valueotp == false ? true : false;
            } else if (state is LoginStateSuccess &&
                state.loginEntity!.responseCode == 204 &&
                widget.isInitialStepSignup) {
              isSignupSuccess = true;
            }
            return SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                    50.0,
                    50.0,
                    50.0,
                    50.0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BrandLogoTtitle(),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0,
                          12.0,
                          0.0,
                          32.0,
                        ),
                        child: Wrap(
                          spacing: 12.0,
                          runSpacing: 12.0,
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          direction: Axis.horizontal,
                          runAlignment: WrapAlignment.start,
                          verticalDirection: VerticalDirection.down,
                          clipBehavior: Clip.none,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (!isSignupSuccess)
                                  Container(
                                    width: 36.0,
                                    height: 36.0,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF11984A),
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: const Color(0xFF11984A),
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Align(
                                      alignment: const AlignmentDirectional(
                                        0.00,
                                        0.00,
                                      ),
                                      child: Text(
                                        '1',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.getFont(
                                          'Plus Jakarta Sans',
                                          color: Colors.white,
                                          fontSize: 20.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                if (isSignupSuccess)
                                  const FaIcon(
                                    // ignore: deprecated_member_use
                                    FontAwesomeIcons.checkCircle,
                                    color: Color(0xFF11984A),
                                    size: 36.0,
                                  ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Account Details',
                                    style: GoogleFonts.getFont(
                                      'Plus Jakarta Sans',
                                      color: !isSignupSuccess
                                          ? const Color(0xFF0E7E3E)
                                          : const Color(0xFF42526D),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.keyboard_arrow_right,
                              color: Color(0xFF5D6B82),
                              size: 24.0,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 36.0,
                                  height: 36.0,
                                  decoration: BoxDecoration(
                                    color: isSignupSuccess
                                        ? const Color(0xFF11984A)
                                        : const Color(0xFFFFFFFF),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: isSignupSuccess
                                          ? const Color(0xFF11984A)
                                          : const Color(0xFF98A1B0),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Align(
                                    alignment:
                                        const AlignmentDirectional(0.00, 0.00),
                                    child: Text(
                                      '2',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: isSignupSuccess
                                            ? const Color(0xFFFFFFFF)
                                            : const Color(0xFF98A1B0),
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Mobile Number',
                                    style: GoogleFonts.getFont(
                                      'Plus Jakarta Sans',
                                      color: isSignupSuccess
                                          ? const Color(0xFF0E7E3E)
                                          : const Color(0xFF42526D),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: isSignupSuccess == false ? true : false,
                        child: BlocListener<SignupBloc, SignupState>(
                            listener: (context, state) {
                              if (state is SignupStateSuccess &&
                                  state.signupEntity!.responseCode != 409) {
                                setState(() {
                                  isSignupSuccess = true;
                                });
                              }
                            },
                            child: SignupAccountDetails(
                              emailid: widget.emailId,
                            )),
                      ),

                      Visibility(
                        visible: isSignupSuccess,
                        child: BlocBuilder<SignupBloc, SignupState>(
                            builder: (context, state) {
                          if (state is SignupStateSuccess &&
                              state.signupEntity!.responseCode != 409) {
                            return SignupOtpDetails(
                              onTap: () {
                                setState(() {
                                  isSignupSuccess = false;
                                });
                              },
                              authToken:
                                  state.signupEntity!.userData!.tempToken!,
                              customId:
                                  state.signupEntity!.userData!.customerId!,
                            );
                          } else {
                            if (!LocalStateCache().isVerificationOtp) {
                              return SignupOtpDetails(
                                onTap: () {
                                  // setState(() {
                                  //   isSignupSuccess = false;
                                  // });
                                },
                                authToken: widget.authToken,
                                customId: widget.customerId,
                              );
                            } else {
                              return const SizedBox.shrink();
                            }
                          }
                        }),
                      )

                      //
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        tablet: Stack(
          alignment: Alignment.center,
          fit: StackFit.passthrough,
          children: [
            GlobalWidgets.blurContainer(),
            Positioned(
              top: 33,
              bottom: 33,
              child: BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if (state is LoginStateSuccess &&
                      state.loginEntity!.responseCode == 200 &&
                      widget.isInitialStepSignup) {
                    final valueotp =
                        state.loginEntity!.userData!.accountStatus == "Active";

                    isSignupSuccess = valueotp == false ? true : false;
                  } else if (state is LoginStateSuccess &&
                      state.loginEntity!.responseCode == 204 &&
                      widget.isInitialStepSignup) {
                    isSignupSuccess = true;
                  } else if (state is LoginStateSuccess &&
                      state.loginEntity!.responseCode == 506) {
                    isSignupSuccess = true;
                  }
                  return Container(
                    width: 150.w,
                    height: 150.w,
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
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                            50.0,
                            50.0,
                            50.0,
                            50.0,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const BrandLogoTtitle(),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0,
                                  12.0,
                                  0.0,
                                  32.0,
                                ),
                                child: Wrap(
                                  spacing: 12.0,
                                  runSpacing: 12.0,
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  direction: Axis.horizontal,
                                  runAlignment: WrapAlignment.start,
                                  verticalDirection: VerticalDirection.down,
                                  clipBehavior: Clip.none,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        if (!isSignupSuccess)
                                          Container(
                                            width: 36.0,
                                            height: 36.0,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF11984A),
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: const Color(0xFF11984A),
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Align(
                                              alignment:
                                                  const AlignmentDirectional(
                                                0.00,
                                                0.00,
                                              ),
                                              child: Text(
                                                '1',
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.getFont(
                                                  'Plus Jakarta Sans',
                                                  color: Colors.white,
                                                  fontSize: 20.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        if (isSignupSuccess)
                                          const FaIcon(
                                            // ignore: deprecated_member_use
                                            FontAwesomeIcons.checkCircle,
                                            color: Color(0xFF11984A),
                                            size: 36.0,
                                          ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(12.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Account Details',
                                            style: GoogleFonts.getFont(
                                              'Plus Jakarta Sans',
                                              color: !isSignupSuccess
                                                  ? const Color(0xFF0E7E3E)
                                                  : const Color(0xFF42526D),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Icon(
                                      Icons.keyboard_arrow_right,
                                      color: Color(0xFF5D6B82),
                                      size: 24.0,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          width: 36.0,
                                          height: 36.0,
                                          decoration: BoxDecoration(
                                            color: isSignupSuccess
                                                ? const Color(0xFF11984A)
                                                : const Color(0xFFFFFFFF),
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: isSignupSuccess
                                                  ? const Color(0xFF11984A)
                                                  : const Color(0xFF98A1B0),
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(
                                                    0.00, 0.00),
                                            child: Text(
                                              '2',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: isSignupSuccess
                                                    ? const Color(0xFFFFFFFF)
                                                    : const Color(0xFF98A1B0),
                                                fontSize: 20.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(12.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Mobile Number',
                                            style: GoogleFonts.getFont(
                                              'Plus Jakarta Sans',
                                              color: isSignupSuccess
                                                  ? const Color(0xFF0E7E3E)
                                                  : const Color(0xFF42526D),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Visibility(
                                visible:
                                    isSignupSuccess == false ? true : false,
                                child: BlocListener<SignupBloc, SignupState>(
                                    listener: (context, state) {
                                      if (state is SignupStateSuccess &&
                                          state.signupEntity!.responseCode !=
                                              409) {
                                        setState(() {
                                          isSignupSuccess = true;
                                        });
                                      }
                                    },
                                    child: SignupAccountDetails(
                                      emailid: widget.emailId,
                                    )),
                              ),

                              Visibility(
                                visible: isSignupSuccess,
                                child: BlocBuilder<SignupBloc, SignupState>(
                                    builder: (context, state) {
                                  if (state is SignupStateSuccess &&
                                      state.signupEntity!.responseCode != 409) {
                                    return SignupOtpDetails(
                                      onTap: () {
                                        setState(() {
                                          isSignupSuccess = false;
                                        });
                                      },
                                      authToken: state
                                          .signupEntity!.userData!.tempToken!,
                                      customId: state
                                          .signupEntity!.userData!.customerId!,
                                    );
                                  } else {
                                    if (!LocalStateCache().isVerificationOtp) {
                                      return SignupOtpDetails(
                                        onTap: () {
                                          // setState(() {
                                          //   isSignupSuccess = false;
                                          // });
                                        },
                                        authToken: widget.authToken,
                                        customId: widget.customerId,
                                      );
                                    } else {
                                      return const SizedBox.shrink();
                                    }
                                  }
                                }),
                              )

                              //
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
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
              child: BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if (state is LoginStateSuccess &&
                      state.loginEntity!.responseCode == 200 &&
                      widget.isInitialStepSignup) {
                    final valueotp =
                        state.loginEntity!.userData!.accountStatus == "Active";

                    isSignupSuccess = valueotp == false ? true : false;
                  } else if (state is LoginStateSuccess &&
                      state.loginEntity!.responseCode == 204 &&
                      widget.isInitialStepSignup) {
                    isSignupSuccess = true;
                  }
                  return Container(
                    width: 150.w,
                    height: 150.w,
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
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                            50.0,
                            50.0,
                            50.0,
                            50.0,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const BrandLogoTtitle(),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0,
                                  12.0,
                                  0.0,
                                  32.0,
                                ),
                                child: Wrap(
                                  spacing: 12.0,
                                  runSpacing: 12.0,
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  direction: Axis.horizontal,
                                  runAlignment: WrapAlignment.start,
                                  verticalDirection: VerticalDirection.down,
                                  clipBehavior: Clip.none,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        if (!isSignupSuccess)
                                          Container(
                                            width: 36.0,
                                            height: 36.0,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF11984A),
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: const Color(0xFF11984A),
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Align(
                                              alignment:
                                                  const AlignmentDirectional(
                                                0.00,
                                                0.00,
                                              ),
                                              child: Text(
                                                '1',
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.getFont(
                                                  'Plus Jakarta Sans',
                                                  color: Colors.white,
                                                  fontSize: 20.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        if (isSignupSuccess)
                                          const FaIcon(
                                            // ignore: deprecated_member_use
                                            FontAwesomeIcons.checkCircle,
                                            color: Color(0xFF11984A),
                                            size: 36.0,
                                          ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(12.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Account Details',
                                            style: GoogleFonts.getFont(
                                              'Plus Jakarta Sans',
                                              color: !isSignupSuccess
                                                  ? const Color(0xFF0E7E3E)
                                                  : const Color(0xFF42526D),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Icon(
                                      Icons.keyboard_arrow_right,
                                      color: Color(0xFF5D6B82),
                                      size: 24.0,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          width: 36.0,
                                          height: 36.0,
                                          decoration: BoxDecoration(
                                            color: isSignupSuccess
                                                ? const Color(0xFF11984A)
                                                : const Color(0xFFFFFFFF),
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: isSignupSuccess
                                                  ? const Color(0xFF11984A)
                                                  : const Color(0xFF98A1B0),
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(
                                                    0.00, 0.00),
                                            child: Text(
                                              '2',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: isSignupSuccess
                                                    ? const Color(0xFFFFFFFF)
                                                    : const Color(0xFF98A1B0),
                                                fontSize: 20.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(12.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Mobile Number',
                                            style: GoogleFonts.getFont(
                                              'Plus Jakarta Sans',
                                              color: isSignupSuccess
                                                  ? const Color(0xFF0E7E3E)
                                                  : const Color(0xFF42526D),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: !isSignupSuccess,
                                maintainState: true,
                                child: BlocListener<SignupBloc, SignupState>(
                                    listener: (context, state) {
                                      if (state is SignupStateSuccess &&
                                          state.signupEntity!.responseCode !=
                                              409) {
                                        setState(() {
                                          isSignupSuccess = true;
                                        });
                                      }
                                    },
                                    child: SignupAccountDetails(
                                      emailid: widget.emailId,
                                    )),
                              ),

                              Visibility(
                                visible: isSignupSuccess,
                                maintainState: true,
                                child: BlocBuilder<SignupBloc, SignupState>(
                                    builder: (context, state) {
                                  if (state is SignupStateSuccess &&
                                      state.signupEntity!.responseCode != 409) {
                                    return SignupOtpDetails(
                                      onTap: () {
                                        setState(() {
                                          isSignupSuccess = false;
                                        });
                                      },
                                      authToken: state
                                          .signupEntity!.userData!.tempToken!,
                                      customId: state
                                          .signupEntity!.userData!.customerId!,
                                    );
                                  } else {
                                    if (!LocalStateCache().isVerificationOtp) {
                                      return SignupOtpDetails(
                                        onTap: () {
                                          // setState(() {
                                          //   isSignupSuccess = false;
                                          // });
                                        },
                                        authToken: widget.authToken,
                                        customId: widget.customerId,
                                      );
                                    } else {
                                      return const SizedBox.shrink();
                                    }
                                  }
                                }),
                              )

                              //
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
