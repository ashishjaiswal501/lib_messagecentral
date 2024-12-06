// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messagecentral/core/base/features/countrycode/domain/entity/country_code_entity.dart';
import 'package:messagecentral/core/base/features/countrycode/presentation/screens/countryname_screen.dart';
import 'package:messagecentral/core/base/features/countrycode/presentation/screens/cubit/country_code_cubit.dart';
import 'package:messagecentral/core/base/features/countrycode/presentation/screens/cubit/country_code_cubit_state.dart';
import 'package:messagecentral/core/base/features/countrycode/presentation/screens/widgets/form_filedController.dart';
import 'package:messagecentral/core/constants/app_colors.dart';
import 'package:messagecentral/core/constants/image_path.dart';
import 'package:messagecentral/core/utils/local_state_cache.dart';
import 'package:messagecentral/core/utils/mix_pannel.dart';
import 'package:messagecentral/core/utils/responsive.dart';
import 'package:messagecentral/core/utils/responsive_layout.dart';
import 'package:messagecentral/core/utils/validator.dart';
import 'package:messagecentral/features/find_by_customer_id/presentation/bloc/find_by_customer_id_bloc.dart';
import 'package:messagecentral/features/find_by_customer_id/presentation/bloc/find_by_customer_id_state.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/presentation/bloc/stepone_registration_save_bloc.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/presentation/bloc/stepone_registration_save_event.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/presentation/bloc/stepone_registration_save_state.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/presentation/screens/widgets/success_dailog_widget.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/presentation/screens/widgets/sucess_popup_request_already_exists_widget.dart';

class RegisterPopUPForm extends StatefulWidget {
  const RegisterPopUPForm({super.key});

  @override
  State<RegisterPopUPForm> createState() => _RegisterPopUPFormState();
}

class _RegisterPopUPFormState extends State<RegisterPopUPForm> with Validator {
  FormFieldController<CountryData>? dropDownCountryCodeValueController;
  bool verifyOtp = false;
  String selctedContryCodeValue = '';
  String selctedContryName = '';
  String? firstName,
      companyName,
      companyWebsite,
      email,
      contactNumber,
      address,
      addressCountry,
      addressState,
      addressCity,
      addressPostalcode,
      selectedOptionSenderID = 'yes',
      selectedOption = 'yes';

  //bool _isSearchVisible = false;
  bool isDropdownVisible = false;
  // String selectedOptionSenderID = "";
  //String selectedOption = "";
  int _activeStepIndex = 0;

  final dropDownCountryCodeValueControllerInitial =
      FormFieldController<CountryData>(CountryData(
          id: 0,
          phoneCode: '91',
          isoCountryCode: '91',
          name: 'India',
          maxLength: 10,
          minLength: 0));

  final formKeybasicInfo = GlobalKey<FormState>();
  final formKeyBiling = GlobalKey<FormState>();
  final FocusNode _firstNameControllerFocus = FocusNode();
  final FocusNode _companyNamecontrollerFocus = FocusNode();
  final FocusNode _companyWebsitecontrollerFocus = FocusNode();
  final FocusNode _emailControllerFocus = FocusNode();
  final FocusNode _phoneNumberControllerFocus = FocusNode();
  //final FocusNode _searchControllerFocus = FocusNode();
  final FocusNode _addressControllerFocus = FocusNode();
  final FocusNode _cityControllerFocus = FocusNode();
  final FocusNode _countryControllerFocus = FocusNode();
  final FocusNode _stateControllerFocus = FocusNode();
  final FocusNode _postalCodeControllerFocus = FocusNode();

  //final TextEditingController _searchController = TextEditingController();
  TextEditingController firstNamecontroller = TextEditingController();
  TextEditingController companyNamecontroller = TextEditingController();
  TextEditingController companyWebsitecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phoneNumbercontroller = TextEditingController();
  TextEditingController searchController = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController postalCodecontroller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();

  List<GlobalKey<FormState>> formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>()
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Dispose of the listeners when the widget is disposed
    firstNamecontroller.dispose();
    companyNamecontroller.dispose();
    companyWebsitecontroller.dispose();
    emailcontroller.dispose();
    phoneNumbercontroller.dispose();

    addresscontroller.dispose();
    postalCodecontroller.dispose();
    cityController.dispose();
    countryController.dispose();
    stateController.dispose();

