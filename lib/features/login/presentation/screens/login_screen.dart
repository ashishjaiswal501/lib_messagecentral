import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:messagecentral/config/routes/route.dart';
import 'package:messagecentral/core/global_widgets/global_widgets.dart';
import 'package:messagecentral/core/utils/app_environment.dart';
import 'package:messagecentral/core/utils/extention_util.dart';
import 'package:messagecentral/core/utils/firebase_analytics_functions.dart';
import 'package:messagecentral/core/utils/local_state_cache.dart';
import 'package:messagecentral/core/utils/mix_pannel.dart';
import 'package:messagecentral/core/utils/responsive.dart';
import 'package:messagecentral/core/utils/validator.dart';
import 'package:messagecentral/features/login/presentation/bloc/login_bloc.dart';
import 'package:messagecentral/features/login/presentation/bloc/login_event.dart';
import 'package:messagecentral/features/login/presentation/bloc/login_state.dart';
import 'package:messagecentral/features/login/presentation/screens/widgets/brand_logo_title.dart';
import 'package:messagecentral/user_cache_manager/bloc/user_cache_manager_bloc.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Validator {
  final unfocusNode = FocusNode();

  final formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  // final FocusNode _emailControllerFocus = FocusNode();

  // final FocusNode _passwordControllerFocus = FocusNode();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  void initState() {
    super.initState();
    MixPanelAnalyticsManager()
        .sendEvent('login_landing', 'Login Landing', null);
  }

  @override
  Widget build(BuildContext context) {
    setScreenFirebase('login_landing', 'Login Landing');
    return const Scaffold(
      body: LoginBlurScreen(),
      // body: Visibility(
      //   visible: true,
      //   replacement: SafeArea(
      //     top: true,
      //     child: SingleChildScrollView(
      //       child: Column(
      //         mainAxisSize: MainAxisSize.max,
      //         mainAxisAlignment: MainAxisAlignment.start,
      //         children: [
      //           Row(
      //             mainAxisSize: MainAxisSize.max,
      //             mainAxisAlignment: MainAxisAlignment.spaceAround,
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               if (responsiveVisibility(
      //                 context: context,
      //                 phone: false,
      //                 tablet: false,
      //               ))
      //                 Container(
      //                   width: MediaQuery.sizeOf(context).width * 0.5,
      //                   height: MediaQuery.sizeOf(context).height * 1.0,
      //                   decoration: const BoxDecoration(
      //                     color: Color(0xFF215196),
      //                   ),
      //                   child: Image.asset(
      //                     ImagePath.imgLogin,
      //                     width: MediaQuery.sizeOf(context).width * 0.5,
      //                     height: MediaQuery.sizeOf(context).height * 1.0,
      //                     fit: BoxFit.contain,
      //                   ),
      //                 ),
      //               Expanded(
      //                   child: Form(
      //                       key: formKey,
      //                       child: Padding(
      //                         padding: const EdgeInsetsDirectional.fromSTEB(
      //                             50.0, 50.0, 50.0, 50.0),
      //                         child: Column(
      //                           mainAxisSize: MainAxisSize.max,
      //                           mainAxisAlignment: MainAxisAlignment.start,
      //                           crossAxisAlignment: CrossAxisAlignment.start,
      //                           children: [
      //                             const BrandLogoTtitle(),
      //                             ScreenUtil().setVerticalSpacing(32),
      //                             Text(
      //                               'Email',
      //                               style: Theme.of(context)
      //                                   .textTheme
      //                                   .labelMedium!
      //                                   .copyWith(
      //                                       color: const Color(0xFF243757),
      //                                       fontSize: 14.0),
      //                             ),
      //                             ScreenUtil().setVerticalSpacing(4),
      //                             TextFormField(
      //                                 autovalidateMode:
      //                                     AutovalidateMode.onUserInteraction,
      //                                 controller: _emailController,
      //                                 obscureText: false,
      //                                 focusNode: _emailControllerFocus,
      //                                 textInputAction: TextInputAction.next,
      //                                 style: const TextStyle(
      //                                     color: Color(0xFF243757),
      //                                     fontSize: 14),
      //                                 keyboardType: TextInputType.emailAddress,
      //                                 onFieldSubmitted: (value) {
      //                                   _emailController.text = value;
      //                                   FocusScope.of(context).requestFocus(
      //                                       _passwordControllerFocus);
      //                                 },
      //                                 validator: validateEmail),
      //                             ScreenUtil().setVerticalSpacing(16),
      //                             Text(
      //                               'Password',
      //                               style: Theme.of(context)
      //                                   .textTheme
      //                                   .labelMedium!
      //                                   .copyWith(
      //                                       color: const Color(0xFF243757),
      //                                       fontSize: 14.0),
      //                             ),
      //                             ScreenUtil().setVerticalSpacing(4),
      //                             BlocSelector<LoginBloc, LoginState, bool>(
      //                                 selector: (state) => state.isobscureText!,
      //                                 builder: (context, isobscureText) {
      //                                   return TextFormField(
      //                                       autovalidateMode: AutovalidateMode
      //                                           .onUserInteraction,
      //                                       controller: _passwordController,
      //                                       obscureText: isobscureText,
      //                                       focusNode: _passwordControllerFocus,
      //                                       textInputAction:
      //                                           TextInputAction.done,
      //                                       style: const TextStyle(
      //                                           color: Color(0xFF243757),
      //                                           fontSize: 14),
      //                                       keyboardType:
      //                                           TextInputType.visiblePassword,
      //                                       onFieldSubmitted: (value) {
      //                                         _passwordController.text = value;
      //                                       },
      //                                       decoration: InputDecoration(
      //                                           suffixIcon: IconButton(
      //                                         splashRadius: 10,
      //                                         onPressed: () {
      //                                           context.read<LoginBloc>().add(
      //                                               GetobscureTextVisibility(
      //                                                   obscureText:
      //                                                       isobscureText));
      //                                         },
      //                                         icon: Icon(!isobscureText
      //                                             ? Icons
      //                                                 .remove_red_eye_outlined
      //                                             : Icons
      //                                                 .visibility_off_outlined),
      //                                       )),
      //                                       validator: validatePassword);
      //                                 }),
      //                             ScreenUtil().setVerticalSpacing(32),
      //                             BlocListener<LoginBloc, LoginState>(
      //                                 listener: (context, state) {
      //                                   if (state is LoginStateSuccess &&
      //                                       state.loginEntity!.userData ==
      //                                           null) {
      //                                     showDialog(
      //                                       context: context,
      //                                       builder: (alertDialogContext) {
      //                                         return AlertDialog(
      //                                           alignment:
      //                                               const Alignment(0.65, 0.0),
      //                                           content: Text(state
      //                                               .loginEntity!.message!),
      //                                           actions: [
      //                                             ElevatedButton(
      //                                                 onPressed: () =>
      //                                                     Navigator.pop(
      //                                                         alertDialogContext),
      //                                                 child: const Text("OK")),
      //                                           ],
      //                                         );
      //                                       },
      //                                     );

      //                                     // context.goNamed(RoutePath.home.name);
      //                                   } else if (state is LoginStateSuccess &&
      //                                       state.loginEntity!.userData !=
      //                                           null &&
      //                                       state.loginEntity!.userData!
      //                                               .accountStatus ==
      //                                           "Active") {
      //                                     LocalStateCache().setAuthToken = state
      //                                             .loginEntity!
      //                                             .userData
      //                                             ?.authToken ??
      //                                         "";
      //                                     LocalStateCache().customerId = state
      //                                             .loginEntity!
      //                                             .userData
      //                                             ?.customerId ??
      //                                         "";
      //                                     LocalStateCache().phoneNo = state
      //                                             .loginEntity!
      //                                             .userData
      //                                             ?.phoneNo ??
      //                                         "";

      //                                     LocalStateCache().countryCode = state
      //                                             .loginEntity!
      //                                             .userData
      //                                             ?.countryCode ??
      //                                         "";

      //                                     //context.goNamed('/home');
      //                                     MixPanelAnalyticsManager().sendEvent(
      //                                         'Login_CTA', 'Login CTA', {
      //                                       'environment':
      //                                           FlavorConfig.instance!.env,
      //                                       'userName': state.loginEntity
      //                                               ?.userData?.firstName ??
      //                                           "",
      //                                       'email': state.loginEntity?.userData
      //                                               ?.email ??
      //                                           "",
      //                                       'countryCode': state.loginEntity
      //                                               ?.userData?.countryCode ??
      //                                           "",
      //                                       'mobileNumber': state.loginEntity
      //                                               ?.userData?.phoneNo ??
      //                                           "",
      //                                       'customerID': state.loginEntity
      //                                               ?.userData?.customerId ??
      //                                           "",
      //                                       'displayName': "Login CTA"
      //                                     });
      //                                     LocalStateCache().isVerificationOtp =
      //                                         true;

      //                                     Provider.of<UserCacheManagerBloc>(
      //                                             context,
      //                                             listen: false)
      //                                         .loginSession();
      //                                   } else if (state is LoginStateSuccess &&
      //                                       state.loginEntity!.userData !=
      //                                           null &&
      //                                       state.loginEntity!.userData!
      //                                               .accountStatus ==
      //                                           "Inactive") {
      //                                     LocalStateCache().setAuthToken = state
      //                                             .loginEntity!
      //                                             .userData
      //                                             ?.authToken ??
      //                                         "";
      //                                     LocalStateCache().customerId = state
      //                                             .loginEntity!
      //                                             .userData
      //                                             ?.customerId ??
      //                                         "";
      //                                     LocalStateCache().isVerificationOtp =
      //                                         false;

      //                                     MixPanelAnalyticsManager().sendEvent(
      //                                         'Login_CTA', 'Login CTA', {
      //                                       'environment':
      //                                           FlavorConfig.instance!.env,
      //                                       'userName': state.loginEntity
      //                                               ?.userData?.firstName ??
      //                                           "",
      //                                       'email': state.loginEntity?.userData
      //                                               ?.email ??
      //                                           "",
      //                                       'countryCode': state.loginEntity
      //                                               ?.userData?.countryCode ??
      //                                           "",
      //                                       'mobileNumber': state.loginEntity
      //                                               ?.userData?.phoneNo ??
      //                                           "",
      //                                       'customerID': state.loginEntity
      //                                               ?.userData?.customerId ??
      //                                           "",
      //                                       'displayName': "Login CTA"
      //                                     });
      //                                     context.goNamed(
      //                                       RoutePath.signup.name,
      //                                     );
      //                                   } else if (state is LoginStateError) {
      //                                     showDialog(
      //                                       context: context,
      //                                       builder: (alertDialogContext) {
      //                                         return AlertDialog(
      //                                           alignment:
      //                                               const Alignment(0.65, 0.0),
      //                                           content: Text(state.dioError!),
      //                                           actions: [
      //                                             TextButton(
      //                                               onPressed: () =>
      //                                                   Navigator.pop(
      //                                                       alertDialogContext),
      //                                               child: const Text('OK'),
      //                                             ),
      //                                           ],
      //                                         );
      //                                       },
      //                                     );
      //                                   }
      //                                 },
      //                                 child: ElevatedButton(
      //                                     style: ElevatedButton.styleFrom(
      //                                         elevation: 0.1,
      //                                         minimumSize: const Size(
      //                                             double.infinity, 52)),
      //                                     onPressed: () {
      //                                       if (formKey.currentState!
      //                                           .validate()) {
      //                                         formKey.currentState!.save();
      //                                         context.read<LoginBloc>().add(
      //                                             GetLoginPressedButton(
      //                                                 email:
      //                                                     _emailController.text,
      //                                                 password: _passwordController
      //                                                     .text
      //                                                     .base64Function(
      //                                                         _passwordController
      //                                                             .text)));
      //                                       }
      //                                     },
      //                                     child: const Text("Log in"))),
      //                             ScreenUtil().setVerticalSpacing(32),
      //                             InkWell(
      //                               splashColor: Colors.transparent,
      //                               focusColor: Colors.transparent,
      //                               hoverColor: Colors.transparent,
      //                               highlightColor: Colors.transparent,
      //                               onTap: () async {
      //                                 context.goNamed(
      //                                     RoutePath.forgotpassword.name);
      //                                 MixPanelAnalyticsManager().sendEvent(
      //                                     "Login_forgot_password",
      //                                     "Login Forgot Password",
      //                                     null);
      //                               },
      //                               child: Text(
      //                                 'Forgot password?',
      //                                 style: GoogleFonts.getFont(
      //                                   'Plus Jakarta Sans',
      //                                   color: const Color(0xFF20A4CD),
      //                                   fontWeight: FontWeight.normal,
      //                                   fontSize: 11.0,
      //                                 ),
      //                               ),
      //                             ),
      //                           ],
      //                         ),
      //                       ))),
      //             ],
      //           )
      //         ],
      //       ),
      //     ),
      //   ),
      //   child: const LoginBlurScreen(),
      // ),
    );
  }
}

class LoginBlurScreen extends StatefulWidget {
  const LoginBlurScreen({super.key});

  @override
  State<LoginBlurScreen> createState() => _LoginBlurScreenState();
}

class _LoginBlurScreenState extends State<LoginBlurScreen> with Validator {
  final unfocusNode = FocusNode();

  final formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailControllerFocus = FocusNode();

  final FocusNode _passwordControllerFocus = FocusNode();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        child: Responsive(
          mobile: SingleChildScrollView(
            child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      50.0, 50.0, 50.0, 50.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BrandLogoTtitle(),
                      ScreenUtil().setVerticalSpacing(32),
                      Text(
                        'Email',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(
                                color: const Color(0xFF243757), fontSize: 14.0),
                      ),
                      ScreenUtil().setVerticalSpacing(4),
                      TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _emailController,
                          obscureText: false,
                          focusNode: _emailControllerFocus,
                          textInputAction: TextInputAction.next,
                          style: const TextStyle(
                              color: Color(0xFF243757), fontSize: 14),
                          keyboardType: TextInputType.emailAddress,
                          onFieldSubmitted: (value) {
                            _emailController.text = value;
                            FocusScope.of(context)
                                .requestFocus(_passwordControllerFocus);
                          },
                          validator: validateEmail),
                      ScreenUtil().setVerticalSpacing(16),
                      Text(
                        'Password',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(
                                color: const Color(0xFF243757), fontSize: 14.0),
                      ),
                      ScreenUtil().setVerticalSpacing(4),
                      BlocSelector<LoginBloc, LoginState, bool>(
                          selector: (state) => state.isobscureText!,
                          builder: (context, isobscureText) {
                            return TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: _passwordController,
                                obscureText: isobscureText,
                                focusNode: _passwordControllerFocus,
                                textInputAction: TextInputAction.done,
                                style: const TextStyle(
                                    color: Color(0xFF243757), fontSize: 14),
                                keyboardType: TextInputType.visiblePassword,
                                onFieldSubmitted: (value) {
                                  _passwordController.text = value;
                                },
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                  splashRadius: 10,
                                  onPressed: () {
                                    context.read<LoginBloc>().add(
                                        GetobscureTextVisibility(
                                            obscureText: isobscureText));
                                  },
                                  icon: Icon(!isobscureText
                                      ? Icons.remove_red_eye_outlined
                                      : Icons.visibility_off_outlined),
                                )),
                                validator: validatePassword);
                          }),
                      ScreenUtil().setVerticalSpacing(32),
                      BlocConsumer<LoginBloc, LoginState>(
                        builder: (context, state) {
                          return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 0.1,
                                  minimumSize: const Size(double.infinity, 52)),
                              onPressed: state == const LoginStateLoading()
                                  ? null
                                  : () {
                                      if (formKey.currentState!.validate()) {
                                        formKey.currentState!.save();
                                        context.read<LoginBloc>().add(
                                            GetLoginPressedButton(
                                                email: _emailController.text,
                                                password: _passwordController
                                                    .text
                                                    .base64Function(
                                                        _passwordController
                                                            .text)));
                                      }
                                    },
                              child: Visibility(
                                  visible: state != const LoginStateLoading(),
                                  replacement: GlobalWidgets.loadingWidget(),
                                  child: const Text("Log in")));
                        },
                        listener: (context, state) {
                          if (state is LoginStateSuccess &&
                              state.loginEntity!.userData == null) {
                            showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  alignment: const Alignment(0.65, 0.0),
                                  content: Text(state.loginEntity!.message!),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: const Text("OK")),
                                  ],
                                );
                              },
                            );

                            // context.goNamed(RoutePath.home.name);
                          } else if (state is LoginStateSuccess &&
                              state.loginEntity!.responseCode == 200 &&
                              state.loginEntity!.userData != null &&
                              state.loginEntity!.userData!.accountStatus ==
                                  "Active") {
                            LocalStateCache().setAuthToken =
                                state.loginEntity!.userData?.authToken ?? "";
                            LocalStateCache().customerId =
                                state.loginEntity!.userData?.customerId ?? "";
                            LocalStateCache().phoneNo =
                                state.loginEntity!.userData?.phoneNo ?? "";

                            LocalStateCache().countryCode =
                                state.loginEntity!.userData?.countryCode ?? "";
                            LocalStateCache().isVerificationOtp = true;
                            Provider.of<UserCacheManagerBloc>(context,
                                    listen: false)
                                .loginSession();
                            MixPanelAnalyticsManager()
                                .sendEvent('Login_CTA', 'Login CTA', null);
                          } else if (state is LoginStateSuccess &&
                              state.loginEntity!.responseCode == 200 &&
                              state.loginEntity!.userData != null &&
                              state.loginEntity!.userData!.accountStatus ==
                                  "Inactive") {
                            LocalStateCache().setisInitialStepSignup = true;
                            LocalStateCache().setAuthToken =
                                state.loginEntity!.userData?.authToken ?? "";
                            LocalStateCache().customerId =
                                state.loginEntity!.userData?.customerId ?? "";
                            LocalStateCache().isVerificationOtp = false;
                            MixPanelAnalyticsManager()
                                .sendEvent('Login_CTA', 'Login CTA', null);
                            context.goNamed(
                              RoutePath.signup.name,
                            );
                          } else if (state is LoginStateSuccess &&
                              state.loginEntity!.responseCode == 204 &&
                              state.loginEntity!.userData != null) {
                            LocalStateCache().setisInitialStepSignup = true;
                            LocalStateCache().setAuthToken =
                                state.loginEntity!.userData?.tempToken ?? "";
                            LocalStateCache().customerId =
                                state.loginEntity!.userData?.customerId ?? "";
                            LocalStateCache().isVerificationOtp = false;
                            MixPanelAnalyticsManager()
                                .sendEvent('Login_CTA', 'Login CTA', null);
                            context.goNamed(
                              RoutePath.signup.name,
                            );
                          } else if (state is LoginStateError) {
                            showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  alignment: const Alignment(0.65, 0.0),
                                  content: Text(state.dioError!),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                      ),
                      ScreenUtil().setVerticalSpacing(32),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.goNamed(RoutePath.forgotpassword.name);
                          MixPanelAnalyticsManager().sendEvent(
                              "Login_forgot_password",
                              "Login Forgot Password",
                              null);
                        },
                        child: Text(
                          'Forgot password?',
                          style: GoogleFonts.getFont(
                            'Plus Jakarta Sans',
                            color: const Color(0xFF20A4CD),
                            fontWeight: FontWeight.normal,
                            fontSize: 11.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
          tablet: Stack(
            fit: StackFit.passthrough,
            alignment: Alignment.center,
            children: [
              GlobalWidgets.blurContainer(),
              Positioned(
                top: 33,
                bottom: 33,
                child: Container(
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
                              50.0, 50.0, 50.0, 50.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const BrandLogoTtitle(),
                              ScreenUtil().setVerticalSpacing(32),
                              Text(
                                'Email',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                        color: const Color(0xFF243757),
                                        fontSize: 14.0),
                              ),
                              ScreenUtil().setVerticalSpacing(4),
                              TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  controller: _emailController,
                                  obscureText: false,
                                  focusNode: _emailControllerFocus,
                                  textInputAction: TextInputAction.next,
                                  style: const TextStyle(
                                      color: Color(0xFF243757), fontSize: 14),
                                  keyboardType: TextInputType.emailAddress,
                                  onFieldSubmitted: (value) {
                                    _emailController.text = value;
                                    FocusScope.of(context)
                                        .requestFocus(_passwordControllerFocus);
                                  },
                                  validator: validateEmail),
                              ScreenUtil().setVerticalSpacing(16),
                              Text(
                                'Password',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                        color: const Color(0xFF243757),
                                        fontSize: 14.0),
                              ),
                              ScreenUtil().setVerticalSpacing(4),
                              BlocSelector<LoginBloc, LoginState, bool>(
                                  selector: (state) => state.isobscureText!,
                                  builder: (context, isobscureText) {
                                    return TextFormField(
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        controller: _passwordController,
                                        obscureText: isobscureText,
                                        focusNode: _passwordControllerFocus,
                                        textInputAction: TextInputAction.done,
                                        style: const TextStyle(
                                            color: Color(0xFF243757),
                                            fontSize: 14),
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        onFieldSubmitted: (value) {
                                          _passwordController.text = value;
                                        },
                                        decoration: InputDecoration(
                                            suffixIcon: IconButton(
                                          splashRadius: 10,
                                          onPressed: () {
                                            context.read<LoginBloc>().add(
                                                GetobscureTextVisibility(
                                                    obscureText:
                                                        isobscureText));
                                          },
                                          icon: Icon(!isobscureText
                                              ? Icons.remove_red_eye_outlined
                                              : Icons.visibility_off_outlined),
                                        )),
                                        validator: validatePassword);
                                  }),
                              ScreenUtil().setVerticalSpacing(32),
                              BlocConsumer<LoginBloc, LoginState>(
                                builder: (context, state) {
                                  return ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          elevation: 0.1,
                                          minimumSize:
                                              const Size(double.infinity, 52)),
                                      onPressed: state ==
                                              const LoginStateLoading()
                                          ? null
                                          : () {
                                              if (formKey.currentState!
                                                  .validate()) {
                                                formKey.currentState!.save();
                                                context.read<LoginBloc>().add(
                                                    GetLoginPressedButton(
                                                        email: _emailController
                                                            .text,
                                                        password: _passwordController
                                                            .text
                                                            .base64Function(
                                                                _passwordController
                                                                    .text)));
                                              }
                                            },
                                      child: Visibility(
                                          visible: state !=
                                              const LoginStateLoading(),
                                          replacement:
                                              GlobalWidgets.loadingWidget(),
                                          child: const Text("Log in")));
                                },
                                listener: (context, state) {
                                  if (state is LoginStateSuccess &&
                                      state.loginEntity!.userData == null) {
                                    showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          alignment: const Alignment(0.65, 0.0),
                                          content:
                                              Text(state.loginEntity!.message!),
                                          actions: [
                                            ElevatedButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: const Text("OK")),
                                          ],
                                        );
                                      },
                                    );

                                    // context.goNamed(RoutePath.home.name);
                                  } else if (state is LoginStateSuccess &&
                                      state.loginEntity!.responseCode == 200 &&
                                      state.loginEntity!.userData != null &&
                                      state.loginEntity!.userData!
                                              .accountStatus ==
                                          "Active") {
                                    LocalStateCache().setAuthToken = state
                                            .loginEntity!.userData?.authToken ??
                                        "";
                                    LocalStateCache().customerId = state
                                            .loginEntity!
                                            .userData
                                            ?.customerId ??
                                        "";
                                    LocalStateCache().phoneNo =
                                        state.loginEntity!.userData?.phoneNo ??
                                            "";

                                    LocalStateCache().countryCode = state
                                            .loginEntity!
                                            .userData
                                            ?.countryCode ??
                                        "";
                                    LocalStateCache().isVerificationOtp = true;
                                    Provider.of<UserCacheManagerBloc>(context,
                                            listen: false)
                                        .loginSession();
                                    MixPanelAnalyticsManager().sendEvent(
                                        'Login_CTA', 'Login CTA', null);
                                  } else if (state is LoginStateSuccess &&
                                      state.loginEntity!.responseCode == 200 &&
                                      state.loginEntity!.userData != null &&
                                      state.loginEntity!.userData!
                                              .accountStatus ==
                                          "Inactive") {
                                    LocalStateCache().setisInitialStepSignup =
                                        true;
                                    LocalStateCache().setAuthToken = state
                                            .loginEntity!.userData?.authToken ??
                                        "";
                                    LocalStateCache().customerId = state
                                            .loginEntity!
                                            .userData
                                            ?.customerId ??
                                        "";
                                    LocalStateCache().isVerificationOtp = false;
                                    MixPanelAnalyticsManager().sendEvent(
                                        'Login_CTA', 'Login CTA', null);
                                    context.goNamed(
                                      RoutePath.signup.name,
                                    );
                                  } else if (state is LoginStateSuccess &&
                                      state.loginEntity!.responseCode == 204 &&
                                      state.loginEntity!.userData != null) {
                                    LocalStateCache().setisInitialStepSignup =
                                        true;
                                    LocalStateCache().setAuthToken = state
                                            .loginEntity!.userData?.tempToken ??
                                        "";
                                    LocalStateCache().customerId = state
                                            .loginEntity!
                                            .userData
                                            ?.customerId ??
                                        "";
                                    LocalStateCache().isVerificationOtp = false;
                                    MixPanelAnalyticsManager().sendEvent(
                                        'Login_CTA', 'Login CTA', null);
                                    context.goNamed(
                                      RoutePath.signup.name,
                                    );
                                  } else if (state is LoginStateError) {
                                    showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          alignment: const Alignment(0.65, 0.0),
                                          content: Text(state.dioError!),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: const Text('OK'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                },
                              ),
                              ScreenUtil().setVerticalSpacing(32),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context
                                      .goNamed(RoutePath.forgotpassword.name);
                                  MixPanelAnalyticsManager().sendEvent(
                                      "Login_forgot_password",
                                      "Login Forgot Password",
                                      null);
                                },
                                child: Text(
                                  'Forgot password?',
                                  style: GoogleFonts.getFont(
                                    'Plus Jakarta Sans',
                                    color: const Color(0xFF20A4CD),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 11.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
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
                  width: 140.w,
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
                              50.0, 50.0, 50.0, 50.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const BrandLogoTtitle(),
                              ScreenUtil().setVerticalSpacing(32),
                              Text(
                                'Email',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                        color: const Color(0xFF243757),
                                        fontSize: 14.0),
                              ),
                              ScreenUtil().setVerticalSpacing(4),
                              TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  controller: _emailController,
                                  obscureText: false,
                                  focusNode: _emailControllerFocus,
                                  textInputAction: TextInputAction.next,
                                  style: const TextStyle(
                                      color: Color(0xFF243757), fontSize: 14),
                                  keyboardType: TextInputType.emailAddress,
                                  onFieldSubmitted: (value) {
                                    _emailController.text = value;
                                    FocusScope.of(context)
                                        .requestFocus(_passwordControllerFocus);
                                  },
                                  validator: validateEmail),
                              ScreenUtil().setVerticalSpacing(16),
                              Text(
                                'Password',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                        color: const Color(0xFF243757),
                                        fontSize: 14.0),
                              ),
                              ScreenUtil().setVerticalSpacing(4),
                              BlocSelector<LoginBloc, LoginState, bool>(
                                  selector: (state) => state.isobscureText!,
                                  builder: (context, isobscureText) {
                                    return TextFormField(
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        controller: _passwordController,
                                        obscureText: isobscureText,
                                        focusNode: _passwordControllerFocus,
                                        textInputAction: TextInputAction.done,
                                        style: const TextStyle(
                                            color: Color(0xFF243757),
                                            fontSize: 14),
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        onFieldSubmitted: (value) {
                                          _passwordController.text = value;
                                        },
                                        decoration: InputDecoration(
                                            suffixIcon: IconButton(
                                          splashRadius: 10,
                                          onPressed: () {
                                            context.read<LoginBloc>().add(
                                                GetobscureTextVisibility(
                                                    obscureText:
                                                        isobscureText));
                                          },
                                          icon: Icon(!isobscureText
                                              ? Icons.remove_red_eye_outlined
                                              : Icons.visibility_off_outlined),
                                        )),
                                        validator: validatePassword);
                                  }),
                              ScreenUtil().setVerticalSpacing(32),
                              BlocConsumer<LoginBloc, LoginState>(
                                builder: (context, state) {
                                  return ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          elevation: 0.1,
                                          minimumSize:
                                              const Size(double.infinity, 52)),
                                      onPressed: state ==
                                              const LoginStateLoading()
                                          ? null
                                          : () {
                                              if (formKey.currentState!
                                                  .validate()) {
                                                formKey.currentState!.save();
                                                context.read<LoginBloc>().add(
                                                    GetLoginPressedButton(
                                                        email: _emailController
                                                            .text,
                                                        password: _passwordController
                                                            .text
                                                            .base64Function(
                                                                _passwordController
                                                                    .text)));
                                                // MixPanelAnalyticsManager()
                                                //     .sendEvent('Login_CTA',
                                                //         'Login CTA', null);
                                              }
                                            },
                                      child: Visibility(
                                          visible: state !=
                                              const LoginStateLoading(),
                                          replacement:
                                              GlobalWidgets.loadingWidget(),
                                          child: const Text("Log in")));
                                },
                                listener: (context, state) {
                                  if (state is LoginStateSuccess &&
                                      state.loginEntity!.userData == null) {
                                    showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          alignment: const Alignment(0.65, 0.0),
                                          content:
                                              Text(state.loginEntity!.message!),
                                          actions: [
                                            ElevatedButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: const Text("OK")),
                                          ],
                                        );
                                      },
                                    );

                                    // context.goNamed(RoutePath.home.name);
                                  } else if (state is LoginStateSuccess &&
                                      state.loginEntity!.responseCode == 200 &&
                                      state.loginEntity!.userData != null &&
                                      state.loginEntity!.userData!
                                              .accountStatus ==
                                          "Active") {
                                    LocalStateCache().setAuthToken = state
                                            .loginEntity!.userData?.authToken ??
                                        "";
                                    LocalStateCache().customerId = state
                                            .loginEntity!
                                            .userData
                                            ?.customerId ??
                                        "";
                                    LocalStateCache().phoneNo =
                                        state.loginEntity!.userData?.phoneNo ??
                                            "";

                                    LocalStateCache().countryCode = state
                                            .loginEntity!
                                            .userData
                                            ?.countryCode ??
                                        "";
                                    LocalStateCache().isVerificationOtp = true;
                                    Provider.of<UserCacheManagerBloc>(context,
                                            listen: false)
                                        .loginSession();
                                    MixPanelAnalyticsManager()
                                        .sendEvent('Login_CTA', 'Login CTA', {
                                      'environment': FlavorConfig.instance!.env,
                                      'userName': state.loginEntity?.userData
                                              ?.firstName ??
                                          "",
                                      'email':
                                          state.loginEntity?.userData?.email ??
                                              "",
                                      'countryCode': state.loginEntity?.userData
                                              ?.countryCode ??
                                          "",
                                      'mobileNumber': state
                                              .loginEntity?.userData?.phoneNo ??
                                          "",
                                      'customerID': state.loginEntity?.userData
                                              ?.customerId ??
                                          "",
                                      'displayName': "Login CTA"
                                    });
                                  } else if (state is LoginStateSuccess &&
                                      state.loginEntity!.responseCode == 200 &&
                                      state.loginEntity!.userData != null &&
                                      state.loginEntity!.userData!
                                              .accountStatus ==
                                          "Inactive") {
                                    LocalStateCache().setisInitialStepSignup =
                                        true;
                                    LocalStateCache().setAuthToken = state
                                            .loginEntity!.userData?.authToken ??
                                        "";
                                    LocalStateCache().customerId = state
                                            .loginEntity!
                                            .userData
                                            ?.customerId ??
                                        "";
                                    LocalStateCache().isVerificationOtp = false;
                                    MixPanelAnalyticsManager()
                                        .sendEvent('Login_CTA', 'Login CTA', {
                                      'environment': FlavorConfig.instance!.env,
                                      'userName': state.loginEntity?.userData
                                              ?.firstName ??
                                          "",
                                      'email':
                                          state.loginEntity?.userData?.email ??
                                              "",
                                      'countryCode': state.loginEntity?.userData
                                              ?.countryCode ??
                                          "",
                                      'mobileNumber': state
                                              .loginEntity?.userData?.phoneNo ??
                                          "",
                                      'customerID': state.loginEntity?.userData
                                              ?.customerId ??
                                          "",
                                      'displayName': "Login CTA"
                                    });
                                    context.goNamed(
                                      RoutePath.signup.name,
                                    );
                                  } else if (state is LoginStateSuccess &&
                                      state.loginEntity!.responseCode == 204 &&
                                      state.loginEntity!.userData != null) {
                                    LocalStateCache().setisInitialStepSignup =
                                        true;
                                    LocalStateCache().setAuthToken = state
                                            .loginEntity!.userData?.tempToken ??
                                        "";
                                    LocalStateCache().customerId = state
                                            .loginEntity!
                                            .userData
                                            ?.customerId ??
                                        "";
                                    LocalStateCache().isVerificationOtp = false;
                                    MixPanelAnalyticsManager()
                                        .sendEvent('Login_CTA', 'Login CTA', {
                                      'environment': FlavorConfig.instance!.env,
                                      'userName': state.loginEntity?.userData
                                              ?.firstName ??
                                          "",
                                      'email':
                                          state.loginEntity?.userData?.email ??
                                              "",
                                      'countryCode': state.loginEntity?.userData
                                              ?.countryCode ??
                                          "",
                                      'mobileNumber': state
                                              .loginEntity?.userData?.phoneNo ??
                                          "",
                                      'customerID': state.loginEntity?.userData
                                              ?.customerId ??
                                          "",
                                      'displayName': "Login CTA"
                                    });
                                    context.goNamed(
                                      RoutePath.signup.name,
                                    );
                                  } else if (state is LoginStateError) {
                                    showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          alignment: const Alignment(0.65, 0.0),
                                          content: Text(state.dioError!),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: const Text('OK'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                },
                              ),
                              ScreenUtil().setVerticalSpacing(32),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context
                                      .goNamed(RoutePath.forgotpassword.name);
                                  MixPanelAnalyticsManager().sendEvent(
                                      "Login_forgot_password",
                                      "Login Forgot Password",
                                      null);
                                },
                                child: Text(
                                  'Forgot password?',
                                  style: GoogleFonts.getFont(
                                    'Plus Jakarta Sans',
                                    color: const Color(0xFF20A4CD),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 11.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
