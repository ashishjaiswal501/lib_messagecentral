// ignore_for_file: unused_element

import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:messagecentral/core/base/features/countrycode/domain/entity/country_code_entity.dart';
import 'package:messagecentral/core/base/features/countrycode/presentation/screens/countrycode_screen.dart';
import 'package:messagecentral/core/base/features/countrycode/presentation/screens/cubit/country_code_cubit.dart';
import 'package:messagecentral/core/base/features/countrycode/presentation/screens/cubit/country_code_cubit_state.dart';
import 'package:messagecentral/core/base/features/countrycode/presentation/screens/widgets/form_filedController.dart';
import 'package:messagecentral/core/global_widgets/flutter_timer.dart';
import 'package:messagecentral/core/global_widgets/global_widgets.dart';
import 'package:messagecentral/core/utils/app_environment.dart';
import 'package:messagecentral/core/utils/firebase_analytics_functions.dart';
import 'package:messagecentral/core/utils/local_state_cache.dart';
import 'package:messagecentral/core/utils/mix_pannel.dart';
import 'package:messagecentral/core/utils/responsive_layout.dart';
import 'package:messagecentral/core/utils/validator.dart';
import 'package:messagecentral/features/signup/presentation/bloc/resend_otp_bloc.dart';
import 'package:messagecentral/features/signup/presentation/bloc/resend_otp_event.dart';
import 'package:messagecentral/features/signup/presentation/bloc/resend_otp_state.dart';
import 'package:messagecentral/features/signup/presentation/bloc/signup_bloc.dart';
import 'package:messagecentral/features/signup/presentation/bloc/signup_event.dart';
import 'package:messagecentral/features/signup/presentation/bloc/signup_otp_bloc.dart';
import 'package:messagecentral/features/signup/presentation/bloc/signup_otp_state.dart';
import 'package:messagecentral/features/signup/presentation/bloc/signup_otp_verify_bloc.dart';
import 'package:messagecentral/features/signup/presentation/bloc/signup_otp_verify_event.dart';
import 'package:messagecentral/features/signup/presentation/bloc/signup_otp_verify_state.dart';
import 'package:messagecentral/features/signup/presentation/bloc/singup_otp_event.dart';

import 'package:messagecentral/user_cache_manager/bloc/user_cache_manager_bloc.dart';
import 'package:provider/provider.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class SignupOtpDetails extends StatefulWidget {
  const SignupOtpDetails(
      {super.key, required this.customId, required this.authToken, this.onTap});

  final String authToken;
  final String customId;
  final void Function()? onTap;

  @override
  State<SignupOtpDetails> createState() => _SignupOtpDetails();
}

Timer? _resendTimer;

class _SignupOtpDetails extends State<SignupOtpDetails> with Validator {
  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  final TextEditingController _mobileNumberController = TextEditingController();
  final FocusNode _mobileNumberControllerFocus = FocusNode();
  final TextEditingController _otpController = TextEditingController();
  final FocusNode _otpControllerFocus = FocusNode();
  final TextEditingController _countryCodeController = TextEditingController();
  final FocusNode _countryCodeControllerFocus = FocusNode();

  bool verifyOtp = false;
  String otpVerificationId = "";
  String customerId = '';
  String authToken = "";
  int resendCountdown = 60; // Initial countdown time in seconds
  bool isResendEnabled = true; // Flag to check if resend is enabled
  bool callResendFun = true;

  bool enableResendOtp = false;
  int timerMilliseconds = 60000;
  String timerValue = StopWatchTimer.getDisplayTime(
    60000,
    hours: false,
    milliSecond: false,
  );
  StopWatchTimer timerController =
      StopWatchTimer(mode: StopWatchMode.countDown);
  final dropDownCountryCodeValueControllerInitial =
      FormFieldController<CountryData>(CountryData(
          id: 0,
          phoneCode: '91',
          isoCountryCode: '91',
          name: 'India',
          maxLength: 10,
          minLength: 0));
  @override
  void dispose() {
    super.dispose();
    _countryCodeController.dispose();
    _mobileNumberController.dispose();
    _otpController.dispose();
    _mobileNumberControllerFocus.dispose();
    _otpControllerFocus.dispose();
    _countryCodeControllerFocus.dispose();
  }

