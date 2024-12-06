// ignore_for_file: use_build_context_synchronously

import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:dio/dio.dart';

import 'package:flutter/services.dart';
import 'package:messagecentral/core/utils/responsive.dart';
import 'package:messagecentral/core/utils/responsive_layout.dart';
import 'package:messagecentral/core/constants/api_end_points.dart';
import 'package:messagecentral/core/constants/app_colors.dart';
import 'package:messagecentral/core/constants/image_path.dart';
import 'package:messagecentral/core/global_widgets/custom_button.dart';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messagecentral/core/utils/app_environment.dart';
import 'package:messagecentral/core/utils/extention_util.dart';
import 'package:messagecentral/core/utils/local_state_cache.dart';
import 'package:messagecentral/core/utils/mix_pannel.dart';

// import '../../../../core/global_widgets/custom_button.dart';
// import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';
// import 'package:webview_flutter_web/webview_flutter_web.dart';
// import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';

class AddCreditWidget extends StatefulWidget {
  const AddCreditWidget(
      {super.key, this.headerTitle, this.insufficentBalanceContent});
  final String? headerTitle;
  final String? insufficentBalanceContent;
  @override
  // ignore: library_private_types_in_public_api
  _AddCreditWidgetState createState() => _AddCreditWidgetState();
}

