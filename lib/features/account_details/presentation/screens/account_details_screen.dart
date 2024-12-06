import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:messagecentral/core/constants/app_colors.dart';
import 'package:messagecentral/core/global_widgets/custom_button.dart';
import 'package:messagecentral/core/utils/firebase_analytics_functions.dart';
import 'package:messagecentral/core/utils/mix_pannel.dart';
import 'package:messagecentral/core/utils/validator.dart';
import 'package:messagecentral/features/account_details/presentation/screens/bloc/account_details_bloc.dart';
import 'package:messagecentral/features/account_details/presentation/screens/bloc/account_details_event.dart';
import 'package:messagecentral/features/account_details/presentation/screens/bloc/account_details_state.dart';
import 'package:messagecentral/features/account_details/presentation/screens/bloc/update_password_bloc.dart';
import 'package:messagecentral/features/account_details/presentation/screens/bloc/update_phone_no_bloc.dart';
import 'package:messagecentral/features/account_details/presentation/screens/bloc/update_phone_no_get_otp_bloc.dart';
import 'package:messagecentral/features/account_details/presentation/screens/widgets/update_mobile_number.dart';
import 'package:messagecentral/features/account_details/presentation/screens/widgets/update_password_widget.dart';
import 'package:messagecentral/features/find_by_customer_id/presentation/bloc/find_by_customer_id_bloc.dart';
import 'package:messagecentral/features/find_by_customer_id/presentation/bloc/find_by_customer_id_state.dart';
import 'package:messagecentral/injection_container.dart';

class AccountDetailsScreen extends StatefulWidget {
  const AccountDetailsScreen({super.key});

  @override
  State<AccountDetailsScreen> createState() => _AccountDetailsScreenState();
}

