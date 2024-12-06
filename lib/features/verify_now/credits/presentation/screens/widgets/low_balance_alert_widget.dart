// ignore_for_file: use_build_context_synchronously

import 'package:aligned_dialog/aligned_dialog.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messagecentral/core/base/features/countrycode/domain/entity/country_code_entity.dart';
import 'package:messagecentral/core/base/features/countrycode/presentation/screens/countrycode_screen.dart';
import 'package:messagecentral/core/base/features/countrycode/presentation/screens/cubit/country_code_cubit.dart';
import 'package:messagecentral/core/base/features/countrycode/presentation/screens/cubit/country_code_cubit_state.dart';
import 'package:messagecentral/core/base/features/countrycode/presentation/screens/widgets/form_filedController.dart';
import 'package:messagecentral/core/constants/app_colors.dart';
import 'package:messagecentral/core/global_widgets/custom_button.dart';
import 'package:messagecentral/core/utils/extention_util.dart';
import 'package:messagecentral/core/utils/local_state_cache.dart';
import 'package:messagecentral/core/utils/mix_pannel.dart';
import 'package:messagecentral/features/getuserdeails/presentation/bloc/get_user_details_bloc.dart';
import 'package:messagecentral/features/getuserdeails/presentation/bloc/get_user_details_state.dart';
import 'package:messagecentral/features/verify_now/credits/domain/usecases/get_low_balance_alert_save_usecase.dart';
import 'package:messagecentral/features/verify_now/credits/presentation/bloc/low_balalce_cubit.dart';
import 'package:messagecentral/features/verify_now/credits/presentation/bloc/low_balance_alert_save_cubit.dart';
import 'package:messagecentral/features/verify_now/credits/presentation/bloc/low_balance_alert_save_state.dart';
import 'package:messagecentral/features/verify_now/credits/presentation/bloc/low_balance_state.dart';

class LowBalanceAlertWidget extends StatefulWidget {
  const LowBalanceAlertWidget({super.key});

  @override
  State<LowBalanceAlertWidget> createState() => _LowBalanceAlertWidgetState();
}

class _LowBalanceAlertWidgetState extends State<LowBalanceAlertWidget> {
  ValueNotifier<bool> sWitchvalue = ValueNotifier<bool>(true);
  @override
  void dispose() {
    super.dispose();
    sWitchvalue.dispose();
  }

  @override
  void initState() {
    super.initState();
    context.read<LowBalanceCubit>().state.whenOrNull(
      success: (lowBalanceEntity) {
        sWitchvalue.value = lowBalanceEntity.data?.lowBalanceAlertFlag ?? true;
      },
    );
  }

  String selctedContryCodeValue = '';
  bool addmoreFlag1 = false;

  void setAddmoreFlag1({bool? value}) {
    setState(() {
      addmoreFlag1 = value ?? true;
    });
  }

  bool addmoreFlag2 = false;

  void setAddmoreFlag2({bool? value}) {
    setState(() {
      addmoreFlag2 = value ?? true;
    });
  }