  @override
  void initState() {
    super.initState();
    MixPanelAnalyticsManager()
        .sendEvent('signup_mobile_landing', 'Sign up mobile landing', null);

    setScreenFirebase('signup_mobile_landing', 'Sign up mobile landing');
  }

  // Function to handle OTP request
  void requestOtp() {
    if (selctedContryCodeValue.isNotEmpty &&
        _mobileNumberController.text.isNotEmpty) {
      formKey.currentState!.save();
      context.read<SignupOtpBloc>().add(
            GetSignupOtpPressedsButton(
              countryCode: selctedContryCodeValue,
              phoneNo: _mobileNumberController.text,
              customerId: widget.customId,
              authToken: widget.authToken,
            ),
          );
    } else if (selctedContryCodeValue.isEmpty) {
      showDialog(
        context: context,
        builder: (alertDialogContext) {
          return AlertDialog(
            alignment: const Alignment(0.65, 0.0),
            content: const Text("Please select country code"),
            actions: [
              ElevatedButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: const Text("OK")),
            ],
          );
        },
      );
    } else if (_mobileNumberController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (alertDialogContext) {
          return AlertDialog(
            alignment: const Alignment(0.65, 0.0),
            content: const Text("Please select mobile number"),
            actions: [
              ElevatedButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: const Text("OK")),
            ],
          );
        },
      );
    }
  }

  // Function to handle OTP verification

  void verifyOtpRequest() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      context.read<SignupOtpVerifyBloc>().add(
            GetSignupVerifyOtpPressedButton(
              otpVerificationId: otpVerificationId,
              otp: _otpController.text,
              customerId: customerId,
              authToken: widget.authToken,
            ),
          );
      MixPanelAnalyticsManager().sendConversionEvent(
        'signup_mobile_verify_otp',
        'signup mobile verify otp',
        null,
        '/signUp',
        Uri.base.toString(),
      );
    }
  }

  void resendOtpRequest() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      context.read<ResendOtpBloc>().add(
            GetResendOtpPressedButton(
              email: "",
              phoneCode: selctedContryCodeValue,
              phoneNo: _mobileNumberController.text,
            ),
          );
    }
  }

  FormFieldController<CountryData>? dropDownCountryCodeValueController;
  String selctedContryCodeValue = '';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupOtpBloc, SignupOtpState>(
        builder: (context, state) => Form(
              key: formKey,
              child: BlocBuilder<SignupOtpVerifyBloc, SignupOtpVerifyState>(
                  builder: (context, snapshot) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (state is SignupOtpStateError &&
                        state.responseCode == 13)
                      Container(
                        margin: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 10.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFCD3D0),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(
                                FontAwesomeIcons.solidCircleXmark,
                                color: Colors.red,
                                size: 24.0,
                              ),
                              Expanded(
                                child: Align(
                                  alignment:
                                      const AlignmentDirectional(-1.00, 0.00),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Text(
                                      state.dioError!,
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Color(0xFFC13A31),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    if (state is SignupOtpStateError &&
                        state.responseCode == 711)
                      Container(
                        margin: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 10.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFCD3D0),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(
                                FontAwesomeIcons.solidCircleXmark,
                                color: Colors.red,
                                size: 24.0,
                              ),
                              Expanded(
                                child: Align(
                                  alignment:
                                      const AlignmentDirectional(-1.00, 0.00),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Text(
                                      state.dioError!,
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Color(0xFFC13A31),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    if (snapshot.dioError == "WRONG_OTP_PROVIDED")
                      Container(
                        margin: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 10.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFCD3D0),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                FontAwesomeIcons.solidCircleXmark,
                                color: Colors.red,
                                size: 24.0,
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(-1.00, 0.00),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text(
                                      "Incorrect OTP!",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Color(0xFFC13A31),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    if (state is SignupOtpStateError &&
                        state.responseCode == 400)
                      Container(
                        margin: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 10.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFCD3D0),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(
                                FontAwesomeIcons.solidCircleXmark,
                                color: Colors.red,
                                size: 24.0,
                              ),
                              Expanded(
                                child: Align(
                                  alignment:
                                      const AlignmentDirectional(-1.00, 0.00),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Text(
                                      state.dioError!,
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Color(0xFFC13A31),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    if (state is SignupOtpStateError &&
                        state.responseCode == 506)
                      Container(
                        margin: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 10.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFCD3D0),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                FontAwesomeIcons.solidCircleXmark,
                                color: Colors.red,
                                size: 24.0,
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(-1.00, 0.00),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text(
                                      "Request already exists please try again after 60 seconds.",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Color(0xFFC13A31),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    if (state is SignupOtpStateError &&
                        state.responseCode == 503)
                      Container(
                        margin: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 10.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFCD3D0),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(
                                FontAwesomeIcons.solidCircleXmark,
                                color: Colors.red,
                                size: 24.0,
                              ),
                              Expanded(
                                child: Align(
                                  alignment:
                                      const AlignmentDirectional(-1.00, 0.00),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Text(
                                      state.dioError!,
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Color(0xFFC13A31),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          width: double.maxFinite,
                          child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            spacing: 15.0,
                            runSpacing: 15.0,
                            children: [
                              LayoutBuilder(builder: (context, contraintBox) {
                                return SizedBox(
                                  width: isDesktop(context) || isTablet(context)
                                      ? contraintBox.maxWidth * 0.48
                                      : contraintBox.maxWidth,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Country Code',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium!
                                            .copyWith(
                                              color: const Color(0xFF243757),
                                              fontSize: 14.0,
                                            ),
                                      ),
                                      ScreenUtil().setVerticalSpacing(4),
                                      BlocConsumer<CountryCodeCubit,
                                              CountryCodeState>(
                                          builder: (_, state) {
                                            return state.when(
                                              initial: () =>
                                                  CountryCodeDropDown<
                                                      CountryData>(
                                                elevation: 0.0,
                                                borderColor:
                                                    const Color(0xFFB3B9C4),
                                                borderWidth: 1.0,
                                                borderRadius: 4.0,
                                                fillColor:
                                                    const Color(0xFFFFFFFF),
                                                margin:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        0.0, 4.0, 16.0, 4.0),
                                                hidesUnderline: true,
                                                width: isDesktop(context) ||
                                                        isTablet(context)
                                                    ? contraintBox.maxWidth *
                                                        0.48
                                                    : contraintBox.maxWidth,
                                                height: 44.0,
                                                hintText: 'Country code*',
                                                searchHintText:
                                                    'Search for a country',
                                                isSearchable: true,
                                                icon: const FaIcon(
                                                  FontAwesomeIcons.angleDown,
                                                  color: Color(0xFFB3B9C4),
                                                  size: 24.0,
                                                ),
                                                controller:
                                                    dropDownCountryCodeValueController ??=
                                                        dropDownCountryCodeValueControllerInitial,
                                                options: const [],
                                                optionLabels: const [],
                                                textStyle: TextStyle(
                                                  color:
                                                      const Color(0xFF243757),
                                                  fontSize:
                                                      MediaQuery.sizeOf(context)
                                                                  .width <=
                                                              479.0
                                                          ? 11.0
                                                          : 14.0,
                                                ),
                                                searchHintTextStyle: TextStyle(
                                                  color:
                                                      const Color(0xFF243757),
                                                  fontSize:
                                                      MediaQuery.sizeOf(context)
                                                                  .width <=
                                                              479.0
                                                          ? 11.0
                                                          : 14.0,
                                                ),
                                              ),
                                              loading: () =>
                                                  CountryCodeDropDown<
                                                      CountryData>(
                                                elevation: 0.0,
                                                borderColor:
                                                    const Color(0xFFB3B9C4),
                                                borderWidth: 1.0,
                                                borderRadius: 4.0,
                                                fillColor:
                                                    const Color(0xFFFFFFFF),
                                                margin:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        0.0, 4.0, 16.0, 4.0),
                                                hidesUnderline: true,
                                                width: isDesktop(context) ||
                                                        isTablet(context)
                                                    ? contraintBox.maxWidth *
                                                        0.48
                                                    : contraintBox.maxWidth,
                                                height: 44.0,
                                                hintText: 'Country code*',
                                                searchHintText:
                                                    'Search for a country',
                                                isSearchable: true,
                                                icon: const FaIcon(
                                                  Icons
                                                      .keyboard_arrow_down_outlined,
                                                  color: Color(0xFFB3B9C4),
                                                  size: 24.0,
                                                ),
                                                searchHintTextStyle:
                                                    const TextStyle(
                                                  color: Color(0xFF243757),
                                                  fontSize: 14,
                                                ),
                                                controller:
                                                    dropDownCountryCodeValueController ??=
                                                        dropDownCountryCodeValueControllerInitial,
                                                options: const [],
                                                optionLabels: const [],
                                                textStyle: const TextStyle(
                                                  color: Color(0xFF243757),
                                                  fontSize: 14.0,
                                                ),
                                              ),
                                              success:
                                                  (CountryCodeEntity entity) =>
                                                      CountryCodeDropDown<
                                                          CountryData>(
                                                elevation: 0.0,
                                                disabled: verifyOtp,
                                                borderColor:
                                                    const Color(0xFFB3B9C4),
                                                borderWidth: 1.0,
                                                borderRadius: 4.0,
                                                fillColor:
                                                    const Color(0xFFFFFFFF),
                                                margin:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        0.0, 4.0, 16.0, 4.0),
                                                hidesUnderline: true,
                                                width: isDesktop(context) ||
                                                        isTablet(context)
                                                    ? contraintBox.maxWidth *
                                                        0.48
                                                    : contraintBox.maxWidth,
                                                height: 44.0,
                                                hintText: 'Country code*',
                                                searchHintText:
                                                    'Search for a country',

                                                isSearchable: true,
                                                icon: const FaIcon(
                                                  Icons
                                                      .keyboard_arrow_down_outlined,
                                                  color: Color(0xFFB3B9C4),
                                                  size: 24.0,
                                                ),
                                                controller:
                                                    dropDownCountryCodeValueController ??=
                                                        dropDownCountryCodeValueControllerInitial,
                                                options: entity.data ?? [],
                                                searchHintTextStyle:
                                                    const TextStyle(
                                                  color: Color(0xFF98A1B0),
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 14.0,
                                                ),
                                                // optionLabels: (entity.data!) as List,
                                                textStyle: const TextStyle(
                                                  color: Color(0xFF243757),
                                                  fontSize: 14.0,
                                                ),
                                                onChanged: (value) {
                                                  setState(() {
                                                    selctedContryCodeValue =
                                                        value!.phoneCode!;
                                                  });
                                                },
                                              ),
                                              error: (String error) =>
                                                  CountryCodeDropDown<
                                                      CountryData>(
                                                elevation: 0.0,
                                                borderColor:
                                                    const Color(0xFFB3B9C4),
                                                borderWidth: 1.0,
                                                borderRadius: 4.0,
                                                fillColor:
                                                    const Color(0xFFFFFFFF),
                                                margin:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        0.0, 4.0, 16.0, 4.0),
                                                hidesUnderline: true,
                                                width: isDesktop(context) ||
                                                        isTablet(context)
                                                    ? contraintBox.maxWidth *
                                                        0.48
                                                    : contraintBox.maxWidth,
                                                height: 44.0,
                                                hintText: 'Country code*',
                                                searchHintText:
                                                    'Search for a country',
                                                isSearchable: true,
                                                icon: const FaIcon(
                                                  Icons
                                                      .keyboard_arrow_down_outlined,
                                                  color: Color(0xFFB3B9C4),
                                                  size: 24.0,
                                                ),
                                                controller:
                                                    dropDownCountryCodeValueController ??=
                                                        dropDownCountryCodeValueControllerInitial,
                                                options: const [],
                                                optionLabels: const [],
                                                textStyle: TextStyle(
                                                  color:
                                                      const Color(0xFF243757),
                                                  fontSize:
                                                      MediaQuery.sizeOf(context)
                                                                  .width <=
                                                              479.0
                                                          ? 11.0
                                                          : 14.0,
                                                ),
                                              ),
                                            );
                                          },
                                          listener: (context, state) {}),
                                    ],
                                  ),
                                );
                              }),
                              LayoutBuilder(builder: (context, contraintBox) {
                                return SizedBox(
                                  width: isDesktop(context) || isTablet(context)
                                      ? contraintBox.maxWidth * 0.48
                                      : contraintBox.maxWidth,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Mobile Number',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium!
                                            .copyWith(
                                              color: const Color(0xFF243757),
                                              fontSize: 14.0,
                                            ),
                                      ),
                                      ScreenUtil().setVerticalSpacing(4),
                                      TextFormField(
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                          FilteringTextInputFormatter.deny(
                                              RegExp(r'^0+')),
                                        ],
                                        controller: _mobileNumberController,
                                        obscureText: false,
                                        decoration: const InputDecoration(
                                            hintText: '1234-5678',
                                            hintStyle: TextStyle(
                                              color: Color(0xFF98A1B0),
                                              fontWeight: FontWeight.normal,
                                              fontSize: 14.0,
                                            )),
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        enabled:
                                            verifyOtp == true ? false : true,
                                        focusNode: _mobileNumberControllerFocus,
                                        textInputAction: TextInputAction.done,
                                        style: const TextStyle(
                                            color: Color(0xFF243757),
                                            fontSize: 14),
                                        keyboardType: TextInputType.number,
                                        onFieldSubmitted: (value) {
                                          _mobileNumberController.text = value;
                                          FocusScope.of(context).requestFocus(
                                              _mobileNumberControllerFocus);
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              })
                            ],
                          ),
                        ),
                      ],
                    ),
                    ScreenUtil().setVerticalSpacing(32),
                    if (verifyOtp)
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 24.0),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFCAF2FF),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 12.0, 12.0, 12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    const FaIcon(
                                      // ignore: deprecated_member_use
                                      FontAwesomeIcons.infoCircle,
                                      color: Color(0xFF0F8AB0),
                                      size: 24.0,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(12.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Enter OTP that we\'ve sent to your mobile number',
                                          style: GoogleFonts.getFont(
                                            'Plus Jakarta Sans',
                                            color: const Color(0xFF067699),
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ScreenUtil().setVerticalSpacing(16),
                            TextFormField(
                              controller: _otpController,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration:
                                  const InputDecoration(hintText: 'Enter OTP'),
                              obscureText: false,
                              focusNode: _otpControllerFocus,
                              textInputAction: TextInputAction.done,
                              style: const TextStyle(
                                  color: Color(0xFF243757), fontSize: 14),
                              keyboardType: TextInputType.text,
                              onFieldSubmitted: (value) {
                                _otpController.text = value;
                                FocusScope.of(context)
                                    .requestFocus(_otpControllerFocus);
                              },
                              //  validator: validateOTPNumber,
                            ),
                          ],
                        ),
                      ),
                    ScreenUtil().setVerticalSpacing(16),
                    Visibility(
                        visible: verifyOtp,
                        replacement: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0.1,
                            minimumSize: const Size(double.infinity, 52),
                          ),
                          onPressed: state == const SignupOtpLoading()
                              ? null
                              : () => requestOtp(),
                          child: Visibility(
                              visible: state != const SignupOtpLoading(),
                              replacement: GlobalWidgets.loadingWidget(),
                              child: const Text("Request OTP")),
                        ),
                        child: BlocConsumer<SignupOtpVerifyBloc,
                            SignupOtpVerifyState>(
                          listener: (context, state) {
                            if (state is SignupOtpVerifyStateSuccess &&
                                state.signupVerifyOtpEntity?.userData != null) {
                              Provider.of<UserCacheManagerBloc>(context,
                                      listen: false)
                                  .loginSession();
                            }
                          },
                          builder: (context, state2) => ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0.1,
                              minimumSize: const Size(double.infinity, 52),
                            ),
                            onPressed:
                                state2 == const SignupOtpVerifyStateLoading()
                                    ? null
                                    : () => verifyOtpRequest(),
                            child: Visibility(
                                visible: state2 !=
                                    const SignupOtpVerifyStateLoading(),
                                replacement: GlobalWidgets.loadingWidget(),
                                child: const Text("Verify")),
                          ),
                        )),
                    ScreenUtil().setVerticalSpacing(32),
                    Row(
                      children: [
                        if (verifyOtp)
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Back to the previous step',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .copyWith(
                                          color: const Color(0xFF20A4CD),
                                          fontSize: 11.0,
                                          letterSpacing: 0,
                                        ),
                                    mouseCursor: SystemMouseCursors.click,
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        context
                                            .read<SignupBloc>()
                                            .add(BackToPreviousStepEvent());
                                        widget.onTap?.call();
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        if (verifyOtp)
                          Expanded(
                            child: Visibility(
                              visible: enableResendOtp,
                              replacement: !enableResendOtp
                                  ? Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
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
                              child: Align(
                                  alignment: Alignment.topRight,
                                  child: BlocListener<ResendOtpBloc,
                                          ResendOtpState>(
                                      child: InkWell(
                                        onTap: () {
                                          resendOtpRequest();
                                        },
                                        child: const Text(
                                          "Resend OTP",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFF20A4CD),
                                          ),
                                        ),
                                      ),
                                      listener: (constext, state) {
                                        if (state is ResendOtpStateSuccess) {
                                          setState(() {
                                            customerId = widget.customId;
                                            otpVerificationId = state
                                                .resendOtpEntity!
                                                .userData!
                                                .verificationId!;
                                          });
                                          timerController.onExecute
                                              .add(StopWatchExecute.start);
                                        }
                                        if (state is ResendOtpStateSuccess &&
                                            state.resendOtpEntity!
                                                    .responseCode ==
                                                506) {
                                          showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                alignment:
                                                    const Alignment(0.65, 0.0),
                                                content: Text(state
                                                    .resendOtpEntity!.message!),
                                                actions: [
                                                  ElevatedButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: const Text('OK'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }
                                        if (state is ResendOtpStateError) {
                                          showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                alignment:
                                                    const Alignment(0.65, 0.0),
                                                content: Text(state.dioError!),
                                                actions: [
                                                  ElevatedButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: const Text('OK'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }
                                      })),
                            ),
                          ),
                      ],
                    ),
                  ],
                );
              }),
            ),
        listener: (context, state) {
          if (state is SignupOtpStateSucces) {
            setState(() {
              verifyOtp = true;

              customerId = state.signupOtpEntity?.userData?.customerId ?? "";
              otpVerificationId =
                  state.signupOtpEntity?.userData?.otpVerificationId ?? "";
            });
            timerController.onExecute.add(StopWatchExecute.start);
            MixPanelAnalyticsManager().sendEvent(
                'signup_mobile_enter_otp_landing',
                'signup mobile enter otp landing',
                null);

            setScreenFirebase('signup_mobile_enter_otp_landing',
                'signup mobile enter otp landing');
            LocalStateCache().fName =
                state.signupOtpEntity?.userData?.fullName ?? "";
            LocalStateCache().emailId =
                state.signupOtpEntity?.userData?.email ?? "";
            LocalStateCache().phoneNo =
                state.signupOtpEntity?.userData?.mobileNumber ?? "";
            LocalStateCache().countryCode =
                state.signupOtpEntity?.userData?.countryCode ?? "";
            LocalStateCache().customerId =
                state.signupOtpEntity?.userData?.customerId ?? "";

            MixPanelAnalyticsManager().sendEvent(
                'signup_mobile_request_otp', 'Sign up mobile request otp', {
              'environment': FlavorConfig.instance!.env,
              'userName': state.signupOtpEntity?.userData?.fullName ?? "",
              'email': state.signupOtpEntity?.userData?.email ?? "",
              'countryCode': state.signupOtpEntity?.userData?.countryCode ?? "",
              'mobileNumber': _mobileNumberController.text,
              'customerID': state.signupOtpEntity?.userData?.customerId ?? "",
              'displayName': "Sign up mobile request otp"
            });
          }
        });
    // return BlocBuilder<SignupOtpBloc, SignupOtpState>(
    //   builder: (context, state) {
    //     // if (state is SignupVerifyOtpStateSuccess) {
    //     //   if (state.signupVerifyOtpEntity?.userData != null)
    //     //     BlocProvider.of<UserCacheManagerBloc>(context).loginSession();

    //     // }
    //     if (state is SignupOtpStateSuccess) {
    //       verifyOtp = true;
    //       otpVerificationId =
    //           state.signupOtpEntity?.userData?.otpVerificationId ?? "";
    //     }

    //     if (state is SignupVerifyOtpStateSuccess) {
    //       if (state.signupVerifyOtpEntity?.userData != null) {
    //        context.goNamed("login");
    //         getIt<UserCacheManagerBloc>().loginSession();

    //       }
    //     }
    //     if (state is SignupOtpStateSuccess) {
    //       verifyOtp = true;
    //       otpVerificationId =
    //           state.signupOtpEntity?.userData?.otpVerificationId ?? "";

    //                                         timerController.onExecute
    //                                             .add(StopWatchExecute.start);

    //     }

    //     return Form(
    //       key: formKey,
    //       autovalidateMode: AutovalidateMode.onUserInteraction,
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Row(
    //             children: [
    //               CountryCodeWidget(
    //                 controller: _countryCodeController,
    //                 focusNode: _countryCodeControllerFocus,
    //               ),
    //               const SizedBox(width: 16),
    //               Expanded(
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     Text(
    //                       'Mobile Number',
    //                       style:
    //                           Theme.of(context).textTheme.labelMedium!.copyWith(
    //                                 color: const Color(0xFF243757),
    //                                 fontSize: 14.0,
    //                               ),
    //                     ),
    //                     TextFormField(
    //                       controller: _mobileNumberController,
    //                       obscureText: false,
    //                       focusNode: _mobileNumberControllerFocus,
    //                       textInputAction: TextInputAction.done,
    //                       style: const TextStyle(
    //                           color: Color(0xFF243757), fontSize: 14),
    //                       keyboardType: TextInputType.text,
    //                       onFieldSubmitted: (value) {
    //                         _mobileNumberController.text = value;
    //                         FocusScope.of(context)
    //                             .requestFocus(_mobileNumberControllerFocus);
    //                       },
    //                       validator: !verifyOtp ? validateMobileNumber : null,
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //           ScreenUtil().setVerticalSpacing(32),
    //           if (verifyOtp || state.resendOtp)
    //             Padding(
    //               padding:
    //                   const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
    //               child: Column(
    //                 children: [
    //                   Container(
    //                     decoration: BoxDecoration(
    //                       color: const Color(0xFFCAF2FF),
    //                       borderRadius: BorderRadius.circular(4.0),
    //                     ),
    //                     child: Padding(
    //                       padding: const EdgeInsetsDirectional.fromSTEB(
    //                           12.0, 12.0, 12.0, 12.0),
    //                       child: Row(
    //                         mainAxisSize: MainAxisSize.max,
    //                         children: [
    //                           const FaIcon(
    //                             // ignore: deprecated_member_use
    //                             FontAwesomeIcons.infoCircle,
    //                             color: Color(0xFF0F8AB0),
    //                             size: 24.0,
    //                           ),
    //                           Expanded(
    //                             child: Padding(
    //                               padding: const EdgeInsetsDirectional.fromSTEB(
    //                                   12.0, 0.0, 0.0, 0.0),
    //                               child: Text(
    //                                 'Enter OTP that we\'ve sent to your mobile number',
    //                                 style: GoogleFonts.getFont(
    //                                   'Plus Jakarta Sans',
    //                                   color: const Color(0xFF067699),
    //                                   fontSize: 14.0,
    //                                 ),
    //                               ),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   ),
    //                   ScreenUtil().setVerticalSpacing(16),
    //                   TextFormField(
    //                     controller: _otpController,
    //                     decoration: InputDecoration(hintText: 'Enter OTP'),
    //                     obscureText: false,
    //                     focusNode: _otpControllerFocus,
    //                     textInputAction: TextInputAction.done,
    //                     style: const TextStyle(
    //                         color: Color(0xFF243757), fontSize: 14),
    //                     keyboardType: TextInputType.text,
    //                     onFieldSubmitted: (value) {
    //                       _otpController.text = value;
    //                       FocusScope.of(context)
    //                           .requestFocus(_otpControllerFocus);
    //                     },
    //                     //  validator: validateOTPNumber,
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ScreenUtil().setVerticalSpacing(16),
    //           if (!verifyOtp && state.resendOtp == false)
    //             ElevatedButton(
    //               style: ElevatedButton.styleFrom(
    //                 elevation: 0.1,
    //                 minimumSize: const Size(double.infinity, 52),
    //               ),
    //               onPressed: () => requestOtp(),
    //               child: const Text("Request OTP"),
    //             )
    //           else
    //             ElevatedButton(
    //               style: ElevatedButton.styleFrom(
    //                 elevation: 0.1,
    //                 minimumSize: const Size(double.infinity, 52),
    //               ),
    //               onPressed: () => verifyOtpRequest(),
    //               child: const Text("Verify"),
    //             ),
    //           ScreenUtil().setVerticalSpacing(32),
    //           Row(
    //             children: [
    //               if (verifyOtp)
    //                 Expanded(
    //                   child: GestureDetector(
    //                     onTap: () async {
    //                       context
    //                           .read<SignupBloc>()
    //                           .add(BackToPreviousStepEvent());
    //                     },
    //                     child: RichText(
    //                       text: TextSpan(
    //                         children: [
    //                           TextSpan(
    //                             text: 'Back to the previous step',
    //                             style: Theme.of(context)
    //                                 .textTheme
    //                                 .labelSmall!
    //                                 .copyWith(
    //                                   color: const Color(0xFF20A4CD),
    //                                   fontSize: 11.0,
    //                                   letterSpacing: 0,
    //                                 ),
    //                             mouseCursor: SystemMouseCursors.click,
    //                             recognizer: TapGestureRecognizer()
    //                               ..onTap = () async {
    //                                 context
    //                                     .read<SignupBloc>()
    //                                     .add(BackToPreviousStepEvent());
    //                               },
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //               if (verifyOtp)
    //                 Expanded(
    //                   child: Visibility(
    //                     visible: enableResendOtp,
    //                     replacement: !enableResendOtp
    //                         ? Row(
    //                             mainAxisSize: MainAxisSize.max,
    //                             mainAxisAlignment: MainAxisAlignment.end,
    //                             children: [
    //                               const Text(
    //                                 'Resend in ',
    //                                 style: TextStyle(
    //                                   color: Color(0xFF243757),
    //                                   fontWeight: FontWeight.normal,
    //                                   fontSize: 12.0,
    //                                 ),
    //                               ),
    //                               FlutterTimer(
    //                                 initialTime: timerMilliseconds,
    //                                 getDisplayTime: (value) =>
    //                                     StopWatchTimer.getDisplayTime(
    //                                   value,
    //                                   hours: false,
    //                                   milliSecond: false,
    //                                 ),
    //                                 timer: timerController,
    //                                 updateStateInterval:
    //                                     const Duration(milliseconds: 1000),
    //                                 onChanged:
    //                                     (value, displayTime, shouldUpdate) {
    //                                   timerMilliseconds = value;
    //                                   timerValue = displayTime;

    //                                   if (shouldUpdate) {
    //                                     setState(() {});
    //                                   }
    //                                 },
    //                                 onEnded: () async {
    //                                   timerController.onExecute
    //                                       .add(StopWatchExecute.reset);
    //                                   setState(() {
    //                                     enableResendOtp = true;
    //                                   });
    //                                 },
    //                                 textAlign: TextAlign.center,
    //                                 style: const TextStyle(
    //                                   color: Color(0xFF243757),
    //                                   fontWeight: FontWeight.bold,
    //                                   fontSize: 12.0,
    //                                 ),
    //                               ),
    //                               const Text(
    //                                 's',
    //                                 style: TextStyle(
    //                                   fontWeight: FontWeight.bold,
    //                                 ),
    //                               ),
    //                             ],
    //                           )
    //                         : const SizedBox.shrink(),
    //                     child: Align(
    //                       alignment: Alignment.topRight,
    //                       child: InkWell(
    //                         onTap: () {
    //                           resendOtpRequest();
    //                           setState(() {
    //                             timerController.onExecute
    //                                 .add(StopWatchExecute.start);
    //                             enableResendOtp = false;
    //                           });
    //                         },
    //                         child: const Text(
    //                           "Resend OTP",
    //                           style: TextStyle(
    //                             fontSize: 12,
    //                             color: Color(0xFF20A4CD),
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //             ],
    //           ),
    //         ],
    //       ),
    //     );

    //   },
    // );
  }
}
