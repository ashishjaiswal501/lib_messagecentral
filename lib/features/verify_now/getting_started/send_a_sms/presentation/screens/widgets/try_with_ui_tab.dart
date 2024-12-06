import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:messagecentral/core/base/features/countrycode/domain/entity/country_code_entity.dart';
import 'package:messagecentral/core/base/features/countrycode/presentation/screens/countrycode_screen.dart';
import 'package:messagecentral/core/base/features/countrycode/presentation/screens/cubit/country_code_cubit.dart';
import 'package:messagecentral/core/base/features/countrycode/presentation/screens/cubit/country_code_cubit_state.dart';
import 'package:messagecentral/core/base/features/countrycode/presentation/screens/widgets/form_filedController.dart';
import 'package:messagecentral/core/constants/api_end_points.dart';
import 'package:messagecentral/core/utils/flutter_flow_theme.dart';
import 'package:messagecentral/core/utils/local_state_cache.dart';
import 'package:messagecentral/core/utils/mix_pannel.dart';
import 'package:messagecentral/core/utils/responsive.dart';
import 'package:messagecentral/core/utils/validator.dart';
import 'package:messagecentral/features/add_credits/presentation/screens/add_credits_screen.dart';
import 'package:messagecentral/features/getuserdeails/presentation/bloc/get_user_details_bloc.dart';
import 'package:messagecentral/features/getuserdeails/presentation/bloc/get_user_details_event.dart';
import 'package:messagecentral/features/verify_now/analytics/presentation/bloc/sms_analytics_cubit.dart';
import 'package:messagecentral/features/verify_now/credits/presentation/bloc/payment_history_cubit.dart';
import 'package:messagecentral/features/verify_now/dashboard/presentation/bloc/dashboard_sms_bloc.dart';
import 'package:messagecentral/features/verify_now/dashboard/presentation/bloc/dashboard_sms_event.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/presentation/bloc/send_a_sms_bloc.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/presentation/bloc/send_a_sms_event.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/presentation/bloc/send_a_sms_state.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/presentation/bloc/stepone_registration_getdemo_bloc.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/presentation/bloc/stepone_registration_getdemo_event.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/presentation/bloc/stepone_registration_sgetdemo_state.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/presentation/screens/send_a_sms_screen.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/presentation/screens/widgets/register_popup_form.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/presentation/screens/widgets/sucess_popup_request_already_exists_widget.dart';

class PromotionMessage {
  final int srNo;
  final String templateData;
  final String description;

  PromotionMessage({
    required this.srNo,
    required this.templateData,
    required this.description,
  });

  factory PromotionMessage.fromJson(Map<String, dynamic> json) {
    return PromotionMessage(
      srNo: json['sr_no'],
      templateData: json['template_data'],
      description: json['description'],
    );
  }
}

class TryWithUITabSendSMS extends StatefulWidget {
  const TryWithUITabSendSMS({super.key});

  @override
  State<TryWithUITabSendSMS> createState() => _TryWithUITabSendSMSState();
}