class _AddCreditWidgetState extends State<AddCreditWidget> {
  TextEditingController amountTextFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // final PlatformWebViewController _controller = PlatformWebViewController(
  //   const PlatformWebViewControllerCreationParams(),
  // )..loadRequest(
  //     LoadRequestParams(
  //       uri: Uri.parse('https://flutter.dev'),
  //     ),
  //   );
  final formKey = GlobalKey<FormState>();
  PaymentType? selectedpayment = PaymentType.stripe;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.00, 0.00),
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
                width: MediaQuery.sizeOf(context).width >= 800
                    ? (MediaQuery.sizeOf(context).width * 0.3)
                    : (MediaQuery.sizeOf(context).width * 0.95),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Form(
                  // key: _model.formKey,
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 16.0, 0.0, 16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.headerTitle ?? 'Top up credits',
                                style: GoogleFonts.getFont(
                                  'Plus Jakarta Sans',
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
                        const Divider(),
                        // if (widget.insufficentBalanceContent == null)
                        //   Padding(
                        //     padding: const EdgeInsetsDirectional.fromSTEB(
                        //         16.0, 16.0, 0.0, 16.0),
                        //     child: Row(
                        //       mainAxisSize: MainAxisSize.max,
                        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //       children: [
                        //         ClipRRect(
                        //           borderRadius: BorderRadius.circular(0.0),
                        //           child: SvgPicture.asset(
                        //             'assets/images/topUpImage.svg',
                        //             width: 138.0,
                        //             height: 128.0,
                        //             fit: BoxFit.cover,
                        //           ),
                        //         ),
                        //         Expanded(
                        //           child: Padding(
                        //             padding:
                        //                 const EdgeInsetsDirectional.fromSTEB(
                        //                     16.0, 0.0, 16.0, 0.0),
                        //             child: Text(
                        //               'Top up your credit balance with conveniece.',
                        //               textAlign: TextAlign.start,
                        //               style: GoogleFonts.getFont(
                        //                 'Plus Jakarta Sans',
                        //                 color: AppColors.primaryText,
                        //                 fontWeight: FontWeight.normal,
                        //                 fontSize: 14.0,
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),

                        if (widget.insufficentBalanceContent != null)
                          Container(
                            margin: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 10.0, 16.0, 0.0),
                            width: MediaQuery.of(context).size.width * 1.0,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFCD3D0),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Icon(
                                    FontAwesomeIcons.solidCircleXmark,
                                    color: Colors.red,
                                    size: 24.0,
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: const AlignmentDirectional(
                                          -1.00, 0.00),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                          widget.insufficentBalanceContent ??
                                              "",
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: Color(0xFFC13A31),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 11.7,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 0.0),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.secondaryBackground,
                                borderRadius: BorderRadius.circular(4.0),
                                border: Border.all(
                                  color: const Color(0xFFB3B9C4),
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment: const AlignmentDirectional(
                                          0.00, 0.00),
                                      child: Text(
                                        'Select an amount',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.getFont(
                                          'Plus Jakarta Sans',
                                          color: AppColors.primaryText,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                    ),

                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 16.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      0.0, 0.0, 8.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  setState(() {
                                                    amountTextFieldController
                                                        .text = '10';
                                                  });
                                                },
                                                text: '\$10',
                                                options: FFButtonOptions(
                                                  height: 36.0,
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          8.0, 0.0, 8.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  color: AppColors
                                                      .primaryBackground,
                                                  textStyle:
                                                      GoogleFonts.getFont(
                                                    'Plus Jakarta Sans',
                                                    color:
                                                        const Color(0xFF11984A),
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14.0,
                                                  ),
                                                  elevation: 0.0,
                                                  borderSide: const BorderSide(
                                                    color: Color(0xFF2861B4),
                                                    width: 0.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                ),
                                                showLoadingIndicator: false,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      4.0, 0.0, 4.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  setState(() {
                                                    amountTextFieldController
                                                        .text = '50';
                                                  });
                                                },
                                                text: '\$50',
                                                options: FFButtonOptions(
                                                  height: 36.0,
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          8.0, 0.0, 8.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  color: AppColors
                                                      .primaryBackground,
                                                  textStyle:
                                                      GoogleFonts.getFont(
                                                    'Plus Jakarta Sans',
                                                    color:
                                                        const Color(0xFF11984A),
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14.0,
                                                  ),
                                                  elevation: 0.0,
                                                  borderSide: const BorderSide(
                                                    color: Color(0xFF2861B4),
                                                    width: 0.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                ),
                                                showLoadingIndicator: false,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      8.0, 0.0, 0.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  setState(() {
                                                    amountTextFieldController
                                                        .text = '100';
                                                  });
                                                },
                                                text: '\$100',
                                                options: FFButtonOptions(
                                                  height: 36.0,
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          8.0, 0.0, 8.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  color: AppColors
                                                      .primaryBackground,
                                                  textStyle:
                                                      GoogleFonts.getFont(
                                                    'Plus Jakarta Sans',
                                                    color:
                                                        const Color(0xFF11984A),
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14.0,
                                                  ),
                                                  elevation: 0.0,
                                                  borderSide: const BorderSide(
                                                    color: Color(0xFF2861B4),
                                                    width: 0.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                ),
                                                showLoadingIndicator: false,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 16.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      0.0, 0.0, 8.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  setState(() {
                                                    amountTextFieldController
                                                        .text = '200';
                                                  });
                                                },
                                                text: '\$200',
                                                options: FFButtonOptions(
                                                  height: 36.0,
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          8.0, 0.0, 8.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  color: AppColors
                                                      .primaryBackground,
                                                  textStyle:
                                                      GoogleFonts.getFont(
                                                    'Plus Jakarta Sans',
                                                    color:
                                                        const Color(0xFF11984A),
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14.0,
                                                  ),
                                                  elevation: 0.0,
                                                  borderSide: const BorderSide(
                                                    color: Color(0xFF2861B4),
                                                    width: 0.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                ),
                                                showLoadingIndicator: false,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      4.0, 0.0, 4.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  setState(() {
                                                    amountTextFieldController
                                                        .text = '500';
                                                  });
                                                },
                                                text: '\$500',
                                                options: FFButtonOptions(
                                                  height: 36.0,
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          8.0, 0.0, 8.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  color: AppColors
                                                      .primaryBackground,
                                                  textStyle:
                                                      GoogleFonts.getFont(
                                                    'Plus Jakarta Sans',
                                                    color:
                                                        const Color(0xFF11984A),
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14.0,
                                                  ),
                                                  elevation: 0.0,
                                                  borderSide: const BorderSide(
                                                    color: Color(0xFF2861B4),
                                                    width: 0.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                ),
                                                showLoadingIndicator: false,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      8.0, 0.0, 0.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  setState(() {
                                                    amountTextFieldController
                                                        .text = '1000';
                                                  });
                                                },
                                                text: '\$1000',
                                                options: FFButtonOptions(
                                                  height: 36.0,
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          8.0, 0.0, 8.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  color: AppColors
                                                      .primaryBackground,
                                                  textStyle:
                                                      GoogleFonts.getFont(
                                                    'Plus Jakarta Sans',
                                                    color:
                                                        const Color(0xFF11984A),
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14.0,
                                                  ),
                                                  elevation: 0.0,
                                                  borderSide: const BorderSide(
                                                    color: Color(0xFF2861B4),
                                                    width: 0.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                ),
                                                showLoadingIndicator: false,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 16.0, 0.0, 0.0),
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 0.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        child: Container(
                                          height: 48.0,
                                          decoration: BoxDecoration(
                                            color: AppColors.primaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                            border: Border.all(
                                              color: const Color(0xFFB3B9C4),
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(20.0, 0.0, 20.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  '\$',
                                                  style: GoogleFonts.getFont(
                                                    'Plus Jakarta Sans',
                                                    color:
                                                        const Color(0xFF7A8699),
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 14.0,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: SizedBox(
                                                    width: 100.0,
                                                    child: TextFormField(
                                                      controller:
                                                          amountTextFieldController,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText:
                                                            'Enter Amount',
                                                        hintStyle:
                                                            GoogleFonts.getFont(
                                                          'Plus Jakarta Sans',
                                                          color: const Color(
                                                              0xFF7A8699),
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontSize: 14.0,
                                                        ),
                                                        enabledBorder:
                                                            InputBorder.none,
                                                        focusedBorder:
                                                            InputBorder.none,
                                                        errorBorder:
                                                            InputBorder.none,
                                                        focusedErrorBorder:
                                                            InputBorder.none,
                                                        contentPadding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                15.0,
                                                                15.0,
                                                                15.0,
                                                                15.0),
                                                      ),
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Plus Jakarta Sans',
                                                        color: AppColors
                                                            .primaryText,
                                                        fontSize: 14.0,
                                                      ),
                                                      keyboardType:
                                                          TextInputType.number,

                                                      // validator: _model
                                                      //     .amountTextFieldControllerValidator
                                                      //     .asValidator(context),
                                                      inputFormatters: [
                                                        FilteringTextInputFormatter
                                                            .allow(
                                                                RegExp('[0-9]'))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    // Padding(
                                    //   padding:
                                    //       const EdgeInsetsDirectional.fromSTEB(
                                    //           0.0, 5.0, 0.0, 0.0),
                                    //   child: Row(
                                    //     mainAxisSize: MainAxisSize.max,
                                    //     children: [
                                    //       const FaIcon(
                                    //         FontAwesomeIcons.circleInfo,
                                    //         color: Color(0xFF7A8699),
                                    //         size: 20.0,
                                    //       ),
                                    //       Align(
                                    //         alignment:
                                    //             const AlignmentDirectional(
                                    //                 -1.00, 0.00),
                                    //         child: Padding(
                                    //           padding:
                                    //               const EdgeInsetsDirectional
                                    //                   .fromSTEB(
                                    //                   8.0, 0.0, 0.0, 0.0),
                                    //           child: Text(
                                    //             'Minimum amount is \$ 1',
                                    //             textAlign: TextAlign.center,
                                    //             style: GoogleFonts.getFont(
                                    //               'Plus Jakarta Sans',
                                    //               color:
                                    //                   const Color(0xFF42526D),
                                    //               fontWeight: FontWeight.normal,
                                    //               fontSize: 11.0,
                                    //             ),
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ],
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        if (LocalStateCache().countryCode != "91")
                          const Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: Text(
                              "Pay using",
                              style: TextStyle(
                                  color: Color(0xFF42526D),
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        const SizedBox(
                          height: 5,
                        ),

                        Visibility(
                          visible: LocalStateCache().countryCode != "91",
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: SizedBox(
                              width: 400,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RadioButttonPayment(
                                    onChanged: (p0) {
                                      setState(() {
                                        selectedpayment = p0;
                                      });
                                    },
                                    value: PaymentType.stripe,
                                    selectedpaymentType: selectedpayment!,
                                    title: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Image.asset(
                                        ImagePath.stripe,
                                      ),
                                    ),
                                  ),
                                  RadioButttonPayment(
                                    onChanged: (p0) {
                                      setState(() {
                                        selectedpayment = p0;
                                      });
                                    },
                                    value: PaymentType.payPal,
                                    selectedpaymentType: selectedpayment!,
                                    title: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Image.asset(ImagePath.paypal)),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),

                        Builder(
                          builder: (context) => Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 20.0, 16.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                MixPanelAnalyticsManager().sendEvent(
                                    "Credits_checkout_pay",
                                    "Credits_checkout_pay",
                                    null);
                                if (amountTextFieldController.text.isNotEmpty) {
                                  bool isValidAmount = await validAmount(
                                      amountTextFieldController.text);
                                  if (isValidAmount &&
                                      checkMinAmount(
                                          amountTextFieldController.text,
                                          1.toString())) {
                                    // api calling
                                    if (selectedpayment == PaymentType.stripe) {
                                      final Response response = await Dio().get(
                                          FlavorConfig
                                                  .instance!.values!.baseUrl! +
                                              ApiEndPoints.stripPayment,
                                          options: Options(headers: {
                                            "Content-Type": "application/json",
                                            'authToken':
                                                LocalStateCache().authToken,
                                          }),
                                          queryParameters: {
                                            'amount':
                                                amountTextFieldController.text,
                                            'currency': "USD",
                                            'customerId':
                                                LocalStateCache().customerId,
                                          });

                                      if (response.data['responseCode'] ==
                                              200 &&
                                          response.data['message'] ==
                                              "SUCCESS") {
                                        loadUrl(response.data['data']);
                                      } else if (response.data['message'] !=
                                          "SUCCESS") {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: const Text('Message'),
                                              content:
                                                  const Text('No data found!'),
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
                                    } else if (selectedpayment ==
                                        PaymentType.payPal) {
                                      final Response response = await Dio().get(
                                          FlavorConfig
                                                  .instance!.values!.baseUrl! +
                                              ApiEndPoints.stripPayment,
                                          options: Options(headers: {
                                            "Content-Type": "application/json",
                                            'authToken':
                                                LocalStateCache().authToken,
                                          }),
                                          queryParameters: {
                                            'amount':
                                                amountTextFieldController.text,
                                            'currency': "USD",
                                            'customerId':
                                                LocalStateCache().customerId,
                                            "gateway": "PAYPAL"
                                          });

                                      if (response.data['responseCode'] ==
                                              200 &&
                                          response.data['message'] ==
                                              "SUCCESS") {
                                        loadUrl(response.data['data']);
                                      } else if (response.data['message'] !=
                                          "SUCCESS") {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: const Text('Message'),
                                              content:
                                                  const Text('No data found!'),
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
                                    }
                                  }
                                } else {
                                  await showAlignedDialog(
                                    context: context,
                                    isGlobal: true,
                                    avoidOverflow: false,
                                    targetAnchor: const AlignmentDirectional(
                                            0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    followerAnchor: const AlignmentDirectional(
                                            0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    builder: (dialogContext) {
                                      return Material(
                                          color: Colors.transparent,
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(
                                                15.0, 15.0, 15.0, 15.0),
                                            child: Container(
                                              width: 325.0,
                                              height: 175.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    AppColors.primaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        16.0, 16.0, 16.0, 16.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(0.0,
                                                                0.0, 0.0, 10.0),
                                                        child: Text(
                                                          "Please enter valid amount",
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: GoogleFonts
                                                              .getFont(
                                                            'Plus Jakarta Sans',
                                                            color: AppColors
                                                                .blue80,
                                                            fontSize: 14.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              1.00, 0.00),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        text: "OK",
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
                                                              .primaryTextColor,
                                                          textStyle: GoogleFonts
                                                              .getFont(
                                                            'Plus Jakarta Sans',
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 17.0,
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
                                                          hoverElevation: 5.0,
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
                                  ).then((value) => setState(() {}));
                                }
                              },
                              text: 'Check Out & Pay',
                              icon: const Icon(
                                Icons.shopping_cart_outlined,
                                size: 24.0,
                              ),
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 44.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding:
                                    const EdgeInsetsDirectional.fromSTEB(
                                        5.0, 5.0, 5.0, 5.0),
                                color: const Color(0xff11984A),
                                textStyle: const TextStyle(
                                  color: AppColors.whiteTextColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.0,
                                ),
                                elevation: 0.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 0.0,
                                ),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum PaymentType { stripe, payPal }

class RadioButttonPayment extends StatelessWidget {
  const RadioButttonPayment(
      {super.key,
      required this.title,
      required this.selectedpaymentType,
      required this.value,
      required this.onChanged});

  final PaymentType value;
  final PaymentType selectedpaymentType;
  final Widget? title;
  final Function(PaymentType?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: RadioListTile<PaymentType>(
            dense: true,
            activeColor: const Color(0xff11984A),
            tileColor: const Color.fromARGB(255, 144, 212, 146),
            selectedTileColor: Colors.red,
            visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: const BorderSide(color: Colors.blue, width: 2)),
            value: value,
            groupValue: selectedpaymentType,
            title: title,
            onChanged: onChanged));
  }
}
