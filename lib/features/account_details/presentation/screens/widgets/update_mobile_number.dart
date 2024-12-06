import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:messagecentral/core/base/features/countrycode/domain/entity/country_code_entity.dart';
import 'package:messagecentral/core/base/features/countrycode/presentation/screens/countrycode_screen.dart';
import 'package:messagecentral/core/base/features/countrycode/presentation/screens/widgets/form_filedController.dart';
import 'package:messagecentral/core/constants/app_colors.dart';
import 'package:messagecentral/core/global_widgets/custom_button.dart';
import 'package:messagecentral/core/utils/mix_pannel.dart';

import 'package:messagecentral/core/utils/validator.dart';
import 'package:messagecentral/features/account_details/presentation/screens/bloc/update_phone_no_bloc.dart';
import 'package:messagecentral/features/account_details/presentation/screens/bloc/update_phone_no_event.dart';
import 'package:messagecentral/features/account_details/presentation/screens/bloc/update_phone_no_get_otp_bloc.dart';
import 'package:messagecentral/features/account_details/presentation/screens/bloc/update_phone_no_get_otp_event.dart';
import 'package:messagecentral/features/account_details/presentation/screens/bloc/update_phone_no_get_otp_state.dart';
import 'package:messagecentral/features/account_details/presentation/screens/bloc/update_phone_no_state.dart';
import 'package:messagecentral/features/find_by_customer_id/presentation/bloc/find_by_customer_id_bloc.dart';
import 'package:messagecentral/features/find_by_customer_id/presentation/bloc/find_by_customer_id_event.dart';

import 'package:stop_watch_timer/stop_watch_timer.dart';

import '../../../../../core/base/features/countrycode/presentation/screens/cubit/country_code_cubit.dart';
import '../../../../../core/base/features/countrycode/presentation/screens/cubit/country_code_cubit_state.dart';

class UpdateMobileNumberWidget extends StatefulWidget {
  const UpdateMobileNumberWidget({super.key});

  @override
  State<UpdateMobileNumberWidget> createState() =>
      _UpdateMobileNumberWidgetState();
}