  String number = '';
  final dropDownCountryCodeValueControllerInitial =
      FormFieldController<CountryData>(CountryData(
          id: 0,
          phoneCode: '91',
          isoCountryCode: '91',
          name: 'India',
          maxLength: 10,
          minLength: 0));
  FormFieldController<CountryData>? dropDownCountryCodeValueController;
  TextEditingController phoneNumbercontroller = TextEditingController();
  TextEditingController phoneNumbercontroller2 = TextEditingController();
  TextEditingController mobileNumbercontroller = TextEditingController();
  TextEditingController amountTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
        behavior: ScrollConfiguration.of(context)
            // This removes scrollbars from the inner scroll view <----
            .copyWith(scrollbars: false),
        child: BlocBuilder<GetUserDetailsBloc, GetUserDetailsState>(
          builder: (context, state) {
            mobileNumbercontroller.text =
                state.getUserDetailsEntity?.data?.phone ?? "";

            return ListView(
              children: [
                ScreenUtil().setVerticalSpacing(25),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      20.0, 20.0, 0.0, 20.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 10.0, 0.0),
                        child: Text(
                          'Low balance alerts',
                          style: GoogleFonts.getFont(
                            'Plus Jakarta Sans',
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.normal,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      BlocConsumer<LowBalanceCubit, LowBalanceState>(
                          //   bloc: getIt<LowBalanceCubit>()..getlowBalance(),
                          listener: (context, state) {
                        state.mapOrNull(
                          success: (value) {
                            setState(() {
                              sWitchvalue.value = value.lowBalanceEntity.data
                                      ?.lowBalanceAlertFlag ??
                                  false;

                              amountTextEditingController.text = value
                                      .lowBalanceEntity.data?.alertAmount
                                      ?.toString() ??
                                  "";
                            });
                          },
                        );
                      }, builder: (context, state) {
                        return state.when(
                            initial: () => const Center(),
                            loading: () => const Center(),
                            success: (data) {
                              sWitchvalue.value =
                                  data.data?.lowBalanceAlertFlag ?? false;
                              amountTextEditingController.text =
                                  data.data?.alertAmount?.toString() ?? "";
                              return SizedBox(
                                width: 55,
                                child: FlutterSwitch(
                                  height: 20.0,
                                  width: 40.0,
                                  padding: 4.0,
                                  toggleSize: 15.0,
                                  borderRadius: 10.0,
                                  activeColor: Colors.green,
                                  value:
                                      data.data?.lowBalanceAlertFlag ?? false,
                                  onToggle: (value) async {
                                    if (value == false) {
                                      await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            content: const Text(
                                                'Are you sure you want to turn off the feature? You might miss out on critical updates.'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: const Text('NO'),
                                              ),
                                              TextButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      sWitchvalue.value = value;
                                                      data.data
                                                              ?.lowBalanceAlertFlag =
                                                          value;
                                                    });
                                                    context
                                                        .read<
                                                            LowBalanceAlertSaveCubit>()
                                                        .saveLowBlanaceAlert(
                                                            LowBalanceAlertRequest(
                                                          customerId:
                                                              LocalStateCache()
                                                                  .customerId,
                                                          alertAmount: int.parse(
                                                              amountTextEditingController
                                                                  .text),
                                                          alternaletcountryCode1:
                                                              selctedContryCodeValue,
                                                          alternaletcountryCode2:
                                                              selctedContryCodeValue,
                                                          lowBalanceAlertFlag:
                                                              sWitchvalue.value,
                                                          alternatePhoneNo1:
                                                              phoneNumbercontroller
                                                                  .text,
                                                          alternatePhoneNo2:
                                                              phoneNumbercontroller2
                                                                  .text,
                                                        ));
                                                    MixPanelAnalyticsManager()
                                                        .sendEvent(
                                                            'Credits_lb_alert_disable',
                                                            'Credits low balance alert disable',
                                                            null);

                                                    Navigator.pop(
                                                        alertDialogContext,
                                                        true);
                                                  },
                                                  child: const Text('YES')),
                                            ],
                                          );
                                        },
                                      );
                                    } else {
                                      setState(() {
                                        sWitchvalue.value = value;
                                        data.data?.lowBalanceAlertFlag = value;
                                      });
                                      MixPanelAnalyticsManager().sendEvent(
                                          'Credits_lb_alert_enable',
                                          'Credits low balance alert enable',
                                          null);
                                    }
                                  },
                                ),
                              );
                            },
                            error: (error) => const Center());
                      }),
                    ],
                  ),
                ),
                if (sWitchvalue.value)
                  LayoutBuilder(builder: (context, BoxConstraints constraints) {
                    return SizedBox(
                      width: 400,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                                width: 380,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Receive alert SMS after balance falls below',
                                    ),
                                    ScreenUtil().setVerticalSpacing(4),
                                    BlocBuilder<LowBalanceCubit,
                                            LowBalanceState>(
                                        builder: (context, snapshotdata) {
                                      return snapshotdata.when(
                                          initial: () => TextFormField(
                                                controller:
                                                    amountTextEditingController,
                                                style: GoogleFonts.getFont(
                                                  'Plus Jakarta Sans',
                                                  color: AppColors.primaryText,
                                                  fontSize: 13.0,
                                                ),
                                                decoration:
                                                    const InputDecoration(
                                                  prefixIcon: IconButton(
                                                    splashRadius: 10,
                                                    icon: Text("\$"),
                                                    onPressed: null,
                                                  ),
                                                ),
                                                onFieldSubmitted: (value) {
                                                  amountTextEditingController
                                                      .text = value;
                                                },
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .allow(RegExp('[0-9]'))
                                                ],
                                              ),
                                          loading: () => TextFormField(
                                                controller:
                                                    amountTextEditingController,
                                                style: GoogleFonts.getFont(
                                                  'Plus Jakarta Sans',
                                                  color: AppColors.primaryText,
                                                  fontSize: 13.0,
                                                ),
                                                decoration:
                                                    const InputDecoration(
                                                  prefixIcon: IconButton(
                                                    splashRadius: 10,
                                                    icon: Text("\$"),
                                                    onPressed: null,
                                                  ),
                                                ),
                                                onFieldSubmitted: (value) {
                                                  amountTextEditingController
                                                      .text = value;
                                                },
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .allow(RegExp('[0-9]'))
                                                ],
                                              ),
                                          success: (v) => TextFormField(
                                                controller:
                                                    amountTextEditingController,
                                                style: GoogleFonts.getFont(
                                                  'Plus Jakarta Sans',
                                                  color: AppColors.primaryText,
                                                  fontSize: 13.0,
                                                ),
                                                decoration:
                                                    const InputDecoration(
                                                  prefixIcon: IconButton(
                                                    splashRadius: 10,
                                                    icon: Text("\$"),
                                                    onPressed: null,
                                                  ),
                                                ),
                                                onFieldSubmitted: (value) {
                                                  amountTextEditingController
                                                      .text = value;
                                                },
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .allow(RegExp('[0-9]'))
                                                ],
                                              ),
                                          error: (error) => const Center());
                                    }),
                                    ScreenUtil().setVerticalSpacing(8),
                                    const Divider(),
                                    ScreenUtil().setVerticalSpacing(8),
                                    const Text(
                                      'Send alert to',
                                    ),
                                    ScreenUtil().setVerticalSpacing(4),
                                    TextFormField(
                                      enabled: false,
                                      controller: mobileNumbercontroller,
                                      style: GoogleFonts.getFont(
                                        'Plus Jakarta Sans',
                                        color: AppColors.primaryText,
                                        fontSize: 13.0,
                                      ),
                                    ),
                                    ScreenUtil().setVerticalSpacing(8),
                                    if (sWitchvalue.value)
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 15.0, 0.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            MixPanelAnalyticsManager()
                                                .sendEvent(
                                                    'Credits_add_recipient',
                                                    'Credits add recipient',
                                                    null);

                                            setAddmoreFlag1();
                                          },
                                          text: 'Add more recipient',
                                          options: FFButtonOptions(
                                            width: 186.5,
                                            height: 36.0,
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: AppColors.primaryBackground,
                                            textStyle: GoogleFonts.getFont(
                                              'Plus Jakarta Sans',
                                              color: const Color(0xFF2861B4),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 13.0,
                                            ),
                                            elevation: 0.0,
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
                                    if (addmoreFlag1)
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(00.0, 15.0, 00.0, 20.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Form(
                                                //  key: formKey,
                                                child: Material(
                                              color: Colors.transparent,
                                              elevation: 0.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                              ),
                                              child: Container(
                                                width: 315,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                  border: Border.all(
                                                    color:
                                                        const Color(0xFFB3B9C4),
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      flex: 5,
                                                      child: BlocConsumer<
                                                              CountryCodeCubit,
                                                              CountryCodeState>(
                                                          builder: (_, state) {
                                                            return state.when(
                                                              initial: () =>
                                                                  CountryCodeDropDown<
                                                                      CountryData>(
                                                                elevation: 0.0,
                                                                hidesUnderline:
                                                                    true,
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderWidth:
                                                                    0.0,
                                                                borderRadius:
                                                                    0.0,
                                                                margin:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        0.0,
                                                                        4.0,
                                                                        0.0,
                                                                        4.0),
                                                                width: 70,
                                                                height: 40,
                                                                hintText:
                                                                    'Country code*',
                                                                searchHintText:
                                                                    'Search for a country',
                                                                isSearchable:
                                                                    true,
                                                                icon:
                                                                    const Icon(
                                                                  Icons
                                                                      .keyboard_arrow_down_sharp,
                                                                  color: Color(
                                                                      0xFF7A8699),
                                                                  size: 20.0,
                                                                ),
                                                                controller:
                                                                    dropDownCountryCodeValueController ??=
                                                                        dropDownCountryCodeValueControllerInitial,
                                                                options: const [],
                                                                optionLabels: const [],
                                                                textStyle:
                                                                    TextStyle(
                                                                  color: const Color(
                                                                      0xFF243757),
                                                                  fontSize:
                                                                      MediaQuery.sizeOf(context).width <=
                                                                              479.0
                                                                          ? 11.0
                                                                          : 13.0,
                                                                ),
                                                                searchHintTextStyle:
                                                                    TextStyle(
                                                                  color: const Color(
                                                                      0xFF243757),
                                                                  fontSize:
                                                                      MediaQuery.sizeOf(context).width <=
                                                                              479.0
                                                                          ? 11.0
                                                                          : 13.0,
                                                                ),
                                                              ),
                                                              loading: () =>
                                                                  CountryCodeDropDown<
                                                                      CountryData>(
                                                                elevation: 0.0,
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderWidth:
                                                                    0.0,
                                                                borderRadius:
                                                                    0.0,
                                                                hidesUnderline:
                                                                    true,
                                                                margin:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        0.0,
                                                                        4.0,
                                                                        0.0,
                                                                        4.0),
                                                                width: 70,
                                                                height: 40,
                                                                hintText:
                                                                    'Country code*',
                                                                searchHintText:
                                                                    'Search for a country',
                                                                isSearchable:
                                                                    true,
                                                                icon:
                                                                    const Icon(
                                                                  Icons
                                                                      .keyboard_arrow_down_sharp,
                                                                  color: Color(
                                                                      0xFF7A8699),
                                                                  size: 20.0,
                                                                ),
                                                                searchHintTextStyle:
                                                                    TextStyle(
                                                                  color: const Color(
                                                                      0xFF243757),
                                                                  fontSize:
                                                                      MediaQuery.sizeOf(context).width <=
                                                                              479.0
                                                                          ? 11.0
                                                                          : 13.0,
                                                                ),
                                                                controller:
                                                                    dropDownCountryCodeValueController ??=
                                                                        dropDownCountryCodeValueControllerInitial,
                                                                options: const [],
                                                                optionLabels: const [],
                                                                textStyle:
                                                                    TextStyle(
                                                                  color: const Color(
                                                                      0xFF243757),
                                                                  fontSize:
                                                                      MediaQuery.sizeOf(context).width <=
                                                                              479.0
                                                                          ? 11.0
                                                                          : 13.0,
                                                                ),
                                                              ),
                                                              success: (CountryCodeEntity
                                                                      entity) =>
                                                                  CountryCodeDropDown<
                                                                      CountryData>(
                                                                elevation: 0.0,
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderWidth:
                                                                    0.0,
                                                                borderRadius:
                                                                    0.0,
                                                                margin:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        0.0,
                                                                        4.0,
                                                                        0.0,
                                                                        4.0),
                                                                width: 70,
                                                                height: 40,
                                                                hidesUnderline:
                                                                    true,
                                                                hintText:
                                                                    'Country code*',
                                                                searchHintText:
                                                                    'Search for a country',
                                                                isSearchable:
                                                                    true,
                                                                icon:
                                                                    const Icon(
                                                                  Icons
                                                                      .keyboard_arrow_down_sharp,
                                                                  color: Color(
                                                                      0xFF7A8699),
                                                                ),
                                                                controller:
                                                                    dropDownCountryCodeValueController ??=
                                                                        dropDownCountryCodeValueControllerInitial,
                                                                options: entity
                                                                        .data ??
                                                                    [],
                                                                searchHintTextStyle:
                                                                    TextStyle(
                                                                  color: const Color(
                                                                      0xFF98A1B0),
                                                                  fontSize:
                                                                      MediaQuery.sizeOf(context).width <=
                                                                              479.0
                                                                          ? 11.0
                                                                          : 13.0,
                                                                ),
                                                                textStyle:
                                                                    TextStyle(
                                                                  color: const Color(
                                                                      0xFF243757),
                                                                  fontSize:
                                                                      MediaQuery.sizeOf(context).width <=
                                                                              479.0
                                                                          ? 11.0
                                                                          : 13.0,
                                                                ),
                                                                fillColor:
                                                                    Colors
                                                                        .white,
                                                                onChanged:
                                                                    (value) {
                                                                  setState(() {
                                                                    selctedContryCodeValue =
                                                                        value!
                                                                            .phoneCode!;
                                                                  });
                                                                },
                                                              ),
                                                              error: (String
                                                                      error) =>
                                                                  CountryCodeDropDown<
                                                                      CountryData>(
                                                                elevation: 0.0,
                                                                borderColor:
                                                                    const Color(
                                                                        0xFFB3B9C4),
                                                                borderWidth:
                                                                    1.0,
                                                                borderRadius:
                                                                    4.0,
                                                                // fillColor:
                                                                //     const Color(0xFFFFFFFF),
                                                                margin:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        0.0,
                                                                        4.0,
                                                                        10.0,
                                                                        4.0),
                                                                hidesUnderline:
                                                                    true,
                                                                width: 70,
                                                                height: 40.0,
                                                                hintText:
                                                                    'Country code*',
                                                                searchHintText:
                                                                    'Search for a country',
                                                                isSearchable:
                                                                    true,
                                                                icon:
                                                                    const FaIcon(
                                                                  Icons
                                                                      .keyboard_arrow_down_sharp,
                                                                  color: Color(
                                                                      0xFFB3B9C4),
                                                                  size: 20.0,
                                                                ),
                                                                controller:
                                                                    dropDownCountryCodeValueController ??=
                                                                        dropDownCountryCodeValueControllerInitial,
                                                                options: const [],
                                                                optionLabels: const [],
                                                                searchHintTextStyle:
                                                                    const TextStyle(
                                                                        color: Color(
                                                                            0xFF98A1B0),
                                                                        fontSize:
                                                                            13),
                                                                textStyle:
                                                                    TextStyle(
                                                                  color: const Color(
                                                                      0xFF243757),
                                                                  fontSize:
                                                                      MediaQuery.sizeOf(context).width <=
                                                                              479.0
                                                                          ? 11.0
                                                                          : 12.0,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          listener: (context,
                                                              state) {}),
                                                    ),
                                                    Expanded(
                                                      flex: 5,
                                                      child: SizedBox(
                                                        width: 100.0,
                                                        child: TextFormField(
                                                          controller:
                                                              phoneNumbercontroller,

                                                          obscureText: false,
                                                          decoration:
                                                              const InputDecoration(
                                                            hintText:
                                                                'Enter Mobile No',
                                                            hintStyle:
                                                                TextStyle(
                                                              color: Color(
                                                                  0xFF98A1B0),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              fontSize: 13.0,
                                                            ),
                                                            border: InputBorder
                                                                .none,
                                                            enabledBorder:
                                                                InputBorder
                                                                    .none,
                                                            focusedBorder:
                                                                InputBorder
                                                                    .none,
                                                            errorBorder:
                                                                InputBorder
                                                                    .none,
                                                            focusedErrorBorder:
                                                                InputBorder
                                                                    .none,
                                                            contentPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15.0,
                                                                        15.0,
                                                                        15.0,
                                                                        15.0),
                                                          ),
                                                          style: const TextStyle(
                                                              color: AppColors
                                                                  .primaryText,
                                                              fontSize: 13.0,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis),
                                                          onFieldSubmitted:
                                                              (value) {
                                                            phoneNumbercontroller
                                                                .text = value;
                                                          },
                                                          keyboardType:
                                                              TextInputType
                                                                  .phone,
                                                          //validator: validateMobileNumber,
                                                          inputFormatters: [
                                                            FilteringTextInputFormatter
                                                                .allow(RegExp(
                                                                    '[0-9]'))
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: GestureDetector(
                                                onTap: () {
                                                  setAddmoreFlag1(value: false);
                                                  MixPanelAnalyticsManager().sendEvent(
                                                      'Credits_delete_recipient',
                                                      'Credits delete recipient',
                                                      null);
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  child: SvgPicture.asset(
                                                    'assets/images/delete.svg',
                                                    width: 48.0,
                                                    height: 48.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (addmoreFlag1)
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            MixPanelAnalyticsManager()
                                                .sendEvent(
                                                    'Credits_add_recipient',
                                                    'Credits add recipient',
                                                    null);

                                            setAddmoreFlag2();
                                          },
                                          text: 'Add more recipient',
                                          options: FFButtonOptions(
                                            width: 186.5,
                                            height: 36.0,
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: AppColors.primaryBackground,
                                            textStyle: GoogleFonts.getFont(
                                              'Plus Jakarta Sans',
                                              color: const Color(0xFF2861B4),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 13.0,
                                            ),
                                            elevation: 0.0,
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
                                    if (addmoreFlag2)
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(00.0, 15.0, 00.0, 20.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Form(
                                                //  key: formKey,
                                                child: Material(
                                              color: Colors.transparent,
                                              elevation: 0.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                              ),
                                              child: Container(
                                                width: 315,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                  border: Border.all(
                                                    color:
                                                        const Color(0xFFB3B9C4),
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      flex: 5,
                                                      child: BlocConsumer<
                                                              CountryCodeCubit,
                                                              CountryCodeState>(
                                                          builder: (_, state) {
                                                            return state.when(
                                                              initial: () =>
                                                                  CountryCodeDropDown<
                                                                      CountryData>(
                                                                elevation: 0.0,
                                                                hidesUnderline:
                                                                    true,
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderWidth:
                                                                    0.0,
                                                                borderRadius:
                                                                    0.0,
                                                                margin:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        0.0,
                                                                        4.0,
                                                                        0.0,
                                                                        4.0),
                                                                width: 70,
                                                                height: 40,
                                                                hintText:
                                                                    'Country code*',
                                                                searchHintText:
                                                                    'Search for a country',
                                                                isSearchable:
                                                                    true,
                                                                icon:
                                                                    const Icon(
                                                                  Icons
                                                                      .keyboard_arrow_down_sharp,
                                                                  color: Color(
                                                                      0xFF7A8699),
                                                                  size: 20.0,
                                                                ),
                                                                controller:
                                                                    dropDownCountryCodeValueController ??=
                                                                        dropDownCountryCodeValueControllerInitial,
                                                                options: const [],
                                                                optionLabels: const [],
                                                                textStyle:
                                                                    TextStyle(
                                                                  color: const Color(
                                                                      0xFF243757),
                                                                  fontSize:
                                                                      MediaQuery.sizeOf(context).width <=
                                                                              479.0
                                                                          ? 11.0
                                                                          : 13.0,
                                                                ),
                                                                searchHintTextStyle:
                                                                    TextStyle(
                                                                  color: const Color(
                                                                      0xFF243757),
                                                                  fontSize:
                                                                      MediaQuery.sizeOf(context).width <=
                                                                              479.0
                                                                          ? 11.0
                                                                          : 13.0,
                                                                ),
                                                              ),
                                                              loading: () =>
                                                                  CountryCodeDropDown<
                                                                      CountryData>(
                                                                elevation: 0.0,
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderWidth:
                                                                    0.0,
                                                                borderRadius:
                                                                    0.0,
                                                                hidesUnderline:
                                                                    true,
                                                                margin:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        0.0,
                                                                        4.0,
                                                                        0.0,
                                                                        4.0),
                                                                width: 70,
                                                                height: 40,
                                                                hintText:
                                                                    'Country code*',
                                                                searchHintText:
                                                                    'Search for a country',
                                                                isSearchable:
                                                                    true,
                                                                icon:
                                                                    const Icon(
                                                                  Icons
                                                                      .keyboard_arrow_down_sharp,
                                                                  color: Color(
                                                                      0xFF7A8699),
                                                                  size: 20.0,
                                                                ),
                                                                searchHintTextStyle:
                                                                    TextStyle(
                                                                  color: const Color(
                                                                      0xFF243757),
                                                                  fontSize:
                                                                      MediaQuery.sizeOf(context).width <=
                                                                              479.0
                                                                          ? 11.0
                                                                          : 13.0,
                                                                ),
                                                                controller:
                                                                    dropDownCountryCodeValueController ??=
                                                                        dropDownCountryCodeValueControllerInitial,
                                                                options: const [],
                                                                optionLabels: const [],
                                                                textStyle:
                                                                    TextStyle(
                                                                  color: const Color(
                                                                      0xFF243757),
                                                                  fontSize:
                                                                      MediaQuery.sizeOf(context).width <=
                                                                              479.0
                                                                          ? 11.0
                                                                          : 13.0,
                                                                ),
                                                              ),
                                                              success: (CountryCodeEntity
                                                                      entity) =>
                                                                  CountryCodeDropDown<
                                                                      CountryData>(
                                                                elevation: 0.0,
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderWidth:
                                                                    0.0,
                                                                borderRadius:
                                                                    0.0,
                                                                margin:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        0.0,
                                                                        4.0,
                                                                        0.0,
                                                                        4.0),
                                                                width: 70,
                                                                height: 40,
                                                                hidesUnderline:
                                                                    true,
                                                                hintText:
                                                                    'Country code*',
                                                                searchHintText:
                                                                    'Search for a country',
                                                                isSearchable:
                                                                    true,
                                                                icon:
                                                                    const Icon(
                                                                  Icons
                                                                      .keyboard_arrow_down_sharp,
                                                                  color: Color(
                                                                      0xFF7A8699),
                                                                ),

                                                                controller:
                                                                    dropDownCountryCodeValueController ??=
                                                                        dropDownCountryCodeValueControllerInitial,
                                                                options: entity
                                                                        .data ??
                                                                    [],
                                                                searchHintTextStyle:
                                                                    TextStyle(
                                                                  color: const Color(
                                                                      0xFF243757),
                                                                  fontSize:
                                                                      MediaQuery.sizeOf(context).width <=
                                                                              479.0
                                                                          ? 11.0
                                                                          : 13.0,
                                                                ),
                                                                // optionLabels: (entity.data!) as List,
                                                                textStyle:
                                                                    TextStyle(
                                                                  color: const Color(
                                                                      0xFF243757),
                                                                  fontSize:
                                                                      MediaQuery.sizeOf(context).width <=
                                                                              479.0
                                                                          ? 11.0
                                                                          : 13.0,
                                                                ),
                                                                fillColor:
                                                                    Colors
                                                                        .white,
                                                                onChanged:
                                                                    (value) {
                                                                  setState(() {
                                                                    selctedContryCodeValue =
                                                                        value!
                                                                            .phoneCode!;
                                                                  });
                                                                },
                                                              ),
                                                              error: (String
                                                                      error) =>
                                                                  CountryCodeDropDown<
                                                                      CountryData>(
                                                                elevation: 0.0,
                                                                borderColor:
                                                                    const Color(
                                                                        0xFFB3B9C4),
                                                                borderWidth:
                                                                    1.0,
                                                                borderRadius:
                                                                    4.0,
                                                                // fillColor:
                                                                //     const Color(0xFFFFFFFF),
                                                                margin:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        0.0,
                                                                        4.0,
                                                                        10.0,
                                                                        4.0),
                                                                hidesUnderline:
                                                                    true,
                                                                width: 70.w,
                                                                height: 40.0,
                                                                hintText:
                                                                    'Country code*',
                                                                searchHintText:
                                                                    'Search for a country',
                                                                isSearchable:
                                                                    true,
                                                                icon:
                                                                    const FaIcon(
                                                                  FontAwesomeIcons
                                                                      .angleDown,
                                                                  color: Color(
                                                                      0xFFB3B9C4),
                                                                  size: 20.0,
                                                                ),
                                                                controller:
                                                                    dropDownCountryCodeValueController ??=
                                                                        dropDownCountryCodeValueControllerInitial,
                                                                options: const [],
                                                                optionLabels: const [],
                                                                textStyle:
                                                                    TextStyle(
                                                                  color: const Color(
                                                                      0xFF243757),
                                                                  fontSize:
                                                                      MediaQuery.sizeOf(context).width <=
                                                                              479.0
                                                                          ? 11.0
                                                                          : 12.0,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          listener: (context,
                                                              state) {}),
                                                    ),
                                                    Expanded(
                                                      flex: 5,
                                                      child: SizedBox(
                                                        width: 100.0,
                                                        child: TextFormField(
                                                          controller:
                                                              phoneNumbercontroller2,

                                                          obscureText: false,
                                                          decoration:
                                                              const InputDecoration(
                                                            hintText:
                                                                'Enter Mobile No',
                                                            hintStyle:
                                                                TextStyle(
                                                              color: Color(
                                                                  0xFF98A1B0),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              fontSize: 13.0,
                                                            ),
                                                            border: InputBorder
                                                                .none,
                                                            enabledBorder:
                                                                InputBorder
                                                                    .none,
                                                            focusedBorder:
                                                                InputBorder
                                                                    .none,
                                                            errorBorder:
                                                                InputBorder
                                                                    .none,
                                                            focusedErrorBorder:
                                                                InputBorder
                                                                    .none,
                                                            contentPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15.0,
                                                                        15.0,
                                                                        15.0,
                                                                        15.0),
                                                          ),
                                                          style:
                                                              const TextStyle(
                                                            color: AppColors
                                                                .primaryText,
                                                            fontSize: 13.0,
                                                          ),
                                                          onFieldSubmitted:
                                                              (value) {
                                                            phoneNumbercontroller2
                                                                .text = value;
                                                          },
                                                          keyboardType:
                                                              TextInputType
                                                                  .phone,
                                                          //validator: validateMobileNumber,
                                                          inputFormatters: [
                                                            FilteringTextInputFormatter
                                                                .allow(RegExp(
                                                                    '[0-9]'))
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: GestureDetector(
                                                onTap: () async {
                                                  setAddmoreFlag2(value: false);
                                                  MixPanelAnalyticsManager().sendEvent(
                                                      'Credits_delete_recipient',
                                                      'Credits delete recipient',
                                                      null);
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  child: SvgPicture.asset(
                                                    'assets/images/delete.svg',
                                                    width: 48.0,
                                                    height: 48.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    const Divider(),
                                    ScreenUtil().setVerticalSpacing(8),
                                  ],
                                )),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 5.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      MixPanelAnalyticsManager().sendEvent(
                                          'Credits_lb_alert_reset',
                                          'Credits low balance alert reset',
                                          null);

                                      setState(() {
                                        phoneNumbercontroller.clear();
                                        phoneNumbercontroller2.clear();
                                      });
                                    },
                                    text: 'Reset',
                                    options: FFButtonOptions(
                                      width: 181.5,
                                      height: 42.0,
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: AppColors.primaryBackground,
                                      textStyle: GoogleFonts.getFont(
                                        'Plus Jakarta Sans',
                                        color: const Color(0xFF2861B4),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.0,
                                      ),
                                      borderSide: const BorderSide(
                                        color: Color(0xFF2861B4),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(4.0),
                                      hoverElevation: 5.0,
                                    ),
                                    showLoadingIndicator: false,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 5.0, 0.0),
                                  child: BlocListener<LowBalanceAlertSaveCubit,
                                      LowBalanceAlertSaveState>(
                                    listener: (context, state) {
                                      state.whenOrNull(
                                        success: (lowBalanceEntity) {
                                          showAlignedDialog(
                                            context: context,
                                            isGlobal: true,
                                            avoidOverflow: false,
                                            targetAnchor:
                                                const AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                            followerAnchor:
                                                const AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                            builder: (dialogContext) {
                                              return Material(
                                                  color: Colors.transparent,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(15.0,
                                                            15.0, 15.0, 15.0),
                                                    child: Container(
                                                      width: 325.0,
                                                      height: 175.0,
                                                      decoration: BoxDecoration(
                                                        color: AppColors
                                                            .primaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                16.0,
                                                                16.0,
                                                                16.0,
                                                                16.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        10.0),
                                                                child: Text(
                                                                  "Low balance alert successfully activated.",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: GoogleFonts
                                                                      .getFont(
                                                                    'Plus Jakarta Sans',
                                                                    color: AppColors
                                                                        .primaryText,
                                                                    fontSize:
                                                                        14.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      1.00,
                                                                      0.00),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      dialogContext);
                                                                },
                                                                text: 'OK',
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 44.0,
                                                                  padding:
                                                                      const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                                  iconPadding:
                                                                      const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: AppColors
                                                                      .primaryText,
                                                                  textStyle:
                                                                      GoogleFonts
                                                                          .getFont(
                                                                    'Plus Jakarta Sans',
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        17.0,
                                                                  ),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 0.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4.0),
                                                                  hoverElevation:
                                                                      5.0,
                                                                ),
                                                                showLoadingIndicator:
                                                                    false,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ));
                                            },
                                          );

                                          context
                                              .read<LowBalanceCubit>()
                                              .getlowBalance();
                                        },
                                        error: (errorMessage) {
                                          showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                content: const Text(
                                                    'Something went wrong!'),
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
                                        },
                                      );
                                    },
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        if (amountTextEditingController
                                            .text.isNotEmpty) {
                                          bool isValidAmount =
                                              await validAmount(
                                                  amountTextEditingController
                                                      .text);
                                          if (isValidAmount &&
                                              checkMinAmount(
                                                  amountTextEditingController
                                                      .text,
                                                  1.toString())) {
                                            // api calling
                                            context
                                                .read<
                                                    LowBalanceAlertSaveCubit>()
                                                .saveLowBlanaceAlert(
                                                    LowBalanceAlertRequest(
                                                  customerId: LocalStateCache()
                                                      .customerId,
                                                  alertAmount: int.parse(
                                                      amountTextEditingController
                                                          .text),
                                                  alternaletcountryCode1:
                                                      selctedContryCodeValue,
                                                  alternaletcountryCode2:
                                                      selctedContryCodeValue,
                                                  lowBalanceAlertFlag:
                                                      sWitchvalue.value,
                                                  alternatePhoneNo1:
                                                      phoneNumbercontroller
                                                          .text,
                                                  alternatePhoneNo2:
                                                      phoneNumbercontroller2
                                                          .text,
                                                ));
                                          }
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: const Text('Message'),
                                                content: const Text(
                                                    'Please enter amount greater than 1 \$'),
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
                                        MixPanelAnalyticsManager().sendEvent(
                                            'Credits_lb_alert_save',
                                            'Credits low balance alert save',
                                            null);
                                      },
                                      text: 'Save',
                                      options: FFButtonOptions(
                                        width: 181.5,
                                        height: 42.0,
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                        iconPadding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                        color: const Color(0xFF2861B4),
                                        textStyle: GoogleFonts.getFont(
                                          'Plus Jakarta Sans',
                                          color: AppColors.whiteTextColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14.0,
                                        ),
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        hoverElevation: 5.0,
                                      ),
                                      showLoadingIndicator: false,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  })
              ],
            );
          },
        ));
  }
}
