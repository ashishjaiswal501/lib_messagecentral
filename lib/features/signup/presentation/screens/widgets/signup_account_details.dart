// Import necessary Flutter packages
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messagecentral/config/routes/route.dart';
import 'package:messagecentral/core/global_widgets/global_widgets.dart';
import 'package:messagecentral/core/utils/app_environment.dart';
import 'package:messagecentral/core/utils/extention_util.dart';
import 'package:messagecentral/core/utils/mix_pannel.dart';
import 'package:messagecentral/core/utils/validator.dart';
import 'package:messagecentral/features/signup/presentation/bloc/signup_bloc.dart';
import 'package:messagecentral/features/signup/presentation/bloc/signup_event.dart';
import 'package:messagecentral/features/signup/presentation/bloc/signup_state.dart';

// Define the SignupAccountDetails widget
class SignupAccountDetails extends StatefulWidget {
  const SignupAccountDetails({super.key, this.emailid = ''});
  final String emailid;

  @override
  State<SignupAccountDetails> createState() => _SignupAccountDetails();
}

// Define the private _SignupAccountDetails state class
class _SignupAccountDetails extends State<SignupAccountDetails> with Validator {
  // Define focus nodes and controllers for text fields
  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _fullNameControllerFocus = FocusNode();
  final FocusNode _emailControllerFocus = FocusNode();
  final FocusNode _passwordControllerFocus = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateemailId();
  }

  // Dispose of controllers when the widget is disposed
  updateemailId() {
    setState(() {
      _emailController.text = widget.emailid;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  // Build the UI for the SignupAccountDetails widget

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Full Name Text and TextFormField

          Text(
            'Full Name',
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: const Color(0xFF243757),
                  fontSize: 14.0,
                ),
          ),
          ScreenUtil().setVerticalSpacing(4),
          TextFormField(
            controller: _fullNameController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            obscureText: false,
            focusNode: _fullNameControllerFocus,
            textInputAction: TextInputAction.next,
            style: const TextStyle(color: Color(0xFF243757), fontSize: 14),
            keyboardType: TextInputType.text,
            onFieldSubmitted: (value) {
              _fullNameController.text = value;
              FocusScope.of(context).requestFocus(_fullNameControllerFocus);
            },
            validator: validateFullname,
          ),
          ScreenUtil().setVerticalSpacing(16),

          // Email Text and TextFormField
          Text(
            'Email',
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: const Color(0xFF243757), fontSize: 14.0),
          ),
          ScreenUtil().setVerticalSpacing(4),
          TextFormField(
            controller: _emailController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            obscureText: false,
            focusNode: _emailControllerFocus,
            textInputAction: TextInputAction.next,
            style: const TextStyle(color: Color(0xFF243757), fontSize: 14),
            keyboardType: TextInputType.emailAddress,
            onFieldSubmitted: (value) {
              _emailController.text = value;
              FocusScope.of(context).requestFocus(_passwordControllerFocus);
            },
            validator: validateEmail,
          ),
          ScreenUtil().setVerticalSpacing(16),

          // Password Text, TextFormField, and Eye Icon
          Text(
            'Create Password',
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: const Color(0xFF243757),
                  fontSize: 14.0,
                ),
          ),
          ScreenUtil().setVerticalSpacing(4),
          BlocSelector<SignupBloc, SignupState, bool>(
            selector: (state) => state.isobscureText,
            builder: (context, isobscureText) {
              return TextFormField(
                controller: _passwordController,
                obscureText: isobscureText,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                focusNode: _passwordControllerFocus,
                textInputAction: TextInputAction.done,
                style: const TextStyle(color: Color(0xFF243757), fontSize: 14),
                keyboardType: TextInputType.visiblePassword,
                onFieldSubmitted: (value) {
                  _emailController.text = value;
                },
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    splashRadius: 10,
                    onPressed: () {
                      context.read<SignupBloc>().add(
                            GetobscureTextVisibility(
                                obscureText: isobscureText),
                          );
                    },
                    icon: Icon(!isobscureText
                        ? Icons.remove_red_eye_outlined
                        : Icons.visibility_off_outlined),
                  ),
                ),
                validator: validatePassword,
              );
            },
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.info_rounded,
                  color: Color(0xFF7A8699),
                  size: 16.0,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        8.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'Use 8 or more characters with a mix of alphabets and numbers',
                      maxLines: 2,
                      style: GoogleFonts.getFont(
                        'Plus Jakarta Sans',
                        color: const Color(0xFF42526D),
                        fontWeight: FontWeight.normal,
                        fontSize: 11.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          RichText(
            // Controls visual overflow
            overflow: TextOverflow.clip,

            // Controls how the text should be aligned horizontally
            textAlign: TextAlign.end,

            // Control the text direction
            textDirection: TextDirection.rtl,
            softWrap: true,

            text: TextSpan(
              text: 'By signing up, you agree to our ',
              style: GoogleFonts.getFont(
                'Plus Jakarta Sans',
                color: const Color(0xFF42526D),
                fontWeight: FontWeight.normal,
                fontSize: 11.0,
              ),
              children: <TextSpan>[
                TextSpan(
                    text: 'Terms & Conditions',
                    style: GoogleFonts.getFont(
                      'Plus Jakarta Sans',
                      color: const Color(0xFF20A4CD),
                      fontWeight: FontWeight.normal,
                      fontSize: 11.0,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        launchURL(
                            "https://www.messagecentral.com/terms-and-conditions");
                        MixPanelAnalyticsManager().sendEvent(
                            "signup_t&c", "Sign up terms & condition", null);
                      }),
                TextSpan(
                  text: ', ',
                  style: GoogleFonts.getFont(
                    'Plus Jakarta Sans',
                    color: const Color(0xFF42526D),
                    fontWeight: FontWeight.normal,
                    fontSize: 11.0,
                  ),
                ),
                TextSpan(
                    text: "Privacy Policy",
                    style: GoogleFonts.getFont(
                      'Plus Jakarta Sans',
                      color: const Color(0xFF20A4CD),
                      fontWeight: FontWeight.normal,
                      fontSize: 11.0,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        launchURL(
                            "https://www.messagecentral.com/privacy-policy");
                        MixPanelAnalyticsManager().sendEvent(
                            "signup_privacy_policy",
                            "signup privacy policy",
                            null);
                      }),
                TextSpan(
                  text: ', ',
                  style: GoogleFonts.getFont(
                    'Plus Jakarta Sans',
                    color: const Color(0xFF42526D),
                    fontWeight: FontWeight.normal,
                    fontSize: 11.0,
                  ),
                ),
                TextSpan(
                  text: 'and ',
                  style: GoogleFonts.getFont(
                    'Plus Jakarta Sans',
                    color: const Color(0xFF42526D),
                    fontWeight: FontWeight.normal,
                    fontSize: 11.0,
                  ),
                ),
                TextSpan(
                    text: "Acceptance Policy",
                    style: GoogleFonts.getFont(
                      'Plus Jakarta Sans',
                      color: const Color(0xFF20A4CD),
                      fontWeight: FontWeight.normal,
                      fontSize: 11.0,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        launchURL(
                            "https://cpaas-bucket.s3.ap-south-1.amazonaws.com/Acceptable%20Use%20Policy.pdf");
                        MixPanelAnalyticsManager().sendEvent(
                            "signup_acceptance_policy",
                            "signup acceptance policy",
                            null);
                      }),
                TextSpan(
                  text:
                      ", and we'll ensure security with Two-factor authentication using OTP for mobile number authentication.",
                  style: GoogleFonts.getFont(
                    'Plus Jakarta Sans',
                    color: const Color(0xFF42526D),
                    fontWeight: FontWeight.normal,
                    fontSize: 11.0,
                  ),
                ),
              ],
            ),
          ),

          ScreenUtil().setVerticalSpacing(32),

          // Signup Button with BlocListener
          BlocConsumer<SignupBloc, SignupState>(
            builder: (context, state) => ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0.1,
                minimumSize: const Size(double.infinity, 52),
              ),
              onPressed: state == const SignupStateLoading()
                  ? null
                  : () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        context.read<SignupBloc>().add(
                              GetSignupPressedButton(
                                fullName: _fullNameController.text,
                                email: _emailController.text,
                                password: _passwordController.text
                                    .base64Function(_passwordController.text),
                              ),
                            );
                      }
                    },
              child: Visibility(
                  visible: state != const SignupStateLoading(),
                  replacement: GlobalWidgets.loadingWidget(),
                  child: const Text("Next")),
            ),
            listener: (context, state) {
              if (state is SignupStateSuccess &&
                  state.signupEntity!.userData == null) {
                showDialog(
                  context: context,
                  builder: (alertDialogContext) {
                    return AlertDialog(
                      alignment: const Alignment(0.65, 0.0),
                      content: Text(state.signupEntity!.message!),
                      actions: [
                        ElevatedButton(
                            onPressed: () => Navigator.pop(alertDialogContext),
                            child: const Text("OK")),
                      ],
                    );
                  },
                );
              } else if (state is SignupStateError) {
                showDialog(
                  context: context,
                  builder: (alertDialogContext) {
                    return AlertDialog(
                      alignment: const Alignment(0.65, 0.0),
                      content: Text(state.dioError!),
                      actions: [
                        ElevatedButton(
                            onPressed: () => Navigator.pop(alertDialogContext),
                            child: const Text("OK")),
                      ],
                    );
                  },
                );
              } else if (state is SignupStateSuccess &&
                  state.signupEntity!.userData != null) {
                MixPanelAnalyticsManager()
                    .sendEvent("signup_account_next", "signup account next", {
                  'environment': FlavorConfig.instance!.env,
                  'userName': _fullNameController.text,
                  'email': _emailController.text,
                  'countryCode': "",
                  'mobileNumber': "",
                  'customerID': state.signupEntity?.userData?.customerId ?? "",
                  'displayName': "signup account next"
                });
              }
            },
          ),

          ScreenUtil().setVerticalSpacing(32),

          // Forgot Password Text with InkWell
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Already an existing user? ',
                  style: GoogleFonts.getFont(
                    'Plus Jakarta Sans',
                    color: const Color(0xFF243757),
                    fontWeight: FontWeight.normal,
                    fontSize: 11.0,
                  ),
                ),
                TextSpan(
                  text: 'Login here',
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: const Color(0xFF20A4CD),
                        fontSize: 11.0,
                        letterSpacing: 0,
                      ),
                  mouseCursor: SystemMouseCursors.click,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      context.goNamed(RoutePath.login.name);
                      MixPanelAnalyticsManager().sendEvent(
                          'signup_login', 'Sign up to Login redirection', null);
                    },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