class _AccountDetailsScreenState extends State<AccountDetailsScreen>
    with Validator {
  final formKey = GlobalKey<FormState>();
  final FocusNode _firstNameControllerFocus = FocusNode();
  final FocusNode _lastNameControllerFocus = FocusNode();
  final FocusNode _addressControllerFocus = FocusNode();
  final FocusNode _cityControllerFocus = FocusNode();
  final FocusNode _countryControllerFocus = FocusNode();
  final FocusNode _stateControllerFocus = FocusNode();
  final FocusNode _postalCodeControllerFocus = FocusNode();
  final FocusNode _emailControllerFocus = FocusNode();
  final FocusNode _phoneNumberControllerFocus = FocusNode();
  String? firstName, lastName, email, address, postalcode;
  TextEditingController firstNamecontroller = TextEditingController();
  TextEditingController lastNamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController postalCodecontroller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumbercontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    MixPanelAnalyticsManager()
        .sendEvent('account_details_landing', 'Account details landing', null);
    setScreenFirebase('account_details_landing', 'Account details landing');
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<AccountDetailsBloc>()),
        BlocProvider(create: (_) => getIt<UpdatePasswordBloc>()),
      ],
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.2,
          backgroundColor: Colors.white,
          toolbarHeight: 76.5,
          shadowColor: Colors.transparent,
          titleTextStyle: const TextStyle(color: Colors.black),
          title: Text(
            "Account Details",
            style: TextStyle(
              color: AppColors.primaryTextColor,
              fontWeight: FontWeight.w600,
              fontSize: 24.0,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: BlocConsumer<FindByCustomerIdBloc, FindByCustomerIdState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is FindByCustomerIdStateSuccess) {
                  firstNamecontroller.text =
                      state.findByCustomerIdEntity?.data?.firstName ?? "";
                  lastNamecontroller.text =
                      state.findByCustomerIdEntity?.data?.lastName ?? "";
                  emailcontroller.text =
                      state.findByCustomerIdEntity?.data?.email ?? "";
                  phoneNumbercontroller.text =
                      state.findByCustomerIdEntity?.data?.phoneNo ?? "";
                  addresscontroller.text =
                      state.findByCustomerIdEntity?.data?.address ?? "";
                  countryController.text =
                      state.findByCustomerIdEntity?.data?.country ?? "";
                  cityController.text =
                      state.findByCustomerIdEntity?.data?.city ?? "";
                  stateController.text =
                      state.findByCustomerIdEntity?.data?.state ?? "";
                  postalCodecontroller.text =
                      state.findByCustomerIdEntity?.data?.postalCode ?? "";
                  passwordController.text =
                      state.findByCustomerIdEntity?.data?.password ?? "";
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Form(
                      key: formKey,
                      child: Column(
                        //padding: const EdgeInsets.symmetric(horizontal: 20),
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 20.0),
                              child: Container(
                                width: 80.0,
                                height: 80.0,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFEFAF34),
                                  shape: BoxShape.circle,
                                ),
                                child: Align(
                                  alignment:
                                      const AlignmentDirectional(0.00, 0.00),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            1.0, 1.0, 1.0, 1.0),
                                    child: Text(
                                      // '${functions.getInitialsFun(FFAppState().fName)}${functions.getInitialsFun(FFAppState().lName)}',
                                      state.findByCustomerIdEntity?.data
                                              ?.firstName!
                                              .substring(0, 1)
                                              .toUpperCase() ??
                                          "",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Color(0xFF091E42),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 27.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 705,
                            child: Divider(
                              thickness: 1.0,
                              color: Color(0xFFDFE2E6),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
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
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'First Name',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AppColors.primaryText,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                    child: SizedBox(
                                      width: 343.0,
                                      child: TextFormField(
                                        controller: firstNamecontroller,
                                        textInputAction: TextInputAction.next,
                                        focusNode: _firstNameControllerFocus,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,

                                        textCapitalization:
                                            TextCapitalization.words,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: 'Enter First Name',
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
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0xFFF4493E),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              AppColors.primaryBackground,
                                        ),
                                        style: const TextStyle(
                                          color: AppColors.primaryText,
                                          fontSize: 14.0,
                                        ),
                                        keyboardType: TextInputType.name,
                                        validator: validateFirstname,
                                        // validator: _model
                                        //     .fNameTextFieldControllerValidator
                                        //     .asValidator(context),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp('[a-zA-Z]')),
                                        ],

                                        onFieldSubmitted: (newValue) {
                                          firstNamecontroller.text = newValue;
                                          FocusScope.of(context).requestFocus(
                                              _lastNameControllerFocus);
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Last Name',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AppColors.primaryText,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                    child: SizedBox(
                                      width: 343.0,
                                      child: TextFormField(
                                        controller: lastNamecontroller,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,

                                        textCapitalization:
                                            TextCapitalization.words,
                                        focusNode: _lastNameControllerFocus,
                                        textInputAction: TextInputAction.next,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: 'Enter Last Name',
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
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0xFFF4493E),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              AppColors.primaryBackground,
                                        ),
                                        style: const TextStyle(
                                          color: AppColors.primaryText,
                                          fontSize: 14.0,
                                        ),
                                        keyboardType: TextInputType.name,
                                        validator: validateLastname,
                                        // validator: _model
                                        //     .lNameTextFieldControllerValidator
                                        //     .asValidator(context),

                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp('[a-zA-Z]'))
                                        ],
                                        onFieldSubmitted: (newValue) {
                                          lastNamecontroller.text = newValue;
                                          FocusScope.of(context).requestFocus(
                                              _addressControllerFocus);
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
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
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Email',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AppColors.primaryText,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                    child: SizedBox(
                                      width: 343.0,
                                      child: TextFormField(
                                        focusNode: _emailControllerFocus,
                                        textInputAction: TextInputAction.next,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        controller: emailcontroller,
                                        textCapitalization:
                                            TextCapitalization.none,
                                        readOnly: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: 'Enter Email',
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
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0xFFF4493E),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              AppColors.secondaryBackground,
                                        ),
                                        style: TextStyle(
                                          color: AppColors.black50,
                                          fontSize: 14.0,
                                        ),
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        validator: validateEmail,
                                        onFieldSubmitted: (value) {
                                          emailcontroller.text = value;
                                          FocusScope.of(context).requestFocus(
                                              _phoneNumberControllerFocus);
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 343.0,
                                    decoration: const BoxDecoration(),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Mobile Number',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: AppColors.primaryText,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            MixPanelAnalyticsManager().sendEvent(
                                                'account_details_update_password_confirm',
                                                'Account details update password confirm',
                                                null);
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return MultiBlocProvider(
                                                  providers: [
                                                    BlocProvider(
                                                      create: (context) => getIt<
                                                          UpdatePhoneNoGetOtpBloc>(),
                                                    ),
                                                    BlocProvider(
                                                        create: (_) => getIt<
                                                            UpdatePhoneNoBloc>()),
                                                  ],
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: const SizedBox(
                                                      height: double.infinity,
                                                      child:
                                                          UpdateMobileNumberWidget(),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          child: const Text(
                                            'Update',
                                            style: TextStyle(
                                              color: Color(0xFF20A4CD),
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                    child: SizedBox(
                                      width: 343.0,
                                      child: TextFormField(
                                        // controller:
                                        //     _model.mobileTextFieldController,
                                        controller: phoneNumbercontroller,
                                        focusNode: _phoneNumberControllerFocus,
                                        textInputAction: TextInputAction.next,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,

                                        readOnly: true,
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
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0xFFF4493E),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              AppColors.secondaryBackground,
                                        ),
                                        style: TextStyle(
                                          color: AppColors.black50,
                                          fontSize: 14.0,
                                        ),
                                        validator: validateMobileNumber,
                                        onFieldSubmitted: (value) {
                                          phoneNumbercontroller.text = value;
                                          FocusScope.of(context).requestFocus(
                                              _addressControllerFocus);
                                        },
                                        // validator: _model
                                        //     .mobileTextFieldControllerValidator
                                        //     .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const SizedBox(
                            width: 705,
                            child: Divider(
                              thickness: 1.0,
                              color: Color(0xFFDFE2E6),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
                            child: Text(
                              'Address',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.primaryText,
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 0.0),
                            child: SizedBox(
                              width: 705.0,
                              child: TextFormField(
                                textInputAction: TextInputAction.next,
                                controller: addresscontroller,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
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
                                onFieldSubmitted: (newValue) {
                                  FocusScope.of(context)
                                      .requestFocus(_countryControllerFocus);
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
                            child: Wrap(
                              spacing: 20.0,
                              runSpacing: 20.0,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
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
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 5.0, 0.0, 0.0),
                                      child: SizedBox(
                                        width: 343.0,
                                        child: TextFormField(
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
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
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0xFFF4493E),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                AppColors.primaryBackground,
                                          ),
                                          style: const TextStyle(
                                            color: AppColors.primaryText,
                                            fontSize: 14.0,
                                          ),
                                          validator: (v) {
                                            return validateall(v, "Country");
                                          },
                                          onFieldSubmitted: (newValue) {
                                            countryController.text = newValue;
                                            FocusScope.of(context).requestFocus(
                                                _stateControllerFocus);
                                          },
                                          // validator: _model.countryTextFieldControllerValidator
                                          //     .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
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
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 5.0, 0.0, 0.0),
                                      child: SizedBox(
                                        width: 343.0,
                                        child: TextFormField(
                                          textInputAction: TextInputAction.next,
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          controller: stateController,

                                          focusNode: _stateControllerFocus,
                                          textCapitalization:
                                              TextCapitalization.words,
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
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0xFFF4493E),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                AppColors.primaryBackground,
                                          ),
                                          style: const TextStyle(
                                            color: AppColors.primaryText,
                                            fontSize: 14.0,
                                          ),
                                          validator: (v) {
                                            return validateall(v, "State");
                                          },

                                          onFieldSubmitted: (newValue) {
                                            stateController.text = newValue;
                                            FocusScope.of(context).requestFocus(
                                                _cityControllerFocus);
                                          },
                                          // validator: _model.stateTextFieldControllerValidator
                                          //     .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 16.0),
                            child: Wrap(
                              spacing: 20.0,
                              runSpacing: 20.0,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
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
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 5.0, 0.0, 0.0),
                                      child: SizedBox(
                                        width: 343.0,
                                        child: TextFormField(
                                          textInputAction: TextInputAction.next,
                                          controller: cityController,

                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,

                                          focusNode: _cityControllerFocus,
                                          textCapitalization:
                                              TextCapitalization.words,
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
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0xFFF4493E),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                AppColors.primaryBackground,
                                          ),
                                          style: const TextStyle(
                                            color: AppColors.primaryText,
                                            fontSize: 14.0,
                                          ),
                                          validator: (v) {
                                            return validateall(v, "City");
                                          },
                                          onFieldSubmitted: (newValue) {
                                            cityController.text = newValue;
                                            FocusScope.of(context).requestFocus(
                                                _postalCodeControllerFocus);
                                          },
                                          // validator: _model.cityTextFieldControllerValidator
                                          //     .asValidator(context),
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(
                                                RegExp('[a-zA-Z]'))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Postal Code',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: AppColors.primaryText,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 5.0, 0.0, 0.0),
                                      child: SizedBox(
                                        width: 343.0,
                                        child: TextFormField(
                                          textInputAction: TextInputAction.done,
                                          controller: postalCodecontroller,
                                          focusNode: _postalCodeControllerFocus,
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,

                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: 'Enter  Postal Code',
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
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0xFFF4493E),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                AppColors.primaryBackground,
                                          ),
                                          style: const TextStyle(
                                            color: AppColors.primaryText,
                                            fontSize: 14.0,
                                          ),
                                          keyboardType: TextInputType.number,
                                          validator: (v) {
                                            return validateall(
                                                v, "Postal Code");
                                          },
                                          // validator: _model.postalTextFieldControllerValidator
                                          //     .asValidator(context),
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(
                                                RegExp('[0-9]'))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Wrap(
                            children: [
                              SizedBox(
                                width: 705.0,
                                child: Divider(
                                  thickness: 1.0,
                                  color: Color(0xFFDFE2E6),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
                            child: SizedBox(
                              width: 343.0,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Password',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AppColors.primaryText,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      MixPanelAnalyticsManager().sendEvent(
                                          'account_details_update_password',
                                          'Account details update password',
                                          null);
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return BlocProvider(
                                            create: (context) =>
                                                getIt<UpdatePasswordBloc>(),
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child:
                                                  const UpdatePasswordWidget(),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: const Text(
                                      'Update',
                                      style: TextStyle(
                                        color: Color(0xFF20A4CD),
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 0.0),
                            child: SizedBox(
                              width: 343.0,
                              child: TextFormField(
                                // controller: passwordController,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,

                                readOnly: true,
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: '*******',
                                  hintStyle: const TextStyle(
                                    color: Color(0xFF42526D),
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
                                  fillColor: AppColors.secondaryBackground,
                                ),
                                style: TextStyle(
                                  color: AppColors.black50,
                                  fontSize: 14.0,
                                ),
                                validator: (value) {
                                  return validatePassword(value);
                                },
                                onFieldSubmitted: (value) {
                                  passwordController.text = value;
                                },
                                // validator: _model.passwordTextFieldControllerValidator
                                //     .asValidator(context),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 25.0, 0.0, 0.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 4.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        context.goNamed('home');
                                        MixPanelAnalyticsManager().sendEvent(
                                            'account_details_cancel',
                                            'Account details cancel',
                                            null);
                                        // _model.updatePage(() {
                                        //   FFAppState().selectedPage =
                                        //       'dashboard_verifynow';
                                        // });
                                      },
                                      text: 'Cancel',
                                      options: FFButtonOptions(
                                        width: 167.0,
                                        height: 44.0,
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                        iconPadding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                        color: AppColors.primaryBackground,
                                        textStyle: const TextStyle(
                                          color: Color(0xFF2861B4),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14.0,
                                        ),
                                        borderSide: const BorderSide(
                                          color: Color(0xFF2861B4),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        hoverElevation: 5.0,
                                      ),
                                      showLoadingIndicator: false,
                                    ),
                                  ),
                                  BlocListener<AccountDetailsBloc,
                                      AccountDetailsState>(
                                    listener: (context, states) {
                                      if (states
                                              is AccountDetailsStateSuccess &&
                                          states.findByCustomerIdEntity!.data !=
                                              null) {
                                        showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              content: const Text(
                                                  'Account details succesfully saved!'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: const Text('OK'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      } else if (states
                                              is AccountDetailsStateSuccess &&
                                          states.findByCustomerIdEntity!.data ==
                                              null) {
                                        showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              content: Text(states
                                                      .findByCustomerIdEntity
                                                      ?.message ??
                                                  ""),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: const Text('OK'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      } else if (states
                                          is FindByCustomerIdStateError) {
                                        showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              content: const Text(
                                                  'Something went wrong !'),
                                              actions: [
                                                TextButton(
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
                                    },
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              4.0, 0.0, 0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          context.read<AccountDetailsBloc>().add(
                                              GetAccountDetailsUpdatePressed(
                                                  fname:
                                                      firstNamecontroller.text,
                                                  lName:
                                                      lastNamecontroller.text,
                                                  city: cityController.text,
                                                  country:
                                                      countryController.text,
                                                  email: emailcontroller.text,
                                                  postalCode:
                                                      postalCodecontroller.text,
                                                  state: stateController.text,
                                                  address:
                                                      addresscontroller.text));
                                          MixPanelAnalyticsManager().sendEvent(
                                              'account_details_save',
                                              'Account details save',
                                              null);
                                        },
                                        text: 'Save Changes',
                                        options: FFButtonOptions(
                                          width: 167.0,
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
                          ScreenUtil().setVerticalSpacing(20),
                        ],
                      ),
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Form(
                      key: formKey,
                      child: Column(
                        //padding: const EdgeInsets.symmetric(horizontal: 20),
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 20.0),
                              child: Container(
                                width: 80.0,
                                height: 80.0,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFEFAF34),
                                  shape: BoxShape.circle,
                                ),
                                child: Align(
                                  alignment:
                                      const AlignmentDirectional(0.00, 0.00),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            1.0, 1.0, 1.0, 1.0),
                                    child: Text(
                                      // '${functions.getInitialsFun(FFAppState().fName)}${functions.getInitialsFun(FFAppState().lName)}',
                                      state.findByCustomerIdEntity?.data
                                              ?.firstName!
                                              .substring(0, 1)
                                              .toUpperCase() ??
                                          "",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Color(0xFF091E42),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 27.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 705,
                            child: Divider(
                              thickness: 1.0,
                              color: Color(0xFFDFE2E6),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
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
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'First Name',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AppColors.primaryText,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                    child: SizedBox(
                                      width: 343.0,
                                      child: TextFormField(
                                        controller: firstNamecontroller,
                                        textInputAction: TextInputAction.next,
                                        focusNode: _firstNameControllerFocus,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,

                                        textCapitalization:
                                            TextCapitalization.words,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: 'Enter First Name',
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
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0xFFF4493E),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              AppColors.primaryBackground,
                                        ),
                                        style: const TextStyle(
                                          color: AppColors.primaryText,
                                          fontSize: 14.0,
                                        ),
                                        keyboardType: TextInputType.name,
                                        validator: validateFirstname,
                                        // validator: _model
                                        //     .fNameTextFieldControllerValidator
                                        //     .asValidator(context),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp('[a-zA-Z]')),
                                        ],

                                        onFieldSubmitted: (newValue) {
                                          firstNamecontroller.text = newValue;
                                          FocusScope.of(context).requestFocus(
                                              _lastNameControllerFocus);
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Last Name',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AppColors.primaryText,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                    child: SizedBox(
                                      width: 343.0,
                                      child: TextFormField(
                                        controller: lastNamecontroller,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,

                                        textCapitalization:
                                            TextCapitalization.words,
                                        focusNode: _lastNameControllerFocus,
                                        textInputAction: TextInputAction.next,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: 'Enter Last Name',
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
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0xFFF4493E),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              AppColors.primaryBackground,
                                        ),
                                        style: const TextStyle(
                                          color: AppColors.primaryText,
                                          fontSize: 14.0,
                                        ),
                                        keyboardType: TextInputType.name,
                                        validator: validateLastname,
                                        // validator: _model
                                        //     .lNameTextFieldControllerValidator
                                        //     .asValidator(context),

                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp('[a-zA-Z]'))
                                        ],
                                        onFieldSubmitted: (newValue) {
                                          lastNamecontroller.text = newValue;
                                          FocusScope.of(context).requestFocus(
                                              _addressControllerFocus);
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
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
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Email',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AppColors.primaryText,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                    child: SizedBox(
                                      width: 343.0,
                                      child: TextFormField(
                                        focusNode: _emailControllerFocus,
                                        textInputAction: TextInputAction.next,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        controller: emailcontroller,
                                        textCapitalization:
                                            TextCapitalization.none,
                                        readOnly: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: 'Enter Email',
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
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0xFFF4493E),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              AppColors.secondaryBackground,
                                        ),
                                        style: TextStyle(
                                          color: AppColors.black50,
                                          fontSize: 14.0,
                                        ),
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        validator: validateEmail,
                                        onFieldSubmitted: (value) {
                                          emailcontroller.text = value;
                                          FocusScope.of(context).requestFocus(
                                              _phoneNumberControllerFocus);
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 343.0,
                                    decoration: const BoxDecoration(),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Mobile Number',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: AppColors.primaryText,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            MixPanelAnalyticsManager().sendEvent(
                                                'account_details_update_password_confirm',
                                                'Account details update password confirm',
                                                null);
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return MultiBlocProvider(
                                                  providers: [
                                                    BlocProvider(
                                                      create: (context) => getIt<
                                                          UpdatePhoneNoGetOtpBloc>(),
                                                    ),
                                                    BlocProvider(
                                                        create: (_) => getIt<
                                                            UpdatePhoneNoBloc>()),
                                                  ],
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: const SizedBox(
                                                      height: double.infinity,
                                                      child:
                                                          UpdateMobileNumberWidget(),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          child: const Text(
                                            'Update',
                                            style: TextStyle(
                                              color: Color(0xFF20A4CD),
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                    child: SizedBox(
                                      width: 343.0,
                                      child: TextFormField(
                                        // controller:
                                        //     _model.mobileTextFieldController,
                                        controller: phoneNumbercontroller,
                                        focusNode: _phoneNumberControllerFocus,
                                        textInputAction: TextInputAction.next,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,

                                        readOnly: true,
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
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0xFFF4493E),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              AppColors.secondaryBackground,
                                        ),
                                        style: TextStyle(
                                          color: AppColors.black50,
                                          fontSize: 14.0,
                                        ),
                                        validator: validateMobileNumber,
                                        onFieldSubmitted: (value) {
                                          phoneNumbercontroller.text = value;
                                          FocusScope.of(context).requestFocus(
                                              _addressControllerFocus);
                                        },
                                        // validator: _model
                                        //     .mobileTextFieldControllerValidator
                                        //     .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const SizedBox(
                            width: 705,
                            child: Divider(
                              thickness: 1.0,
                              color: Color(0xFFDFE2E6),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
                            child: Text(
                              'Address',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.primaryText,
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 0.0),
                            child: SizedBox(
                              width: 705.0,
                              child: TextFormField(
                                textInputAction: TextInputAction.next,
                                controller: addresscontroller,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
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
                                onFieldSubmitted: (newValue) {
                                  FocusScope.of(context)
                                      .requestFocus(_countryControllerFocus);
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
                            child: Wrap(
                              spacing: 20.0,
                              runSpacing: 20.0,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
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
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 5.0, 0.0, 0.0),
                                      child: SizedBox(
                                        width: 343.0,
                                        child: TextFormField(
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
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
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0xFFF4493E),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                AppColors.primaryBackground,
                                          ),
                                          style: const TextStyle(
                                            color: AppColors.primaryText,
                                            fontSize: 14.0,
                                          ),
                                          validator: (v) {
                                            return validateall(v, "Country");
                                          },
                                          onFieldSubmitted: (newValue) {
                                            countryController.text = newValue;
                                            FocusScope.of(context).requestFocus(
                                                _stateControllerFocus);
                                          },
                                          // validator: _model.countryTextFieldControllerValidator
                                          //     .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
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
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 5.0, 0.0, 0.0),
                                      child: SizedBox(
                                        width: 343.0,
                                        child: TextFormField(
                                          textInputAction: TextInputAction.next,
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          controller: stateController,

                                          focusNode: _stateControllerFocus,
                                          textCapitalization:
                                              TextCapitalization.words,
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
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0xFFF4493E),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                AppColors.primaryBackground,
                                          ),
                                          style: const TextStyle(
                                            color: AppColors.primaryText,
                                            fontSize: 14.0,
                                          ),
                                          validator: (v) {
                                            return validateall(v, "State");
                                          },

                                          onFieldSubmitted: (newValue) {
                                            stateController.text = newValue;
                                            FocusScope.of(context).requestFocus(
                                                _cityControllerFocus);
                                          },
                                          // validator: _model.stateTextFieldControllerValidator
                                          //     .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 16.0),
                            child: Wrap(
                              spacing: 20.0,
                              runSpacing: 20.0,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
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
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 5.0, 0.0, 0.0),
                                      child: SizedBox(
                                        width: 343.0,
                                        child: TextFormField(
                                          textInputAction: TextInputAction.next,
                                          controller: cityController,

                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,

                                          focusNode: _cityControllerFocus,
                                          textCapitalization:
                                              TextCapitalization.words,
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
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0xFFF4493E),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                AppColors.primaryBackground,
                                          ),
                                          style: const TextStyle(
                                            color: AppColors.primaryText,
                                            fontSize: 14.0,
                                          ),
                                          validator: (v) {
                                            return validateall(v, "City");
                                          },
                                          onFieldSubmitted: (newValue) {
                                            cityController.text = newValue;
                                            FocusScope.of(context).requestFocus(
                                                _postalCodeControllerFocus);
                                          },
                                          // validator: _model.cityTextFieldControllerValidator
                                          //     .asValidator(context),
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(
                                                RegExp('[a-zA-Z]'))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Postal Code',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: AppColors.primaryText,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 5.0, 0.0, 0.0),
                                      child: SizedBox(
                                        width: 343.0,
                                        child: TextFormField(
                                          textInputAction: TextInputAction.done,
                                          controller: postalCodecontroller,
                                          focusNode: _postalCodeControllerFocus,
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,

                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: 'Enter  Postal Code',
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
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0xFFF4493E),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                AppColors.primaryBackground,
                                          ),
                                          style: const TextStyle(
                                            color: AppColors.primaryText,
                                            fontSize: 14.0,
                                          ),
                                          keyboardType: TextInputType.number,
                                          validator: (v) {
                                            return validateall(
                                                v, "Postal Code");
                                          },
                                          // validator: _model.postalTextFieldControllerValidator
                                          //     .asValidator(context),
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(
                                                RegExp('[0-9]'))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Wrap(
                            children: [
                              SizedBox(
                                width: 705.0,
                                child: Divider(
                                  thickness: 1.0,
                                  color: Color(0xFFDFE2E6),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
                            child: SizedBox(
                              width: 343.0,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Password',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AppColors.primaryText,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      MixPanelAnalyticsManager().sendEvent(
                                          'account_details_update_password',
                                          'Account details update password',
                                          null);
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return BlocProvider(
                                            create: (context) =>
                                                getIt<UpdatePasswordBloc>(),
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child:
                                                  const UpdatePasswordWidget(),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: const Text(
                                      'Update',
                                      style: TextStyle(
                                        color: Color(0xFF20A4CD),
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 0.0),
                            child: SizedBox(
                              width: 343.0,
                              child: TextFormField(
                                // controller: passwordController,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,

                                readOnly: true,
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: '*******',
                                  hintStyle: const TextStyle(
                                    color: Color(0xFF42526D),
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
                                  fillColor: AppColors.secondaryBackground,
                                ),
                                style: TextStyle(
                                  color: AppColors.black50,
                                  fontSize: 14.0,
                                ),
                                validator: (value) {
                                  return validatePassword(value);
                                },
                                onFieldSubmitted: (value) {
                                  passwordController.text = value;
                                },
                                // validator: _model.passwordTextFieldControllerValidator
                                //     .asValidator(context),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 25.0, 0.0, 0.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 4.0, 0.0),
                                    child: FFButtonWidget(
                                      showLoadingIndicator: false,
                                      onPressed: () {
                                        context.goNamed('home');
                                        MixPanelAnalyticsManager().sendEvent(
                                            'account_details_cancel',
                                            'Account details cancel',
                                            null);
                                        // _model.updatePage(() {
                                        //   FFAppState().selectedPage =
                                        //       'dashboard_verifynow';
                                        // });
                                      },
                                      text: 'Cancel',
                                      options: FFButtonOptions(
                                        width: 167.0,
                                        height: 44.0,
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                        iconPadding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                        color: AppColors.primaryBackground,
                                        textStyle: const TextStyle(
                                          color: Color(0xFF2861B4),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14.0,
                                        ),
                                        borderSide: const BorderSide(
                                          color: Color(0xFF2861B4),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        hoverElevation: 5.0,
                                      ),
                                    ),
                                  ),
                                  BlocListener<AccountDetailsBloc,
                                      AccountDetailsState>(
                                    listener: (context, states) {
                                      if (states
                                              is AccountDetailsStateSuccess &&
                                          states.findByCustomerIdEntity!.data !=
                                              null) {
                                        showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              content: const Text(
                                                  'Account details succesfully saved!'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: const Text('OK'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      } else if (states
                                              is AccountDetailsStateSuccess &&
                                          states.findByCustomerIdEntity!.data ==
                                              null) {
                                        showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              content: Text(states
                                                      .findByCustomerIdEntity
                                                      ?.message ??
                                                  ""),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: const Text('OK'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      } else if (states
                                          is FindByCustomerIdStateError) {
                                        showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              content: const Text(
                                                  'Something went wrong !'),
                                              actions: [
                                                TextButton(
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
                                    },
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              4.0, 0.0, 0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          if (formKey.currentState!
                                              .validate()) {
                                            formKey.currentState!.save();
                                            context.read<AccountDetailsBloc>().add(
                                                GetAccountDetailsUpdatePressed(
                                                    fname: firstNamecontroller
                                                        .text,
                                                    lName:
                                                        lastNamecontroller.text,
                                                    city: cityController.text,
                                                    country:
                                                        countryController.text,
                                                    email: emailcontroller.text,
                                                    postalCode:
                                                        postalCodecontroller
                                                            .text,
                                                    state: stateController.text,
                                                    address: addresscontroller
                                                        .text));
                                          }
                                        },
                                        text: 'Save Changes',
                                        options: FFButtonOptions(
                                          width: 167.0,
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
                          ScreenUtil().setVerticalSpacing(20),
                        ],
                      ),
                    ),
                  );
                }
              }),
        ),
      ),
    );
  }
}