    super.dispose();
  }

  TextStyle _getStepTextStyle(int stepIndex) {
    if (_activeStepIndex == stepIndex) {
      return GoogleFonts.getFont(
        'Plus Jakarta Sans',
        fontWeight: FontWeight.w700,
        color: const Color(0xFF0E7E3E),
        fontSize: 14.0,
      );
    } else {
      return const TextStyle(color: Colors.grey);
    }
  }

  StepState _getStepState(int stepIndex) {
    return _activeStepIndex > stepIndex
        ? StepState.complete
        : _activeStepIndex == stepIndex
            ? StepState.indexed
            : StepState.disabled;
  }

  Step _customStep({
    required Text title,
    required Widget content,
    required bool isActive,
    required StepState stepState,
  }) {
    return Step(
      title: title,
      content: content,
      isActive: isActive,
      state: stepState,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(
              color: Colors.transparent,
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width >= 800
                    ? (MediaQuery.of(context).size.width * 0.4)
                    : (MediaQuery.of(context).size.width * 0.95),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 0.0, vertical: 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Account Setup',
                              style: GoogleFonts.getFont(
                                'Plus Jakarta Sans',
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0,
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                Navigator.pop(context);
                                MixPanelAnalyticsManager().sendEvent(
                                    'send_sms_form_dismiss',
                                    'send_sms_form_dismiss',
                                    null);
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
                      const SizedBox(
                        //  width: 800,
                        child: Divider(
                          thickness: 1.0,
                          color: Color(0xFFDFE2E6),
                        ),
                      ),
                      SizedBox(
                        height: _activeStepIndex == 1 ? 400 : 500,
                        child: Stepper(
                          elevation: 0,
                          connectorColor:
                              MaterialStateProperty.resolveWith((states) {
                            if (states.contains(MaterialState.disabled)) {
                              return Colors.blueGrey;
                            } else if (states
                                .contains(MaterialState.selected)) {
                              return Colors.green;
                            } else {
                              return Colors.grey;
                            }
                          }),
                          type: isDesktop(context)
                              ? StepperType.horizontal
                              : StepperType.vertical,
                          currentStep: _activeStepIndex,
                          steps: stepList(),
                          // Inside the Stepper widget

                          controlsBuilder: (BuildContext context,
                              ControlsDetails controlsDetails) {
                            return Wrap(
                              spacing: 15.0,
                              runSpacing: 15.0,
                              alignment: _activeStepIndex > 0
                                  ? WrapAlignment.spaceBetween
                                  : WrapAlignment.end,
                              crossAxisAlignment: WrapCrossAlignment.end,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.end,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children: [
                                if (controlsDetails.onStepCancel != null &&
                                    _activeStepIndex > 0)
                                  TextButton(
                                    onPressed: controlsDetails.onStepCancel,
                                    style: TextButton.styleFrom(
                                      foregroundColor: const Color(0xFF2861B4),
                                      backgroundColor: const Color(0xFFFFFFFF),
                                      minimumSize: const Size(142, 44),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SvgPicture.asset(
                                          ImagePath.arrowleft,
                                          color: AppColors.blue60,
                                        ),
                                        const SizedBox(width: 5),
                                        const Text('Back'),
                                      ],
                                    ),
                                  ),
                                // Add space between boxes
                                if (controlsDetails.onStepContinue != null)
                                  Builder(builder: (context) {
                                    return BlocListener<
                                        SteponeRegistrationSaveBloc,
                                        SteponeRegistrationSaveState>(
                                      listener: (BuildContext context, state) {
                                        if (state
                                            is SteponeRegistrationSaveStateSuccess) {
                                          if (state.steponeRegisterSaveEntity
                                                  ?.responseCode !=
                                              409) {
                                            _showSuccessPopup(context);
                                            Navigator.pop(context);
                                            MixPanelAnalyticsManager()
                                                .sendEvent(
                                                    'send_sms_form_dismiss',
                                                    'send_sms_form_dismiss',
                                                    null);
                                          } else {
                                            _showSuccessPopupRequestAlreadyExists(
                                                context);
                                            Navigator.pop(context);
                                          }
                                        }
                                      },
                                      child: ElevatedButton(
                                        onPressed: () {
                                          if (_activeStepIndex == 0) {
                                            if (formKeys[0]
                                                .currentState!
                                                .validate()) {
                                              formKeys[0].currentState!.save();
                                              controlsDetails.onStepContinue!();
                                              MixPanelAnalyticsManager()
                                                  .sendEvent(
                                                      'send_sms_form1_next',
                                                      'send sms form1 next',
                                                      null);
                                            }
                                          } else if (_activeStepIndex == 1) {
                                            if (formKeys[1]
                                                .currentState!
                                                .validate()) {
                                              formKeys[1].currentState!.save();
                                              controlsDetails.onStepContinue!();
                                              MixPanelAnalyticsManager()
                                                  .sendEvent(
                                                      'send_sms_form2_next',
                                                      'send sms form2 next',
                                                      null);
                                            }
                                          } else if (_activeStepIndex == 2) {
                                            MixPanelAnalyticsManager()
                                                .sendEvent(
                                                    'send_sms_form3_submit',
                                                    'send sms form3 submit',
                                                    null);
                                            context
                                                .read<
                                                    SteponeRegistrationSaveBloc>()
                                                .add(
                                                  SteponeRegistrationSavePressedButton(
                                                    name: firstNamecontroller
                                                        .text,
                                                    companyName:
                                                        companyName ?? '',
                                                    companyWebsite:
                                                        companyWebsite ?? '',
                                                    workingEmail:
                                                        emailcontroller.text,
                                                    contactNumber:
                                                        phoneNumbercontroller
                                                            .text,
                                                    countryToSendSMS:
                                                        selctedContryCodeValue, // Country code
                                                    //countryToSendSMS:selctedContryName, // Country name
                                                    hasIndianRegisteredID:
                                                        selectedOptionSenderID ==
                                                                'yes'
                                                            ? true
                                                            : false,
                                                    usageDescription: '',
                                                    userAccountType: '',
                                                    userAddress:
                                                        addresscontroller.text,
                                                    userCountry:
                                                        countryController.text,
                                                    userCity:
                                                        cityController.text,
                                                    userState:
                                                        stateController.text,
                                                    userZipCode:
                                                        postalCodecontroller
                                                            .text,
                                                    resellerType:
                                                        selectedOption == 'yes'
                                                            ? true
                                                            : false,
                                                    authToken: LocalStateCache()
                                                        .authToken,
                                                  ),
                                                );

                                            controlsDetails.onStepContinue!();
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          minimumSize: const Size(142, 44),
                                          foregroundColor: Colors.white,
                                          backgroundColor:
                                              const Color(0xFF2861B4),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                        ),
                                        child: Visibility(
                                          visible: _activeStepIndex != 2,
                                          replacement:
                                              const Text('Submit Details'),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Text('Next'),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              SvgPicture.asset(
                                                ImagePath.arrowRight,
                                                color: AppColors.whiteTextColor,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                              ],
                            );
                          },

                          ///  next button
                          onStepContinue: () {
                            setState(() {
                              if (formKeys[_activeStepIndex]
                                  .currentState!
                                  .validate()) {
                                if (_activeStepIndex < stepList().length - 1) {
                                  _activeStepIndex += 1;
                                  MixPanelAnalyticsManager().sendEvent(
                                      'send_sms_form3_back',
                                      'send sms form3 back',
                                      null);
                                } else {
                                  _activeStepIndex = 0;
                                }
                              }
                            });
                          },

                          ///  next back
                          onStepCancel: () {
                            setState(() {
                              if (_activeStepIndex > 0) {
                                _activeStepIndex = _activeStepIndex - 1;
                              } else {
                                _activeStepIndex = 0;
                              }
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //  all list of 3 steps content code

  List<Step> stepList() => [
        _customStep(
          title: Text(
            'Basic Info',
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            style: _getStepTextStyle(0),
          ),
          content: BlocBuilder<FindByCustomerIdBloc, FindByCustomerIdState>(
              builder: (context, state) {
            firstNamecontroller.text =
                "${state.findByCustomerIdEntity?.data?.firstName} ${state.findByCustomerIdEntity?.data!.lastName}";
            emailcontroller.text =
                state.findByCustomerIdEntity?.data?.email ?? "";
            phoneNumbercontroller.text =
                "${state.findByCustomerIdEntity?.data?.phoneCode}${state.findByCustomerIdEntity?.data!.phoneNo}";
            return Form(
              key: formKeys[0],
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    ' Name',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.normal,
                      fontSize: 14.0,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  TextFormField(
                    controller: firstNamecontroller,
                    textInputAction: TextInputAction.next,
                    focusNode: _firstNameControllerFocus,
                    autovalidateMode: AutovalidateMode.onUserInteraction,

                    textCapitalization: TextCapitalization.words,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Enter your name',
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
                          color: Color(0xFFF4493E),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFFF4493E),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      filled: true,
                      fillColor: AppColors.primaryBackground,
                    ),
                    style: const TextStyle(
                      color: AppColors.primaryText,
                      fontSize: 14.0,
                    ),
                    keyboardType: TextInputType.name,
                    // validator: validateFirstname,

                    validator: validateName,
                    onChanged: (value) {
                      firstName = value;
                    },
                    onFieldSubmitted: (value) {
                      firstName = value;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  if (Responsive.isDesktop(context))
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
                          LayoutBuilder(builder: (context, boxConstraints) {
                            return SizedBox(
                              width: boxConstraints.maxWidth / 2.1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Company Name',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AppColors.primaryText,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  TextFormField(
                                    controller: companyNamecontroller,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    focusNode: _companyNamecontrollerFocus,
                                    textInputAction: TextInputAction.next,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'Enter company name',
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
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFB3B9C4),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFF4493E),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFF4493E),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      filled: true,
                                      fillColor: AppColors.primaryBackground,
                                    ),
                                    style: const TextStyle(
                                      color: AppColors.primaryText,
                                      fontSize: 14.0,
                                    ),
                                    keyboardType: TextInputType.name,
                                    // inputFormatters: [
                                    //   FilteringTextInputFormatter.allow(
                                    //       RegExp('[a-zA-Z]'))
                                    // ],
                                    validator: validateCompanyName,
                                    onChanged: (value) {
                                      companyName = value;
                                    },
                                  ),
                                ],
                              ),
                            );
                          }),
                          LayoutBuilder(builder: (context, boxConstraints) {
                            return SizedBox(
                              width: boxConstraints.maxWidth / 2.1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Company Website',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AppColors.primaryText,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  TextFormField(
                                      controller: companyWebsitecontroller,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      textCapitalization:
                                          TextCapitalization.words,
                                      focusNode: _companyWebsitecontrollerFocus,
                                      textInputAction: TextInputAction.next,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: 'https://',
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
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0xFFB3B9C4),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0xFFF4493E),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0xFFF4493E),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        filled: true,
                                        fillColor: AppColors.primaryBackground,
                                      ),
                                      style: const TextStyle(
                                        color: AppColors.primaryText,
                                        fontSize: 14.0,
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                      onChanged: (value) {
                                        companyWebsite = value;
                                      },
                                      validator: validateUrlWebSite),
                                ],
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  if (!Responsive.isDesktop(context))
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Company Name',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.normal,
                            fontSize: 14.0,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        TextFormField(
                          controller: companyNamecontroller,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textCapitalization: TextCapitalization.words,
                          focusNode: _companyNamecontrollerFocus,
                          textInputAction: TextInputAction.next,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Enter company name',
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
                                color: Color(0xFFF4493E),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFFF4493E),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            filled: true,
                            fillColor: AppColors.primaryBackground,
                          ),
                          style: const TextStyle(
                            color: AppColors.primaryText,
                            fontSize: 14.0,
                          ),
                          keyboardType: TextInputType.name,
                          validator: validateCompanyName,
                          onChanged: (value) {
                            companyName = value;
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          'Company Website',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.normal,
                            fontSize: 14.0,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        TextFormField(
                            controller: companyWebsitecontroller,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            textCapitalization: TextCapitalization.words,
                            focusNode: _companyWebsitecontrollerFocus,
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'https://',
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
                                  color: Color(0xFFF4493E),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFFF4493E),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              filled: true,
                              fillColor: AppColors.primaryBackground,
                            ),
                            style: const TextStyle(
                              color: AppColors.primaryText,
                              fontSize: 14.0,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) {
                              companyWebsite = value;
                            },
                            validator: validateUrlWebSite),
                      ],
                    ),
                  const SizedBox(
                    height: 16,
                  ),
                  if (Responsive.isDesktop(context))
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
                          LayoutBuilder(builder: (context, boxConstraints) {
                            return SizedBox(
                              width: boxConstraints.maxWidth / 2.1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Working/business email',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AppColors.primaryText,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  TextFormField(
                                    focusNode: _emailControllerFocus,
                                    textInputAction: TextInputAction.next,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    controller: emailcontroller,
                                    textCapitalization: TextCapitalization.none,
                                    // readOnly: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'Enter a valid email',
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
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFB3B9C4),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFF4493E),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFF4493E),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      filled: true,
                                      fillColor: AppColors.primaryBackground,
                                    ),
                                    style: const TextStyle(
                                      color: AppColors.primaryText,
                                      fontSize: 14.0,
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    validator: validateEmail,
                                    onChanged: (value) {
                                      email = value;
                                    },
                                  ),
                                ],
                              ),
                            );
                          }),
                          LayoutBuilder(builder: (context, boxConstraints) {
                            return SizedBox(
                              width: boxConstraints.maxWidth / 2.1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Contact number(with country code)',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: AppColors.primaryText,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  TextFormField(
                                    // controller:
                                    //     _model.mobileTextFieldController,
                                    controller: phoneNumbercontroller,
                                    focusNode: _phoneNumberControllerFocus,
                                    textInputAction: TextInputAction.next,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,

                                    //readOnly: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'Mobile No',
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
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFB3B9C4),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFF4493E),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFF4493E),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      filled: true,
                                      fillColor: AppColors.primaryBackground,
                                    ),
                                    style: const TextStyle(
                                      color: AppColors.primaryText,
                                      fontSize: 14.0,
                                    ),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp('[0-9+]')),
                                    ],
                                    validator: validateMobileNumber,

                                    onFieldSubmitted: (value) {
                                      phoneNumbercontroller.text = value;
                                    },
                                  ),
                                ],
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  if (!Responsive.isDesktop(context))
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Working/business email',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.normal,
                            fontSize: 14.0,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        TextFormField(
                          focusNode: _emailControllerFocus,
                          textInputAction: TextInputAction.next,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: emailcontroller,
                          textCapitalization: TextCapitalization.none,
                          // readOnly: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Enter a valid email',
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
                                color: Color(0xFFF4493E),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFFF4493E),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            filled: true,
                            fillColor: AppColors.primaryBackground,
                          ),
                          style: const TextStyle(
                            color: AppColors.primaryText,
                            fontSize: 14.0,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: validateEmail,
                          onChanged: (value) {
                            email = value;
                          },
                        ),
                        const Text(
                          'Contact number(with country code)',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.normal,
                            fontSize: 14.0,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        TextFormField(
                          // controller:
                          //     _model.mobileTextFieldController,
                          controller: phoneNumbercontroller,
                          focusNode: _phoneNumberControllerFocus,
                          textInputAction: TextInputAction.next,
                          autovalidateMode: AutovalidateMode.onUserInteraction,

                          //readOnly: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Mobile No',
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
                                color: Color(0xFFF4493E),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFFF4493E),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            filled: true,
                            fillColor: AppColors.primaryBackground,
                          ),
                          style: const TextStyle(
                            color: AppColors.primaryText,
                            fontSize: 14.0,
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp('[0-9+]')),
                          ],
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter Your Mobile number';
                            }
                            return null;
                          },

                          onFieldSubmitted: (value) {
                            phoneNumbercontroller.text = value;
                          },
                        ),
                      ],
                    ),
                  const SizedBox(
                    height: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Which country you want to send SMS to?',
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: AppColors.primaryText,
                                  fontSize: 14.0,
                                ),
                      ),
                      ScreenUtil().setVerticalSpacing(4),
                      BlocConsumer<CountryCodeCubit, CountryCodeState>(
                          builder: (_, state) {
                            return state.when(
                              initial: () => const Center(),
                              // CountryNameDropDown<CountryData>(
                              //   isMultiSelect: true,
                              //   elevation: 0.0,
                              //   borderColor: const Color(0xFFB3B9C4),
                              //   borderWidth: 1.0,
                              //   borderRadius: 4.0,
                              //   fillColor: const Color(0xFFFFFFFF),
                              //   margin: const EdgeInsetsDirectional.fromSTEB(
                              //       4.0, 0.0, 0.0, 4.0),
                              //   hidesUnderline: true,
                              //   width: 131.w,
                              //   height: 44.0,
                              //   hintText: 'Select one or multiple options*',
                              //   searchHintText: 'Search for a country',
                              //   isSearchable: true,
                              //   icon: const FaIcon(
                              //     FontAwesomeIcons.angleDown,
                              //     color: Color(0xFFB3B9C4),
                              //     size: 24.0,
                              //   ),
                              //   controller: dropDownCountryCodeValueController ??=
                              //       dropDownCountryCodeValueControllerInitial,
                              //   options: const [],
                              //   optionLabels: const [],
                              //   textStyle: TextStyle(
                              //     color: const Color(0xFF243757),
                              //     fontSize:
                              //         MediaQuery.sizeOf(context).width <=
                              //                 479.0
                              //             ? 11.0
                              //             : 14.0,
                              //   ),
                              //   searchHintTextStyle: TextStyle(
                              //     color: const Color(0xFF243757),
                              //     fontSize:
                              //         MediaQuery.sizeOf(context).width <=
                              //                 479.0
                              //             ? 11.0
                              //             : 14.0,
                              //   ),
                              // ),

                              loading: () => const Center(),
                              // CountryNameDropDown<CountryData>(
                              //   isMultiSelect: true,
                              //   elevation: 0.0,
                              //   borderColor: const Color(0xFFB3B9C4),
                              //   borderWidth: 1.0,
                              //   borderRadius: 4.0,
                              //   fillColor: const Color(0xFFFFFFFF),
                              //   margin: const EdgeInsetsDirectional.fromSTEB(
                              //       0.0, 4.0, 10.0, 4.0),
                              //   hidesUnderline: true,
                              //   width: 131.w,
                              //   height: 44.0,
                              //   hintText: 'Select one or multiple options*',
                              //   searchHintText: 'Search for a country',
                              //   isSearchable: true,
                              //   icon: const FaIcon(
                              //     FontAwesomeIcons.angleDown,
                              //     color: Color(0xFFB3B9C4),
                              //     size: 24.0,
                              //   ),
                              //   searchHintTextStyle: TextStyle(
                              //     color: const Color(0xFF243757),
                              //     fontSize:
                              //         MediaQuery.sizeOf(context).width <=
                              //                 479.0
                              //             ? 11.0
                              //             : 14.0,
                              //   ),
                              //   controller: dropDownCountryCodeValueController ??=
                              //       dropDownCountryCodeValueControllerInitial,
                              //   options: const [],
                              //   optionLabels: const [],
                              //   textStyle: TextStyle(
                              //     color: const Color(0xFF243757),
                              //     fontSize:
                              //         MediaQuery.sizeOf(context).width <=
                              //                 479.0
                              //             ? 11.0
                              //             : 14.0,
                              //   ),
                              // ),

                              success: (CountryCodeEntity entity) =>
                                  CountryNameDropDown<CountryData>(
                                elevation: 0.0,
                                isMultiSelect: true,
                                disabled: false,

                                borderColor: const Color(0xFFB3B9C4),
                                borderWidth: 1.0,
                                borderRadius: 4.0,
                                fillColor: const Color(0xFFFFFFFF),
                                margin: const EdgeInsetsDirectional.fromSTEB(
                                    4.0, 0.0, 4.0, 0.0),
                                hidesUnderline: true,
                                width: Responsive.isDesktop(context)
                                    ? 131.w
                                    : double.infinity,
                                height: 44.0,
                                hintText: 'Select one or multiple options*',
                                searchHintText: 'Search for a country',
                                isSearchable: true,
                                icon: const FaIcon(
                                  Icons.keyboard_arrow_down,
                                  color: Color(0xFFB3B9C4),
                                  size: 28.0,
                                ),
                                controller: dropDownCountryCodeValueController ??=
                                    dropDownCountryCodeValueControllerInitial,
                                options: entity.data ?? [],
                                searchHintTextStyle: TextStyle(
                                  color: Theme.of(context).hintColor,
                                  fontSize: 14.0,
                                ),
                                // optionLabels: (entity.data!) as List,
                                textStyle: TextStyle(
                                  color: const Color(0xFF243757),
                                  fontSize:
                                      MediaQuery.sizeOf(context).width <= 479.0
                                          ? 11.0
                                          : 14.0,
                                ),
                                // onChanged: (value) {
                                //   setState(() {
                                //     selctedContryCodeValue = value!.phoneCode!;
                                //   });
                                // },

                                onChangedForMultiSelect: (selectedItems) {
                                  selctedContryCodeValue = selectedItems!
                                      .map((country) => country.phoneCode ?? "")
                                      .join(", ");
                                  selctedContryName = selectedItems
                                      .map((country) => country.name ?? "")
                                      .join(", ");

                                  // setState(() {
                                  //   selctedContryCodeValue = selectedCodes;
                                  //   selctedContryName = selectedName;
                                  // });
                                },

                                //onChangedForMultiSelect: (p0) {},
                              ),
                              error: (String error) => const Center(),
                            );
                          },
                          listener: (context, state) {}),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'For Indian recipients, do you have an Indian registered sender ID?',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.normal,
                      fontSize: 14.0,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.5, horizontal: 8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFFB3B9C4),
                        width: 1.0, // Adjust the border width as needed
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                      // Adjust the border radius as needed
                    ),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Radio(
                              activeColor: Colors.green,
                              value: 'yes',
                              groupValue: selectedOptionSenderID,
                              onChanged: (value) {
                                setState(() {
                                  selectedOptionSenderID = value!;
                                });
                              },
                            ),
                            const Text(
                              "Yes, I have",
                              softWrap: true,
                              style: TextStyle(
                                  color: Color(0xFF243757),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Flexible(
                          child: Row(
                            children: [
                              Radio(
                                activeColor: Colors.green,
                                value: 'no',
                                groupValue: selectedOptionSenderID,
                                onChanged: (value) {
                                  setState(() {
                                    selectedOptionSenderID = value!;
                                  });
                                },
                              ),
                              const Flexible(
                                child: Text(
                                  'No, I don\'t have',
                                  softWrap: true,
                                  style: TextStyle(
                                      color: Color(0xFF243757),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Tell us how you will be using Message Central’s SMS broadcast service',
                    style: TextStyle(
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.normal,
                      fontSize: 14.0,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Wrap(
                    spacing: 20.0,
                    runSpacing: 20.0,
                    alignment: WrapAlignment.spaceBetween,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    direction: Axis.horizontal,
                    runAlignment: WrapAlignment.spaceBetween,
                    verticalDirection: VerticalDirection.down,
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: Responsive.isDesktop(context)
                            ? 63.w
                            : double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: selectedOption == 'no'
                                ? Colors.green
                                : const Color(0xFFB3B9C4),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedOption = 'no';
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              selectedOption == 'no'
                                  ? const Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : const Icon(Icons.circle,
                                      color: Color(0xFFB3B9C4)),
                              const SizedBox(
                                width: 8,
                              ),
                              const Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'User Account',
                                      style: TextStyle(
                                        color:
                                            AppColors.primaryText, // dark color
                                        fontWeight: FontWeight.bold, // bold
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'I’m using SMS broadcast service for my own brand/business',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Color(0xFF5D6B82),
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: Responsive.isDesktop(context)
                            ? 63.w
                            : double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: selectedOption == 'yes'
                                ? Colors.green
                                : const Color(0xFFB3B9C4),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedOption = 'yes';
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              selectedOption == 'yes'
                                  ? const Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : const Icon(Icons.circle,
                                      color: Color(0xFFB3B9C4)),
                              const SizedBox(
                                width: 8,
                              ),
                              const Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Reseller',
                                      style: TextStyle(
                                        color:
                                            AppColors.primaryText, // dark color
                                        fontWeight: FontWeight.bold, // bold
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "I’m using SMS broadcast service for my client brand(s)",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Color(0xFF5D6B82),
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            );
          }),
          isActive: _activeStepIndex == 0,
          stepState: _getStepState(0),
        ),
        _customStep(
          title: Text(
            'Billing Address',
            style: _getStepTextStyle(1),
          ),
          content: BlocBuilder<FindByCustomerIdBloc, FindByCustomerIdState>(
              builder: (context, state) {
            addresscontroller.text =
                state.findByCustomerIdEntity?.data?.address ?? "";
            // countryController.text =
            //     state.findByCustomerIdEntity?.data?.country ?? "";
            cityController.text =
                state.findByCustomerIdEntity?.data?.city ?? "";
            stateController.text =
                state.findByCustomerIdEntity?.data?.state ?? "";
            postalCodecontroller.text =
                state.findByCustomerIdEntity?.data?.postalCode ?? "";
            return Form(
              key: formKeys[1],
              child: Column(
                children: <Widget>[
                  Column(
                    // mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Address',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontWeight: FontWeight.normal,
                          fontSize: 14.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 5.0, 0.0, 0.0),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: addresscontroller,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          focusNode: _addressControllerFocus,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Address',
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
                                color: Color(0xFFF4493E),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFFF4493E),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            filled: true,
                            fillColor: AppColors.primaryBackground,
                          ),
                          style: const TextStyle(
                            color: AppColors.primaryText,
                            fontSize: 14.0,
                          ),
                          keyboardType: TextInputType.streetAddress,
                          validator: (v) {
                            return validateall(v, "Address");
                          },
                          onFieldSubmitted: (value) {
                            addresscontroller.text = value;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
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
                        LayoutBuilder(builder: (context, boxConstraints) {
                          return SizedBox(
                            width: boxConstraints.maxWidth / 2.1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Country',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppColors.primaryText,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14.0,
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  textInputAction: TextInputAction.next,
                                  controller: countryController,
                                  focusNode: _countryControllerFocus,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'Enter  Country',
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
                                        color: Color(0xFFF4493E),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0xFFF4493E),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    filled: true,
                                    fillColor: AppColors.primaryBackground,
                                  ),
                                  style: const TextStyle(
                                    color: AppColors.primaryText,
                                    fontSize: 14.0,
                                  ),
                                  // validator: (v) {
                                  //   return validateall(v, "Country");
                                  // },
                                  onFieldSubmitted: (value) {
                                    countryController.text = value;
                                  },
                                ),
                              ],
                            ),
                          );
                        }),
                        LayoutBuilder(builder: (context, boxConstraints) {
                          return SizedBox(
                            width: boxConstraints.maxWidth / 2.1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'State',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppColors.primaryText,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14.0,
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                TextFormField(
                                  textInputAction: TextInputAction.next,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  controller: stateController,
                                  focusNode: _stateControllerFocus,
                                  textCapitalization: TextCapitalization.words,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'Enter State',
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
                                        color: Color(0xFFF4493E),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0xFFF4493E),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    filled: true,
                                    fillColor: AppColors.primaryBackground,
                                  ),
                                  style: const TextStyle(
                                    color: AppColors.primaryText,
                                    fontSize: 14.0,
                                  ),
                                  // validator: (v) {
                                  //   return validateall(v, "State");
                                  // },

                                  onFieldSubmitted: (value) {
                                    stateController.text = value;
                                  },
                                ),
                              ],
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
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
                        LayoutBuilder(builder: (context, boxConstraints) {
                          return SizedBox(
                            width: boxConstraints.maxWidth / 2.1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'City',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppColors.primaryText,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14.0,
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                TextFormField(
                                  textInputAction: TextInputAction.next,
                                  controller: cityController,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  focusNode: _cityControllerFocus,
                                  textCapitalization: TextCapitalization.words,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'Enter City',
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
                                        color: Color(0xFFF4493E),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0xFFF4493E),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    filled: true,
                                    fillColor: AppColors.primaryBackground,
                                  ),
                                  style: const TextStyle(
                                    color: AppColors.primaryText,
                                    fontSize: 14.0,
                                  ),
                                  // validator: (v) {
                                  //   return validateall(v, "City");
                                  // },
                                  onFieldSubmitted: (value) {
                                    cityController.text = value;
                                  },
                                ),
                              ],
                            ),
                          );
                        }),
                        LayoutBuilder(builder: (context, boxConstraints) {
                          return SizedBox(
                            width: boxConstraints.maxWidth / 2.1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Zip Code',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppColors.primaryText,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14.0,
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                TextFormField(
                                  textInputAction: TextInputAction.done,
                                  controller: postalCodecontroller,
                                  focusNode: _postalCodeControllerFocus,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,

                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'Enter  Zip Code',
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
                                        color: Color(0xFFF4493E),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0xFFF4493E),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    filled: true,
                                    fillColor: AppColors.primaryBackground,
                                  ),
                                  style: const TextStyle(
                                    color: AppColors.primaryText,
                                    fontSize: 14.0,
                                  ),
                                  keyboardType: TextInputType.number,
                                  // validator: (v) {
                                  //   return validateall(
                                  //       v, "Postal Code");
                                  // },
                                  // validator: _model.postalTextFieldControllerValidator
                                  //     .asValidator(context),

                                  validator: (v) {
                                    return validateall(v, "ZipCode");
                                  },

                                  onFieldSubmitted: (value) {
                                    postalCodecontroller.text = value;
                                  },
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp('[0-9]'))
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            );
          }),
          isActive: _activeStepIndex == 1,
          stepState: _getStepState(1),
        ),
        _customStep(
          title: Text(
            'Summary',
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            style: _getStepTextStyle(2),
          ),
          content: Column(
            children: <Widget>[
              Wrap(
                spacing: 20.0,
                runSpacing: 20.0,
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                direction: Axis.horizontal,
                runAlignment: WrapAlignment.start,
                verticalDirection: VerticalDirection.down,
                clipBehavior: Clip.none,
                children: [
                  const Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 230,
                        child: Text(
                          'Name',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.normal,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 230,
                        child: Text(
                          firstNamecontroller.text,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            color: Color(0xFF243757),
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                width: 705,
                child: Divider(
                  thickness: 1.0,
                  color: Color(0xFFDFE2E6),
                ),
              ),
              Wrap(
                spacing: 20.0,
                runSpacing: 20.0,
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                direction: Axis.horizontal,
                runAlignment: WrapAlignment.start,
                verticalDirection: VerticalDirection.down,
                clipBehavior: Clip.none,
                children: [
                  const Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 230,
                        child: Text(
                          'Company name',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.normal,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 230,
                        child: Text(
                          companyName ?? '',
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                width: 705,
                child: Divider(
                  thickness: 1.0,
                  color: Color(0xFFDFE2E6),
                ),
              ),
              Wrap(
                spacing: 20.0,
                runSpacing: 20.0,
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                direction: Axis.horizontal,
                runAlignment: WrapAlignment.start,
                verticalDirection: VerticalDirection.down,
                clipBehavior: Clip.none,
                children: [
                  const Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 230,
                        child: Text(
                          'Company website',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.normal,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 230,
                        child: Text(
                          companyWebsite ?? '',
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            color: Color(0xFF243757),
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                width: 705,
                child: Divider(
                  thickness: 1.0,
                  color: Color(0xFFDFE2E6),
                ),
              ),
              Wrap(
                spacing: 20.0,
                runSpacing: 20.0,
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                direction: Axis.horizontal,
                runAlignment: WrapAlignment.start,
                verticalDirection: VerticalDirection.down,
                clipBehavior: Clip.none,
                children: [
                  const Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 230,
                        child: Text(
                          'Working email',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.normal,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 230,
                        child: Text(
                          emailcontroller.text,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            color: Color(0xFF243757),
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                width: 705,
                child: Divider(
                  thickness: 1.0,
                  color: Color(0xFFDFE2E6),
                ),
              ),
              Wrap(
                spacing: 20.0,
                runSpacing: 20.0,
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                direction: Axis.horizontal,
                runAlignment: WrapAlignment.start,
                verticalDirection: VerticalDirection.down,
                clipBehavior: Clip.none,
                children: [
                  const Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 230,
                        child: Text(
                          'Contact number',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.normal,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 230,
                        child: Text(
                          "+${phoneNumbercontroller.text}",
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            color: Color(0xFF243757),
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                width: 705,
                child: Divider(
                  thickness: 1.0,
                  color: Color(0xFFDFE2E6),
                ),
              ),
              Wrap(
                spacing: 20.0,
                runSpacing: 20.0,
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                direction: Axis.horizontal,
                runAlignment: WrapAlignment.start,
                verticalDirection: VerticalDirection.down,
                clipBehavior: Clip.none,
                children: [
                  const Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 230,
                        child: Text(
                          'Which country you want to send SMS to?',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.normal,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 230,
                        child: Text(
                          selctedContryName,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            color: Color(0xFF243757),
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                width: 705,
                child: Divider(
                  thickness: 1.0,
                  color: Color(0xFFDFE2E6),
                ),
              ),
              Wrap(
                spacing: 20.0,
                runSpacing: 20.0,
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                direction: Axis.horizontal,
                runAlignment: WrapAlignment.start,
                verticalDirection: VerticalDirection.down,
                clipBehavior: Clip.none,
                children: [
                  const Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 230,
                        child: Text(
                          'For Indian recipients, do you have an Indian registered sender ID?',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.normal,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 230,
                        child: Text(
                          selectedOptionSenderID != null &&
                                  selectedOptionSenderID == 'yes'
                              ? "Yes, I have"
                              : "No, I don't have",
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            color: Color(0xFF243757),
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                width: 705,
                child: Divider(
                  thickness: 1.0,
                  color: Color(0xFFDFE2E6),
                ),
              ),
              Wrap(
                spacing: 20.0,
                runSpacing: 20.0,
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                direction: Axis.horizontal,
                runAlignment: WrapAlignment.start,
                verticalDirection: VerticalDirection.down,
                clipBehavior: Clip.none,
                children: [
                  const Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 230,
                        child: Text(
                          'How you will using Message Central’s SMS broadcast service',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.normal,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 230,
                        child: Text(
                          selectedOption != null && selectedOption == 'yes'
                              ? "I’m using SMS broadcast service for my own brand/business"
                              : "I’m using SMS broadcast service for my client brand(s)",
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            color: Color(0xFF243757),
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                width: 705,
                child: Divider(
                  thickness: 1.0,
                  color: Color(0xFFDFE2E6),
                ),
              ),
              Wrap(
                spacing: 20.0,
                runSpacing: 20.0,
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                direction: Axis.horizontal,
                runAlignment: WrapAlignment.start,
                verticalDirection: VerticalDirection.down,
                clipBehavior: Clip.none,
                children: [
                  const Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 230,
                        child: Text(
                          'Billing address',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.normal,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 230,
                        child: Text(
                          '${addresscontroller.text}, ${cityController.text}, ${stateController.text}, ${countryController.text}, ${postalCodecontroller.text}',
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            color: Color(0xFF243757),
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                width: 705,
                child: Divider(
                  thickness: 1.0,
                  color: Color(0xFFDFE2E6),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
          isActive: _activeStepIndex == 2,
          stepState: _getStepState(2),
        ),
      ];
}

void _showSuccessPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const SuccessPopupWidgetDialog();
    },
  );
}

void _showSuccessPopupRequestAlreadyExists(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const SuccessPopupWidgetRequestAlreadyExists();
    },
  );
}