class _TryWithUITabSendSMSState extends State<TryWithUITabSendSMS>
    with Validator {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  final FocusNode _mobileNumberControllerFocus = FocusNode();
  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  String selctedContryCodeValue = '';
  FormFieldController<CountryData>? dropDownCountryCodeValueController;
  bool isSubmitEnable = true;
  bool optSent = true;
  bool verificationStatus = false;
  bool verificationStatusSuccess = true;
  bool _isSearchVisible = false;
  bool isDropdownVisible = false;
  bool verifyOtp = false;
  String otpVerificationId = "";
  String customerId = '';
  String authToken = "";

  final dropDownCountryCodeValueControllerInitial =
      FormFieldController<CountryData>(CountryData(
          id: 0,
          phoneCode: '91',
          isoCountryCode: '91',
          name: 'India',
          maxLength: 10,
          minLength: 0));

  int calculateSmsCount(int charCount) {
    return (charCount / 160).ceil();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SendASmsBloc, SendASmsState>(
      listener: (context, state) {
        if (state is SendASmsStateSuccess) {
          if (state.sendASmsEntity!.responseCode == 200) {
            setState(() {
              optSent = false;
              verificationStatus = true;
              verificationStatusSuccess = true;
            });
          }
        }

        if (state is SendASmsStateSuccess) {
          if (state.sendASmsEntity!.responseCode == 400) {
            setState(() {
              optSent = false;
              verificationStatus = true;
              verificationStatusSuccess = false;
            });
          }
        }

        if (state is SendASmsStateError) {
          setState(() {
            optSent = false;
            verificationStatus = true;
            verificationStatusSuccess = false;
          });
        }
      },
      child: ListView(
        padding: const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
        //mainAxisSize: MainAxisSize.max,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (Responsive.isMobile(context))
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (optSent)
                  LayoutBuilder(builder: (context, constrainedBox) {
                    return Container(
                      width: constrainedBox.maxWidth,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '1. Send SMS',
                                    style: GoogleFonts.getFont(
                                      'Plus Jakarta Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 16.0),
                                  child: Text(
                                    'Sender',
                                    style: GoogleFonts.getFont(
                                      'Plus Jakarta Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                TextField(
                                  style: GoogleFonts.getFont(
                                    'Plus Jakarta Sans',
                                    color:
                                        Colors.black, // Set text color to black
                                    fontSize: 14.0,
                                  ),
                                  enabled: false,
                                  decoration: InputDecoration(
                                    hintText: 'UTOMOB / U2INFO',
                                    filled: true,
                                    isDense: true, // and add this line
                                    // Set background color to grey
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    border: const OutlineInputBorder(),
                                  ),
                                ),
                              ],
                            ),

                            ScreenUtil().setVerticalSpacing(16),
                            SizedBox(
                              width: double.infinity,
                              child: Wrap(
                                spacing: 10.0,
                                runSpacing: 10.0,
                                alignment: WrapAlignment.spaceBetween,
                                crossAxisAlignment: WrapCrossAlignment.start,
                                direction: Axis.horizontal,
                                //runAlignment: WrapAlignment.spaceBetween,
                                verticalDirection: VerticalDirection.down,
                                clipBehavior: Clip.none,
                                children: [
                                  LayoutBuilder(
                                      builder: (context, boxConstraints) {
                                    return SizedBox(
                                      width: boxConstraints.maxWidth / 2.1,
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 14.0,
                                                ),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
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
                                                            .fromSTEB(0.0, 4.0,
                                                            10.0, 4.0),
                                                    hidesUnderline: true,
                                                    width: 47.w,
                                                    height: 44.0,
                                                    hintText: 'Country code*',
                                                    searchHintText:
                                                        'Search for a country',
                                                    isSearchable: true,
                                                    icon: const FaIcon(
                                                      Icons
                                                          .keyboard_arrow_down_sharp,
                                                      color: Color(0xFFB3B9C4),
                                                      size: 24.0,
                                                    ),
                                                    controller:
                                                        dropDownCountryCodeValueController ??=
                                                            dropDownCountryCodeValueControllerInitial,
                                                    options: const [],
                                                    optionLabels: const [],
                                                    textStyle: TextStyle(
                                                      color: const Color(
                                                          0xFF243757),
                                                      fontSize: MediaQuery.sizeOf(
                                                                      context)
                                                                  .width <=
                                                              479.0
                                                          ? 11.0
                                                          : 14.0,
                                                    ),
                                                    searchHintTextStyle:
                                                        TextStyle(
                                                      color: const Color(
                                                          0xFF243757),
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
                                                        const Color(0xFFB3B9C4),
                                                    borderWidth: 1.0,
                                                    borderRadius: 4.0,
                                                    fillColor:
                                                        const Color(0xFFFFFFFF),
                                                    margin:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                            10.0, 4.0),
                                                    hidesUnderline: true,
                                                    width: boxConstraints
                                                            .maxWidth /
                                                        2.1,
                                                    height: 44.0,
                                                    hintText: 'Country code*',
                                                    searchHintText:
                                                        'Search for a country',
                                                    isSearchable: true,
                                                    icon: const FaIcon(
                                                      Icons
                                                          .keyboard_arrow_down_sharp,
                                                      color: Color(0xFFB3B9C4),
                                                      size: 24.0,
                                                    ),
                                                    searchHintTextStyle:
                                                        TextStyle(
                                                      color: const Color(
                                                          0xFF243757),
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
                                                      color: const Color(
                                                          0xFF243757),
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
                                                            0.0, 4.0, 4.0, 4.0),
                                                    hidesUnderline: true,
                                                    width: boxConstraints
                                                            .maxWidth /
                                                        2.1,
                                                    height: 44.0,
                                                    hintText: 'Country code*',
                                                    searchHintText:
                                                        'Search for a country',
                                                    isSearchable: true,
                                                    icon: const FaIcon(
                                                      Icons
                                                          .keyboard_arrow_down_sharp,
                                                      color: Color(0xFFB3B9C4),
                                                      size: 24.0,
                                                    ),
                                                    controller:
                                                        dropDownCountryCodeValueController ??=
                                                            dropDownCountryCodeValueControllerInitial,
                                                    options: entity.data ?? [],
                                                    searchHintTextStyle:
                                                        TextStyle(
                                                      color: const Color(
                                                          0xFF243757),
                                                      fontSize: MediaQuery.sizeOf(
                                                                      context)
                                                                  .width <=
                                                              479.0
                                                          ? 11.0
                                                          : 14.0,
                                                    ),
                                                    // optionLabels: (entity.data!) as List,
                                                    textStyle: TextStyle(
                                                      color: const Color(
                                                          0xFF243757),
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
                                                            .fromSTEB(0.0, 4.0,
                                                            10.0, 4.0),
                                                    hidesUnderline: true,
                                                    width: 47.w,
                                                    height: 50.0,
                                                    hintText: 'Country code*',
                                                    searchHintText:
                                                        'Search for a country',
                                                    isSearchable: true,
                                                    icon: const FaIcon(
                                                      FontAwesomeIcons
                                                          .angleDown,
                                                      color: Color(0xFFB3B9C4),
                                                      size: 24.0,
                                                    ),
                                                    controller:
                                                        dropDownCountryCodeValueController ??=
                                                            dropDownCountryCodeValueControllerInitial,
                                                    options: const [],
                                                    optionLabels: const [],
                                                    textStyle: TextStyle(
                                                      color: const Color(
                                                          0xFF243757),
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
                                        ],
                                      ),
                                    );
                                  }),
                                  LayoutBuilder(
                                      builder: (context, boxConstraints) {
                                    return SizedBox(
                                      width: boxConstraints.maxWidth / 2.1,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Recipient Number',
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium!
                                                .copyWith(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 14.0,
                                                ),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          TextFormField(
                                            controller: _mobileNumberController,

                                            obscureText: false,
                                            decoration: const InputDecoration(
                                                hintText:
                                                    'Enter Recipient Number',
                                                hintStyle: TextStyle(
                                                  color: Color(0xFF98A1B0),
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 14.0,
                                                )),
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            enabled: verifyOtp == true
                                                ? false
                                                : true,
                                            focusNode:
                                                _mobileNumberControllerFocus,
                                            textInputAction:
                                                TextInputAction.done,
                                            style: const TextStyle(
                                                color: Color(0xFF243757),
                                                fontSize: 14),
                                            keyboardType: TextInputType
                                                .phone, // Use TextInputType.phone for numeric keyboard
                                            inputFormatters: <TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .digitsOnly,
                                              LengthLimitingTextInputFormatter(
                                                  16),
                                            ],

                                            onFieldSubmitted: (value) {
                                              _mobileNumberController.text =
                                                  value;
                                              FocusScope.of(context).requestFocus(
                                                  _mobileNumberControllerFocus);
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                                ],
                              ),
                            ),

                            ScreenUtil().setVerticalSpacing(16),
                            Text(
                              'Template',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(height: 4),
                            TextButton(
                              onPressed: () {
                                // Toggle search visibility
                                setState(() {
                                  _isSearchVisible = !_isSearchVisible;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF2861B4),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 18),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              child: const Text(
                                'Select template',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white),
                              ),
                            ),

                            const SizedBox(height: 8),

                            // Search box TextField
                            if (_isSearchVisible)
                              TextField(
                                controller: _searchController,
                                readOnly: true,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText),
                                decoration: const InputDecoration(
                                  hintText: 'Select Template',
                                  hintStyle: TextStyle(
                                    color: Color(0xFF98A1B0),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14.0,
                                  ),
                                  suffixIcon:
                                      Icon(Icons.arrow_drop_down_outlined),
                                  border: OutlineInputBorder(),
                                ),
                                onTap: () {
                                  // Show the dropdown menu when the TextField is tapped
                                  setState(() {
                                    isDropdownVisible = true;
                                  });
                                },
                              ),
                            Visibility(
                              visible: isDropdownVisible &&
                                  promotionMessages.isNotEmpty,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 200, // or any other height you want
                                child: ListView.separated(
                                  itemCount: promotionMessages.length,
                                  separatorBuilder: (context, index) {
                                    return const Divider(
                                      thickness: 0.2,
                                      color: Color(0xFF98A1B0),
                                    );
                                  },
                                  itemBuilder: (context, index) {
                                    var message = promotionMessages[index];
                                    return ListTile(
                                      titleTextStyle: TextStyle(
                                          fontSize: 14,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText),
                                      title: Text(message.templateData),
                                      onTap: () {
                                        _searchController.text =
                                            message.templateData;
                                        _messageController.text =
                                            message.description;
                                        setState(() {
                                          isDropdownVisible = false;
                                        });
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),

                            const SizedBox(height: 8),
                            Text(
                              'Message',
                              style: TextStyle(
                                fontSize: 14,
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextField(
                              controller: _messageController,
                              readOnly: true,
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              style: TextStyle(
                                  fontSize: 14,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText),
                              decoration: const InputDecoration(
                                hintText: 'Your message here',
                                hintStyle: TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Colors.grey), // Normal border color
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors
                                          .blue), // Color when TextField is focused
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  // This is just to trigger setState, no additional logic needed here
                                });
                              },
                            ),
                            const SizedBox(height: 4),
                            Text(
                              // 'SMS Count: ${_messageController.text.length} / 1224 Char',
                              'SMS Count: ${calculateSmsCount(_messageController.text.length)}|${_messageController.text.length}/1224 Char',
                              softWrap: true,
                              style: TextStyle(
                                fontSize: 14,
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.normal,
                              ),
                            ),

                            ScreenUtil().setVerticalSpacing(16),
                            BlocListener<SendASmsBloc, SendASmsState>(
                              listener: (context, state) {
                                if (state is SendASmsStateSuccess &&
                                    state.sendASmsEntity?.userData != null &&
                                    state.sendASmsEntity?.responseCode != 508) {
                                  context.read<DashboardSMSBloc>().add(
                                        GetDashboardSmsEventCall(
                                            customerId:
                                                LocalStateCache().customerId,
                                            fromDate: DateFormat("d/M/yyyy")
                                                .format(DateTime.now()),
                                            toDate: DateFormat("d/M/yyyy")
                                                .format(DateTime.now()),
                                            authToken:
                                                LocalStateCache().authToken),
                                      );
                                  context
                                      .read<SMSAnalyticsCubit>()
                                      .getAnalytics(
                                          fromDate: DateFormat("d/M/yyyy")
                                              .format(DateTime.now()),
                                          toDate: DateFormat("d/M/yyyy")
                                              .format(DateTime.now()));
                                  context
                                      .read<GetUserDetailsBloc>()
                                      .add(const GetUserDetailsCall());
                                  context
                                      .read<PaymnetHistoryCubit>()
                                      .getPaymentHistory(
                                        fromDate: (DateFormat('dd/MM/yyyy')
                                            .format(DateTime.now())),
                                        toDate: (DateFormat('dd/MM/yyyy')
                                            .format(DateTime.now())),
                                      );
                                } else if (state is SendASmsStateSuccess &&
                                    state.sendASmsEntity?.responseCode == 508) {
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: const AddCreditWidget(
                                            headerTitle:
                                                "Insufficient Balance!",
                                            insufficentBalanceContent:
                                                "You don’t have enough balance to send SMS. Please top up to continue."),
                                      );
                                    },
                                  );
                                }
                              },
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 0.2,
                                  textStyle: GoogleFonts.getFont(
                                    'Plus Jakarta Sans',
                                    textStyle: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white),
                                  ),
                                  minimumSize: const Size(140, 48),
                                  backgroundColor: const Color(0xFF2861B4),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                onPressed: _mobileNumberController
                                            .text.isNotEmpty &&
                                        _messageController.text.isNotEmpty &&
                                        isSubmitEnable &&
                                        selctedContryCodeValue != ''
                                    ? () {
                                        context.read<SendASmsBloc>().add(
                                              GetSendASmsPressedButton(
                                                customerId: LocalStateCache()
                                                    .customerId,
                                                mobileNumber:
                                                    _mobileNumberController
                                                        .text,
                                                countryCode:
                                                    selctedContryCodeValue,
                                                flowType: 'SMS',
                                                type: 'SMS',
                                                senderId:
                                                    selctedContryCodeValue ==
                                                            '91'
                                                        ? 'UTOMOB'
                                                        : "U2 INFO",
                                                message:
                                                    _messageController.text,
                                                authToken:
                                                    LocalStateCache().authToken,
                                              ),
                                            );
                                      }
                                    : null,
                                child: const Text(
                                  'Send Message',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                if (!optSent)
                  Container(
                    width: double.infinity,
                    color: const Color(0x4D8F9BB3),
                    height: 60,
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        20.0, 8.0, 20.0, 8.0),
                    child: Row(
                      children: [
                        Text(
                          '1. Send Message',
                          style: GoogleFonts.getFont(
                            'Plus Jakarta Sans',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.check_circle,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                        ),
                      ],
                    ),
                  ),

                // second card
                if (!verificationStatus)
                  LayoutBuilder(builder: (context, constriantbox) {
                    return Container(
                      width: constriantbox.maxWidth,
                      color: const Color(0x4D8F9BB3),
                      margin: const EdgeInsets.only(top: 20),
                      height: 60,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 0.0, 0.0),
                            child: Text(
                              '2. Message Status',
                              style: GoogleFonts.getFont(
                                'Plus Jakarta Sans',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                if (verificationStatus)
                  LayoutBuilder(builder: (context, constraintBox) {
                    return Container(
                      width: constraintBox.maxWidth,
                      color: Colors.white,
                      margin: const EdgeInsets.only(top: 20),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '2. Message Status',
                                    style: GoogleFonts.getFont(
                                      'Plus Jakarta Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  if (verificationStatusSuccess)
                                    const Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Icon(
                                        Icons.check_circle,
                                        color: Color(0xFF11984A),
                                        size: 24.0,
                                      ),
                                    ),
                                  if (!verificationStatusSuccess)
                                    const Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Icon(
                                        Icons.error,
                                        color: Color.fromARGB(255, 219, 35, 22),
                                        size: 24.0,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: [
                                  if (verificationStatusSuccess)
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFDDF3E6),
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      child: Column(
                                        children: [
                                          const Row(
                                            children: [
                                              Icon(
                                                Icons.check_circle,
                                                color: Color(0xFF11984A),
                                                size: 24.0,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                'Great job!',
                                                style: TextStyle(
                                                  color: Color(0xFF084B25),
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "SMS delivered to ${LocalStateCache().countryCode + LocalStateCache().phoneNo} within 2 secs!*Credit used  \$0.009 from your balance",
                                            style: const TextStyle(
                                              color: Color(0xFF084B25),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 11.7,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  Center(
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              10.0, 10.0, 10.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: Image.asset(
                                          'assets/images/verifysms.png',
                                          width: 160.0,
                                          height: 160.0,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (verificationStatusSuccess)
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 16.0, 0.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 254, 255, 255),
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(15.0, 0.0, 15.0, 15.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: Text(
                                                  'Want to send more SMS to increase your brand presence?',
                                                  style: GoogleFonts.getFont(
                                                    'Plus Jakarta Sans',
                                                    color:
                                                        const Color(0xFF243757),
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 11.0,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Column(
                                                children: [
                                                  BlocListener<
                                                      SteponeRegistrationGetDemoBloc,
                                                      SteponeRegistrationGetState>(
                                                    listener: (context, state) {
                                                      if (state
                                                          is SteponeRegistrationGetStateSuccess) {
                                                        if (state
                                                                .steponeRegisterSaveEntity
                                                                ?.responseCode !=
                                                            409) {
                                                          showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            enableDrag: false,
                                                            context: context,
                                                            builder: (context) {
                                                              return Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    const RegisterPopUPForm(),
                                                              );
                                                            },
                                                          );

                                                          // showDialog(
                                                          //   context: context,
                                                          //   builder: (BuildContext
                                                          //       context) {
                                                          //     return const RegisterPopUPForm();
                                                          //   },
                                                          // );
                                                        } else {
                                                          showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return const SuccessPopupWidgetRequestAlreadyExists();
                                                            },
                                                          );
                                                        }
                                                      }
                                                    },
                                                    child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              elevation: 0.1,
                                                              minimumSize:
                                                                  const Size(
                                                                      double
                                                                          .infinity,
                                                                      44),
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4.0),
                                                              ),
                                                              textStyle:
                                                                  GoogleFonts
                                                                      .getFont(
                                                                'Plus Jakarta Sans',
                                                                color: const Color(
                                                                    0xFFFFFFFF),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 14.0,
                                                              ),
                                                              backgroundColor:
                                                                  const Color(
                                                                      0xFF11984A)),
                                                      onPressed: () async {
                                                        context
                                                            .read<
                                                                SteponeRegistrationGetDemoBloc>()
                                                            .add(
                                                                const SteponeRegistrationGetPressedButton());
                                                        MixPanelAnalyticsManager()
                                                            .sendEvent(
                                                                'Send_sms_register',
                                                                'Send sms register',
                                                                null);
                                                      },
                                                      child: const Text(
                                                        "Set Up your Account",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xFFFFFFFF)),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  TextButton(
                                                    style: TextButton.styleFrom(
                                                      elevation: 0.1,
                                                      minimumSize: const Size(
                                                          double.infinity, 44),
                                                      textStyle:
                                                          GoogleFonts.getFont(
                                                        'Plus Jakarta Sans',
                                                        color: const Color(
                                                            0xFF20A4CD),
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 14.0,
                                                      ),
                                                      backgroundColor:
                                                          const Color(
                                                              0xFFFFFFFF),
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        optSent = true;
                                                        verificationStatus =
                                                            false;
                                                      });
                                                      MixPanelAnalyticsManager()
                                                          .sendEvent(
                                                              'Send_sms_try_again',
                                                              'Send sms try again',
                                                              null);
                                                    },
                                                    child: const Text(
                                                      "Try Again",
                                                      style: TextStyle(
                                                          color: Color(
                                                              0xFF20A4CD)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (!verificationStatusSuccess)
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 16.0, 0.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFFFEBEE),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(12.0, 12.0, 12.0, 12.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Something went wrong',
                                                style: GoogleFonts.getFont(
                                                  'Plus Jakarta Sans',
                                                  color: const Color.fromARGB(
                                                      255, 219, 35, 22),
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14.0,
                                                ),
                                              ),
                                              const SizedBox(
                                                  height:
                                                      16), // Added for spacing
                                              Align(
                                                alignment: Alignment.center,
                                                child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    elevation: 0.1,
                                                    minimumSize:
                                                        const Size(142, 44),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                      side: const BorderSide(
                                                        color:
                                                            Color(0xFF2861B4),
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    textStyle:
                                                        GoogleFonts.getFont(
                                                      'Plus Jakarta Sans',
                                                      color: const Color(
                                                          0xFF2861B4),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 14.0,
                                                    ),
                                                    backgroundColor:
                                                        const Color(0xFFFFFFFF),
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      optSent = true;
                                                      verificationStatus =
                                                          false;
                                                    });
                                                  },
                                                  child: const Text("Try Again",
                                                      style: TextStyle(
                                                          color: Color(
                                                              0xFF2861B4))),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
              ],
            ),
          if (!Responsive.isMobile(context))
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Wrap(
                direction: Axis.horizontal,
                runSpacing: 16,
                spacing: 16,
                // crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  if (optSent)
                    LayoutBuilder(builder: (context, constrainedBox) {
                      return Container(
                        width: constrainedBox.maxWidth / 2.5,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '1. Send SMS',
                                      style: GoogleFonts.getFont(
                                        'Plus Jakarta Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 16.0),
                                    child: Text(
                                      'Sender',
                                      style: GoogleFonts.getFont(
                                        'Plus Jakarta Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  TextField(
                                    style: GoogleFonts.getFont(
                                      'Plus Jakarta Sans',
                                      color: Colors
                                          .black, // Set text color to black
                                      fontSize: 14.0,
                                    ),
                                    enabled: false,
                                    decoration: InputDecoration(
                                      hintText: 'UTOMOB / U2INFO',
                                      filled: true,
                                      isDense: true, // and add this line
                                      // Set background color to grey
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      border: const OutlineInputBorder(),
                                    ),
                                  ),
                                ],
                              ),

                              ScreenUtil().setVerticalSpacing(16),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Country Code',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium!
                                            .copyWith(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
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
                                                        0.0, 4.0, 10.0, 4.0),
                                                hidesUnderline: true,
                                                width: 47.w,
                                                height: 44.0,
                                                hintText: 'Country code*',
                                                searchHintText:
                                                    'Search for a country',
                                                isSearchable: true,
                                                icon: const FaIcon(
                                                  Icons
                                                      .keyboard_arrow_down_sharp,
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
                                                        0.0, 4.0, 10.0, 4.0),
                                                hidesUnderline: true,
                                                width: 47.w,
                                                height: 44.0,
                                                hintText: 'Country code*',
                                                searchHintText:
                                                    'Search for a country',
                                                isSearchable: true,
                                                icon: const FaIcon(
                                                  Icons
                                                      .keyboard_arrow_down_sharp,
                                                  color: Color(0xFFB3B9C4),
                                                  size: 24.0,
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
                                                        0.0, 4.0, 4.0, 4.0),
                                                hidesUnderline: true,
                                                width: 47.w,
                                                height: 44.0,
                                                hintText: 'Country code*',
                                                searchHintText:
                                                    'Search for a country',
                                                isSearchable: true,
                                                icon: const FaIcon(
                                                  Icons
                                                      .keyboard_arrow_down_sharp,
                                                  color: Color(0xFFB3B9C4),
                                                  size: 24.0,
                                                ),
                                                controller:
                                                    dropDownCountryCodeValueController ??=
                                                        dropDownCountryCodeValueControllerInitial,
                                                options: entity.data ?? [],
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
                                                // optionLabels: (entity.data!) as List,
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
                                                width: 47.w,
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
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Recipient Number',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium!
                                            .copyWith(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 14.0,
                                            ),
                                      ),
                                      ScreenUtil().setVerticalSpacing(4),
                                      SizedBox(
                                        width: 47.w,
                                        child: TextFormField(
                                          controller: _mobileNumberController,

                                          obscureText: false,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  'Enter Recipient Number',
                                              hintStyle: TextStyle(
                                                color: Color(0xFF98A1B0),
                                                fontWeight: FontWeight.normal,
                                                fontSize: 14.0,
                                              )),
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          enabled:
                                              verifyOtp == true ? false : true,
                                          focusNode:
                                              _mobileNumberControllerFocus,
                                          textInputAction: TextInputAction.done,
                                          style: const TextStyle(
                                              color: Color(0xFF243757),
                                              fontSize: 14),
                                          keyboardType: TextInputType
                                              .phone, // Use TextInputType.phone for numeric keyboard
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                            LengthLimitingTextInputFormatter(
                                                16),
                                          ],

                                          onFieldSubmitted: (value) {
                                            _mobileNumberController.text =
                                                value;
                                            FocusScope.of(context).requestFocus(
                                                _mobileNumberControllerFocus);
                                          },
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),

                              ScreenUtil().setVerticalSpacing(16),
                              Text(
                                'Template',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              const SizedBox(height: 4),
                              TextButton(
                                onPressed: () {
                                  // Toggle search visibility
                                  setState(() {
                                    _isSearchVisible = !_isSearchVisible;
                                  });
                                  MixPanelAnalyticsManager().sendEvent(
                                      'Send_sms_select_template',
                                      'Send sms select template',
                                      null);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF2861B4),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 18),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                child: const Text(
                                  'Select template',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white),
                                ),
                              ),

                              const SizedBox(height: 8),

                              // Search box TextField
                              if (_isSearchVisible)
                                TextField(
                                  controller: _searchController,
                                  readOnly: true,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText),
                                  decoration: const InputDecoration(
                                    hintText: 'Select Template',
                                    hintStyle: TextStyle(
                                      color: Color(0xFF98A1B0),
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14.0,
                                    ),
                                    suffixIcon:
                                        Icon(Icons.arrow_drop_down_outlined),
                                    border: OutlineInputBorder(),
                                  ),
                                  onTap: () {
                                    // Show the dropdown menu when the TextField is tapped
                                    setState(() {
                                      isDropdownVisible = true;
                                    });
                                  },
                                ),
                              Visibility(
                                visible: isDropdownVisible &&
                                    promotionMessages.isNotEmpty,
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 200, // or any other height you want
                                  child: ListView.separated(
                                    itemCount: promotionMessages.length,
                                    separatorBuilder: (context, index) {
                                      return const Divider(
                                        thickness: 0.2,
                                        color: Color(0xFF98A1B0),
                                      );
                                    },
                                    itemBuilder: (context, index) {
                                      var message = promotionMessages[index];
                                      return ListTile(
                                        titleTextStyle: TextStyle(
                                            fontSize: 14,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText),
                                        title: Text(message.templateData),
                                        onTap: () {
                                          _searchController.text =
                                              message.templateData;
                                          _messageController.text =
                                              message.description;
                                          setState(() {
                                            isDropdownVisible = false;
                                          });
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),

                              const SizedBox(height: 8),
                              Text(
                                'Message',
                                style: TextStyle(
                                  fontSize: 14,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              const SizedBox(height: 5),
                              TextField(
                                controller: _messageController,
                                readOnly: true,
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText),
                                decoration: const InputDecoration(
                                  hintText: 'Your message here',
                                  hintStyle: TextStyle(fontSize: 14),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Colors.grey), // Normal border color
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors
                                            .blue), // Color when TextField is focused
                                  ),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    // This is just to trigger setState, no additional logic needed here
                                  });
                                },
                              ),
                              const SizedBox(height: 4),
                              Text(
                                // 'SMS Count: ${_messageController.text.length} / 1224 Char',
                                'SMS Count: ${calculateSmsCount(_messageController.text.length)}|${_messageController.text.length}/1224 Char',
                                softWrap: true,
                                style: TextStyle(
                                  fontSize: 14,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),

                              ScreenUtil().setVerticalSpacing(16),
                              BlocListener<SendASmsBloc, SendASmsState>(
                                listener: (context, state) {
                                  if (state is SendASmsStateSuccess &&
                                      state.sendASmsEntity?.userData != null &&
                                      state.sendASmsEntity?.responseCode !=
                                          508) {
                                    context.read<DashboardSMSBloc>().add(
                                          GetDashboardSmsEventCall(
                                              customerId:
                                                  LocalStateCache().customerId,
                                              fromDate: DateFormat("d/M/yyyy")
                                                  .format(DateTime.now()),
                                              toDate: DateFormat("d/M/yyyy")
                                                  .format(DateTime.now()),
                                              authToken:
                                                  LocalStateCache().authToken),
                                        );
                                    context
                                        .read<SMSAnalyticsCubit>()
                                        .getAnalytics(
                                            fromDate: DateFormat("d/M/yyyy")
                                                .format(DateTime.now()),
                                            toDate: DateFormat("d/M/yyyy")
                                                .format(DateTime.now()));
                                    context
                                        .read<GetUserDetailsBloc>()
                                        .add(const GetUserDetailsCall());
                                    context
                                        .read<PaymnetHistoryCubit>()
                                        .getPaymentHistory(
                                          fromDate: (DateFormat('dd/MM/yyyy')
                                              .format(DateTime.now())),
                                          toDate: (DateFormat('dd/MM/yyyy')
                                              .format(DateTime.now())),
                                        );
                                  } else if (state is SendASmsStateSuccess &&
                                      state.sendASmsEntity?.responseCode ==
                                          508) {
                                    showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: const AddCreditWidget(
                                              headerTitle:
                                                  "Insufficient Balance!",
                                              insufficentBalanceContent:
                                                  "You don’t have enough balance to send SMS. Please top up to continue."),
                                        );
                                      },
                                    );
                                  }
                                },
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0.2,
                                    textStyle: GoogleFonts.getFont(
                                      'Plus Jakarta Sans',
                                      textStyle: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white),
                                    ),
                                    minimumSize: const Size(140, 48),
                                    backgroundColor: const Color(0xFF2861B4),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  onPressed: _mobileNumberController
                                              .text.isNotEmpty &&
                                          _messageController.text.isNotEmpty &&
                                          isSubmitEnable &&
                                          selctedContryCodeValue != ''
                                      ? () {
                                          MixPanelAnalyticsManager().sendEvent(
                                              "Send_sms_send_message",
                                              "Send_sms_send_message",
                                              null);
                                          context.read<SendASmsBloc>().add(
                                                GetSendASmsPressedButton(
                                                  customerId: LocalStateCache()
                                                      .customerId,
                                                  mobileNumber:
                                                      _mobileNumberController
                                                          .text,
                                                  countryCode:
                                                      selctedContryCodeValue,
                                                  flowType: 'SMS',
                                                  type: 'SMS',
                                                  senderId:
                                                      selctedContryCodeValue ==
                                                              '91'
                                                          ? 'UTOMOB'
                                                          : "U2 INFO",
                                                  message:
                                                      _messageController.text,
                                                  authToken: LocalStateCache()
                                                      .authToken,
                                                ),
                                              );
                                        }
                                      : null,
                                  child: const Text(
                                    'Send Message',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  if (!optSent)
                    Container(
                      width: MediaQuery.of(context).size.width * 0.30,
                      color: const Color(0x4D8F9BB3),
                      height: 60,
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          20.0, 8.0, 20.0, 8.0),
                      child: Row(
                        children: [
                          Text(
                            '1. Send Message',
                            style: GoogleFonts.getFont(
                              'Plus Jakarta Sans',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: Icon(
                              Icons.check_circle,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (!verificationStatus)
                    LayoutBuilder(builder: (context, constriantbox) {
                      return Container(
                        width: constriantbox.maxWidth / 2,
                        color: const Color(0x4D8F9BB3),
                        height: 60,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Text(
                                '2. Message Status',
                                style: GoogleFonts.getFont(
                                  'Plus Jakarta Sans',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  if (verificationStatus)
                    LayoutBuilder(builder: (context, constraintBox) {
                      return Container(
                        width: constraintBox.maxWidth / 2.5,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '2. Message Status',
                                      style: GoogleFonts.getFont(
                                        'Plus Jakarta Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    if (verificationStatusSuccess)
                                      const Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Icon(
                                          Icons.check_circle,
                                          color: Color(0xFF11984A),
                                          size: 24.0,
                                        ),
                                      ),
                                    if (!verificationStatusSuccess)
                                      const Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Icon(
                                          Icons.error,
                                          color:
                                              Color.fromARGB(255, 219, 35, 22),
                                          size: 24.0,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  children: [
                                    if (verificationStatusSuccess)
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFDDF3E6),
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                        ),
                                        child: Column(
                                          children: [
                                            const Row(
                                              children: [
                                                Icon(
                                                  Icons.check_circle,
                                                  color: Color(0xFF11984A),
                                                  size: 24.0,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  'Great job!',
                                                  style: TextStyle(
                                                    color: Color(0xFF084B25),
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "SMS has been sent successfully to +${selctedContryCodeValue + _mobileNumberController.text}. Need further assistance? Reach out to our support team at ${ApiEndPoints.customerSupportNumber}.",
                                              style: const TextStyle(
                                                color: Color(0xFF084B25),
                                                fontWeight: FontWeight.w400,
                                                fontSize: 11.7,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(10.0, 10.0, 10.0, 0.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: Image.asset(
                                            'assets/images/verifysms.png',
                                            width: 160.0,
                                            height: 160.0,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                    if (verificationStatusSuccess)
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 16.0, 0.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 254, 255, 255),
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(
                                                10.0, 15.0, 15.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0.0, 10.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Want to send more SMS to increase your brand presence?',
                                                    style: GoogleFonts.getFont(
                                                      'Plus Jakarta Sans',
                                                      color: const Color(
                                                          0xFF243757),
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 11.0,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                Column(
                                                  children: [
                                                    BlocListener<
                                                        SteponeRegistrationGetDemoBloc,
                                                        SteponeRegistrationGetState>(
                                                      listener:
                                                          (context, state) {
                                                        if (state
                                                            is SteponeRegistrationGetStateSuccess) {
                                                          if (state
                                                                  .steponeRegisterSaveEntity
                                                                  ?.responseCode !=
                                                              409) {
                                                            showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              enableDrag: false,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      const RegisterPopUPForm(),
                                                                );
                                                              },
                                                            );

                                                            // showDialog(
                                                            //   context: context,
                                                            //   builder: (BuildContext
                                                            //       context) {
                                                            //     return const RegisterPopUPForm();
                                                            //   },
                                                            // );
                                                          } else {
                                                            showDialog(
                                                              context: context,
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                return const SuccessPopupWidgetRequestAlreadyExists();
                                                              },
                                                            );
                                                          }
                                                        }
                                                      },
                                                      child: ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                elevation: 0.1,
                                                                minimumSize:
                                                                    const Size(
                                                                        double
                                                                            .infinity,
                                                                        44),
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4.0),
                                                                ),
                                                                textStyle:
                                                                    GoogleFonts
                                                                        .getFont(
                                                                  'Plus Jakarta Sans',
                                                                  color: const Color(
                                                                      0xFFFFFFFF),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      14.0,
                                                                ),
                                                                backgroundColor:
                                                                    const Color(
                                                                        0xFF11984A)),
                                                        onPressed: () async {
                                                          context
                                                              .read<
                                                                  SteponeRegistrationGetDemoBloc>()
                                                              .add(
                                                                  const SteponeRegistrationGetPressedButton());
                                                          MixPanelAnalyticsManager()
                                                              .sendEvent(
                                                                  'Send_sms_register',
                                                                  'Send sms register',
                                                                  null);
                                                        },
                                                        child: const Text(
                                                          "Set Up your Account",
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xFFFFFFFF)),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    TextButton(
                                                      style:
                                                          TextButton.styleFrom(
                                                        elevation: 0.1,
                                                        minimumSize: const Size(
                                                            double.infinity,
                                                            44),
                                                        textStyle:
                                                            GoogleFonts.getFont(
                                                          'Plus Jakarta Sans',
                                                          color: const Color(
                                                              0xFF20A4CD),
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 14.0,
                                                        ),
                                                        backgroundColor:
                                                            const Color(
                                                                0xFFFFFFFF),
                                                      ),
                                                      onPressed: () {
                                                        setState(() {
                                                          optSent = true;
                                                          verificationStatus =
                                                              false;
                                                        });
                                                        MixPanelAnalyticsManager()
                                                            .sendEvent(
                                                                'Send_sms_try_again',
                                                                'Send sms try again',
                                                                null);
                                                      },
                                                      child: const Text(
                                                        "Try Again",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xFF20A4CD)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (!verificationStatusSuccess)
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 16.0, 0.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFFFEBEE),
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(
                                                12.0, 12.0, 12.0, 12.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Something went wrong',
                                                  style: GoogleFonts.getFont(
                                                    'Plus Jakarta Sans',
                                                    color: const Color.fromARGB(
                                                        255, 219, 35, 22),
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14.0,
                                                  ),
                                                ),
                                                const SizedBox(
                                                    height:
                                                        16), // Added for spacing
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      elevation: 0.1,
                                                      minimumSize:
                                                          const Size(142, 44),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4.0),
                                                        side: const BorderSide(
                                                          color:
                                                              Color(0xFF2861B4),
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      textStyle:
                                                          GoogleFonts.getFont(
                                                        'Plus Jakarta Sans',
                                                        color: const Color(
                                                            0xFF2861B4),
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 14.0,
                                                      ),
                                                      backgroundColor:
                                                          const Color(
                                                              0xFFFFFFFF),
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        optSent = true;
                                                        verificationStatus =
                                                            false;
                                                      });
                                                    },
                                                    child: const Text(
                                                        "Try Again",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xFF2861B4))),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