class _UpdateMobileNumberWidgetState extends State<UpdateMobileNumberWidget>
    with Validator {
  int timerMilliseconds = 60000;
  String timerValue = StopWatchTimer.getDisplayTime(
    60000,
    hours: false,
    milliSecond: false,
  );
  TextEditingController otpcontroller = TextEditingController();
  TextEditingController phoneNumbercontroller = TextEditingController();
  final formKey2 = GlobalKey<FormState>();
  final formKey = GlobalKey<FormState>();
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
  FormFieldController<CountryData>? dropDownCountryCodeValueController;
  String selctedContryCodeValue = '';
  int otpStatus = 0;
  String verificationId = '';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(
                color: Colors.transparent,
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  width: MediaQuery.sizeOf(context).width >= 800
                      ? (MediaQuery.sizeOf(context).width * 0.4)
                      : (MediaQuery.sizeOf(context).width * 0.95),
                  decoration: BoxDecoration(
                    color: AppColors.primaryBackground,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 20.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Update Mobile Number',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0,
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  // _model.otpStatus = 0;
                                });
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.close,
                                color: Color(0xFF42526D),
                                size: 24.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 1.0,
                        color: Color(0xFFDFE2E6),
                      ),
                      if (otpStatus == 0)
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 0.0),
                          child: Text(
                            'Enter new mobile number',
                            style: TextStyle(
                              color: AppColors.primaryText,
                              fontWeight: FontWeight.normal,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      if (otpStatus == 0)
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 5.0, 20.0, 20.0),
                          child: Form(
                              key: formKey,
                              child: Material(
                                color: Colors.transparent,
                                elevation: 0.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.0),
                                    border: Border.all(
                                      color: const Color(0xFFB3B9C4),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: BlocConsumer<CountryCodeCubit,
                                                CountryCodeState>(
                                            builder: (_, state) {
                                              return state.when(
                                                initial: () =>
                                                    CountryCodeDropDown<
                                                        CountryData>(
                                                  elevation: 0.0,
                                                  hidesUnderline: true,
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderWidth: 0.0,
                                                  borderRadius: 0.0,
                                                  margin:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0.0, 4.0, 0.0, 4.0),
                                                  width: 70.w,
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
                                                  options:const [],
                                                  optionLabels: const [],
                                                  textStyle: TextStyle(
                                                    color:
                                                        const Color(0xFF243757),
                                                    fontSize: MediaQuery.sizeOf(
                                                                    context)
                                                                .width <=
                                                            479.0
                                                        ? 11.0
                                                        : 14.0,
                                                  ),
                                                  searchHintTextStyle:
                                                      TextStyle(
                                                    color:
                                                        const Color(0xFF243757),
                                                    fontSize: MediaQuery.sizeOf(
                                                                    context)
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
                                                      Colors.transparent,
                                                  borderWidth: 0.0,
                                                  borderRadius: 0.0,
                                                  hidesUnderline: true,
                                                  margin:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0.0, 4.0, 0.0, 4.0),
                                                  width: 70.w,
                                                  hintText: 'Country code*',
                                                  searchHintText:
                                                      'Search for a country',
                                                  isSearchable: true,
                                                  icon: const FaIcon(
                                                    FontAwesomeIcons.angleDown,
                                                    color: Color(0xFFB3B9C4),
                                                    size: 24.0,
                                                  ),
                                                  searchHintTextStyle:
                                                      TextStyle(
                                                    color:
                                                        const Color(0xFF243757),
                                                    fontSize: MediaQuery.sizeOf(
                                                                    context)
                                                                .width <=
                                                            479.0
                                                        ? 11.0
                                                        : 14.0,
                                                  ),
                                                  controller:
                                                      dropDownCountryCodeValueController ??=
                                                          dropDownCountryCodeValueControllerInitial,
                                                  options: const [],
                                                  optionLabels: const [],
                                                  textStyle: TextStyle(
                                                    color:
                                                        const Color(0xFF243757),
                                                    fontSize: MediaQuery.sizeOf(
                                                                    context)
                                                                .width <=
                                                            479.0
                                                        ? 11.0
                                                        : 14.0,
                                                  ),
                                                ),
                                                success: (CountryCodeEntity
                                                        entity) =>
                                                    CountryCodeDropDown<
                                                        CountryData>(
                                                  elevation: 0.0,
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderWidth: 0.0,
                                                  borderRadius: 0.0,
                                                  margin:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0.0, 4.0, 0.0, 4.0),
                                                  width: 70.w,
                                                  hidesUnderline: true,
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
                                                  options: entity.data ?? [],
                                                  searchHintTextStyle:
                                                      TextStyle(
                                                    color:
                                                        const Color(0xFF243757),
                                                    fontSize: MediaQuery.sizeOf(
                                                                    context)
                                                                .width <=
                                                            479.0
                                                        ? 11.0
                                                        : 14.0,
                                                  ),
                                                  // optionLabels: (entity.data!) as List,
                                                  textStyle: TextStyle(
                                                    color:
                                                        const Color(0xFF243757),
                                                    fontSize: MediaQuery.sizeOf(
                                                                    context)
                                                                .width <=
                                                            479.0
                                                        ? 11.0
                                                        : 14.0,
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
                                                          0.0, 4.0, 10.0, 4.0),
                                                  hidesUnderline: true,
                                                  width: 70.w,
                                                  height: 50.0,
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
                                                    fontSize: MediaQuery.sizeOf(
                                                                    context)
                                                                .width <=
                                                            479.0
                                                        ? 11.0
                                                        : 14.0,
                                                  ),
                                                ),
                                              );
                                            },
                                            listener: (context, state) {}),
                                      ),
                                      Expanded(
                                        flex: 6,
                                        child: SizedBox(
                                          width: 100.0,
                                          child: TextFormField(
                                            controller: phoneNumbercontroller,
                                            readOnly: otpStatus == 1,
                                            obscureText: false,
                                            decoration: const InputDecoration(
                                              hintText: 'Enter Mobile No',
                                              hintStyle: TextStyle(
                                                color: Color(0xFF98A1B0),
                                                fontWeight: FontWeight.normal,
                                                fontSize: 14.0,
                                              ),
                                              enabledBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              focusedErrorBorder:
                                                  InputBorder.none,
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(15.0, 15.0,
                                                          15.0, 15.0),
                                            ),
                                            style: const TextStyle(
                                              color: AppColors.primaryText,
                                              fontSize: 14.0,
                                            ),
                                            onFieldSubmitted: (value) {
                                              phoneNumbercontroller.text =
                                                  value;
                                            },
                                            keyboardType: TextInputType.phone,
                                            validator: validateMobileNumber,
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp('[0-9]'))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ),
                      
                      
                      if (otpStatus == 1)
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 20.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFCAF2FF),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: const Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 12.0, 12.0, 12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.circleInfo,
                                    color: Color(0xFF0F8AB0),
                                    size: 20.0,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'We\'ve sent OTP to your new number. Please enter before it is expired.',
                                        style: TextStyle(
                                          color: Color(0xFF243757),
                                          fontWeight: FontWeight.normal,
                                          fontSize: 11.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                     
                      if (otpStatus == 1)
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: Text(
                            'Enter OTP',
                            style: TextStyle(
                              color: AppColors.primaryText,
                              fontWeight: FontWeight.normal,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      Form(
                        key: formKey2,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Visibility(
                          visible: otpStatus == 1,
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 5.0, 20.0, 0.0),
                            child: TextFormField(
                              controller: otpcontroller,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintStyle: const TextStyle(
                                  color: Color(0xFF98A1B0),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.0,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xFFB3B9C4),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xFFB3B9C4),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xFFB3B9C4),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xFFB3B9C4),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                contentPadding:
                                    const EdgeInsetsDirectional.fromSTEB(
                                        15.0, 15.0, 15.0, 15.0),
                              ),
                              style: const TextStyle(
                                color: AppColors.primaryText,
                                fontSize: 14.0,
                              ),
                              keyboardType: TextInputType.number,
                              validator: validateOTP,
                              onFieldSubmitted: (value) {
                                otpcontroller.text = value;
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('[0-9]'))
                              ],
                            ),
                          ),
                        ),
                      ),
                      if (otpStatus == 2)
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 20.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFDDF3E6),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            // ignore: prefer_const_constructors
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 12.0, 12.0, 12.0),
                              child: const Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.check_circle,
                                    color: Color(0xFF11984A),
                                    size: 24.0,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Mobile number updated',
                                        style: TextStyle(
                                          color: Color(0xFF084B25),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      if ((otpStatus == 0) || (otpStatus == 1))
                        Align(
                          alignment: const AlignmentDirectional(0.00, 0.00),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 20.0, 20.0, 20.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 5.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                         MixPanelAnalyticsManager().sendEvent('account details_update_mobile_cancel', 'Account details update mobile cancel', null);
                                        Navigator.pop(context);
                                        setState(() {
                                          otpStatus = 0;
                                        });
                                      },
                                      text: 'Cancel',
                                      options: FFButtonOptions(
                                        height: 44.0,
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(12.0, 0.0, 12.0, 0.0),
                                        iconPadding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                        color: const Color(0x00FFFFFF),
                                        textStyle: const TextStyle(
                                          color: Color(0xFF2861B4),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14.0,
                                        ),
                                        elevation: 0.0,
                                        borderSide: const BorderSide(
                                          color: Color(0x00FFFFFF),
                                          width: 0.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        hoverElevation: 0.0,
                                      ),
                                      showLoadingIndicator: false,
                                    ),
                                  ),
                                ),
                                if (otpStatus == 0)
                                  Expanded(
                                    child: BlocListener<UpdatePhoneNoGetOtpBloc,
                                        UpdatePhoneNoGetOtpState>(
                                      listener: (context, state) {
                                        if (state
                                                is UpdatePhoneNoGetOtpStateSuccess &&
                                            state.updatePhoneNumberEntity
                                                    ?.phoneData !=
                                                null) {
                                          setState(() {
                                            otpStatus = 1;
                                            verificationId = state
                                                    .updatePhoneNumberEntity
                                                    ?.phoneData
                                                    ?.verificationId ??
                                                "";
                                          });
                                        }
                                        if (state
                                            is UpdatePhoneNoGetOtpStateError) {
                                          showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                alignment:
                                                    const Alignment(0.0, 0.0),
                                                content: Text(state.dioError!),
                                                actions: [
                                                  ElevatedButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: const Text("OK")),
                                                ],
                                              );
                                            },
                                          );
                                        }
                                      },
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          MixPanelAnalyticsManager().sendEvent('account_details_update_mobile_send_otp', 'Account details update mobile send otp', null);
                                          if (selctedContryCodeValue
                                                  .isNotEmpty &&
                                              phoneNumbercontroller
                                                  .text.isNotEmpty) {
                                            if (phoneNumbercontroller
                                                    .text.length >=
                                                7) {
                                              context
                                                  .read<
                                                      UpdatePhoneNoGetOtpBloc>()
                                                  .add(GetUpdatePhoneNoGetOtpPressed(
                                                      phoneNumber:
                                                          phoneNumbercontroller
                                                              .text,
                                                      countryCode:
                                                          selctedContryCodeValue));
                                            } else {
                                              showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    alignment: const Alignment(
                                                        0.0, 0.0),
                                                    content: const Text(
                                                        "Invalid mobile number"),
                                                    actions: [
                                                      ElevatedButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext),
                                                          child:
                                                              const Text("OK")),
                                                    ],
                                                  );
                                                },
                                              );
                                            }
                                          } else if (selctedContryCodeValue
                                              .isEmpty) {
                                            showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  alignment:
                                                      const Alignment(0.0, 0.0),
                                                  content: const Text(
                                                      "Please select country code"),
                                                  actions: [
                                                    ElevatedButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child:
                                                            const Text("OK")),
                                                  ],
                                                );
                                              },
                                            );
                                          } else if (phoneNumbercontroller
                                              .text.isEmpty) {
                                            showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  alignment:
                                                      const Alignment(0.0, 0.0),
                                                  content: const Text(
                                                      "Please select mobile number"),
                                                  actions: [
                                                    ElevatedButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child:
                                                            const Text("OK")),
                                                  ],
                                                );
                                              },
                                            );
                                          }
                                        },
                                        text: 'Send  OTP',
                                        options: FFButtonOptions(
                                          height: 44.0,
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                          color: const Color(0xFF2861B4),
                                          textStyle: const TextStyle(
                                            color: AppColors.whiteTextColor,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14.0,
                                          ),
                                          borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                          hoverElevation: 5.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                if (otpStatus == 1)
                                  Expanded(
                                    child: BlocListener<UpdatePhoneNoBloc,
                                        UpdatePhoneNoState>(
                                      listener: (context, state) {
                                        if (state
                                            is UpdatePhoneNoStateSuccess) {
                                          context
                                              .read<FindByCustomerIdBloc>()
                                              .add(
                                                  const FindByCustomerIdCall());
                                          otpcontroller.clear();
                                          Navigator.of(context).pop();
                                        }

                                        if (state is UpdatePhoneNoStateError) {
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
                                                      child: const Text("OK")),
                                                ],
                                              );
                                            },
                                          );
                                        }
                                      },
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          context
                                              .read<UpdatePhoneNoBloc>()
                                              .add(GetUpdatePhoneNoPressed(
                                                verificationId: verificationId,
                                                phoneNumber:
                                                    phoneNumbercontroller.text,
                                                countryCode:
                                                    selctedContryCodeValue,
                                                otp: otpcontroller.text,
                                              ));

                                           MixPanelAnalyticsManager().sendEvent('account_details_update_mobile_confirm_otp', 'Account details update mobile confirm otp', null);
                                        },
                                        text: 'Verify',
                                        options: FFButtonOptions(
                                          height: 44.0,
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                          color: const Color(0xFF2861B4),
                                          textStyle: const TextStyle(
                                            color: AppColors.whiteTextColor,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14.0,
                                          ),
                                          borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                          hoverElevation: 5.0,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
