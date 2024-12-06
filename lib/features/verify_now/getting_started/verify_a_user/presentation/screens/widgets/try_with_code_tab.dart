// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:messagecentral/core/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messagecentral/core/constants/image_path.dart';
import 'package:messagecentral/core/utils/extention_util.dart';
import 'package:messagecentral/core/utils/flutter_flow_theme.dart';
import 'package:messagecentral/core/utils/local_state_cache.dart';
import 'package:messagecentral/core/utils/mix_pannel.dart';
import 'package:messagecentral/core/utils/responsive.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/presentation/screens/widgets/widgets_all_tabs.dart/c_code_widget.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/presentation/screens/widgets/widgets_all_tabs.dart/curl_code_widget.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/presentation/screens/widgets/widgets_all_tabs.dart/java_code_widget.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/presentation/screens/widgets/widgets_all_tabs.dart/node_code_widget.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/presentation/screens/widgets/widgets_all_tabs.dart/php_code_widget.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/presentation/screens/widgets/widgets_all_tabs.dart/python_code_widget.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/presentation/screens/widgets/widgets_all_tabs.dart/ruby_code_widget.dart';

class TryWithCodeTabVerify extends StatefulWidget {
  const TryWithCodeTabVerify({super.key});

  @override
  State<TryWithCodeTabVerify> createState() => _TryWithCodeTabVerifyState();
}

class _TryWithCodeTabVerifyState extends State<TryWithCodeTabVerify>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  bool passwordVisibility = false;
  bool snippet = true;
  LocalStateCache localStateCache = LocalStateCache();

  TextEditingController customerIdController = TextEditingController();
  @override
  void initState() {
    super.initState();
    setCustomerId();
    _tabController = TabController(length: 7, vsync: this);
    MixPanelAnalyticsManager().sendEvent(
        'verify_user_try_with_code', 'verify user try with code', null);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void setCustomerId() {
    setState(() {
      customerIdController.text = localStateCache.customerId;
    });
  }

  bool iSobscureTextCustomerId = true;

  void obscureTextCustomerId() {
    setState(() {
      iSobscureTextCustomerId = !iSobscureTextCustomerId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
              flex: 2,
              child: ListView(
                padding: const EdgeInsetsDirectional.fromSTEB(
                    55.0, 20.0, 55.0, 20.0),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(4.0),
                          border: Border.all(
                            color: const Color(0xFFDFE2E6),
                            width: 1.0,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Customer ID',
                                            style: GoogleFonts.getFont(
                                              'Plus Jakarta Sans',
                                              color: AppColors.primaryText,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          const Icon(
                                            Icons.info_outline,
                                            color: Color(0xFF7A8699),
                                            size: 20,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      TextFormField(
                                        initialValue:
                                            LocalStateCache().customerId,
                                        readOnly: true,
                                        obscureText: iSobscureTextCustomerId,
                                        decoration: InputDecoration(
                                          fillColor: const Color(0xFFF5F6F7),
                                          filled: false,
                                          hoverColor: const Color(0xFFF5F6F7),
                                          focusColor: const Color(0xFFF5F6F7),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              borderSide: const BorderSide(
                                                color: Color(0xFFB3B9C4),
                                              )),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              borderSide: const BorderSide(
                                                color: Color(0xFFB3B9C4),
                                              )),
                                          errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              borderSide: const BorderSide(
                                                color: Color(0xFFB3B9C4),
                                              )),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  borderSide: const BorderSide(
                                                    color: Color(0xFFB3B9C4),
                                                  )),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              borderSide: const BorderSide(
                                                color: Color(0xFFB3B9C4),
                                              )),
                                          suffixIcon: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 12),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                InkWell(
                                                    onTap: () {
                                                      obscureTextCustomerId();
                                                    },
                                                    child: Icon(
                                                      iSobscureTextCustomerId
                                                          ? Icons
                                                              .visibility_off_outlined
                                                          : Icons
                                                              .visibility_outlined,
                                                      color: const Color(
                                                          0xFF7A8699),
                                                      size: 20.0,
                                                    )),
                                                const SizedBox(
                                                    width:
                                                        8), // Add some space between icons
                                                InkWell(
                                                    onTap: () async {
                                                      await Clipboard.setData(
                                                          ClipboardData(
                                                              text: LocalStateCache()
                                                                  .customerId));
                                                      Fluttertoast.showToast(
                                                          msg:
                                                              "Customer ID Successfully Copied.",
                                                          toastLength: Toast
                                                              .LENGTH_SHORT,
                                                          webBgColor: "#003153",
                                                          textColor:
                                                              Colors.white,
                                                          timeInSecForIosWeb: 5,
                                                          webPosition:
                                                              'center');
                                                    },
                                                    child: const Icon(
                                                      Icons.copy_outlined,
                                                      color: Color(0xFF7A8699),
                                                      size: 16.0,
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ),
                                        style: const TextStyle(
                                          color: Color(0xFF42526D),
                                          fontSize: 14.0,
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Auth Token',
                                            style: GoogleFonts.getFont(
                                              'Plus Jakarta Sans',
                                              color: AppColors.primaryText,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      TextFormField(
                                        initialValue:
                                            LocalStateCache().authToken,
                                        readOnly: true,
                                        decoration: InputDecoration(
                                          fillColor: const Color(0xFFF5F6F7),
                                          filled: false,
                                          hoverColor: const Color(0xFFF5F6F7),
                                          focusColor: const Color(0xFFF5F6F7),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              borderSide: const BorderSide(
                                                color: Color(0xFFB3B9C4),
                                              )),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              borderSide: const BorderSide(
                                                color: Color(0xFFB3B9C4),
                                              )),
                                          errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              borderSide: const BorderSide(
                                                color: Color(0xFFB3B9C4),
                                              )),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  borderSide: const BorderSide(
                                                    color: Color(0xFFB3B9C4),
                                                  )),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              borderSide: const BorderSide(
                                                color: Color(0xFFB3B9C4),
                                              )),
                                          suffixIcon: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 12, left: 12),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                InkWell(
                                                    onTap: () async {
                                                      await Clipboard.setData(
                                                          ClipboardData(
                                                              text: LocalStateCache()
                                                                  .authToken));
                                                      Fluttertoast.showToast(
                                                          msg:
                                                              "Auth Token Successfully Copied.",
                                                          toastLength: Toast
                                                              .LENGTH_SHORT,
                                                          webBgColor: "#003153",
                                                          textColor:
                                                              Colors.white,
                                                          timeInSecForIosWeb: 5,
                                                          webPosition:
                                                              'center');
                                                    },
                                                    child: const Icon(
                                                      Icons.copy_outlined,
                                                      color: Color(0xFF7A8699),
                                                      size: 16.0,
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ),
                                        style: const TextStyle(
                                          color: Color(0xFF42526D),
                                          fontSize: 14.0,
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(
                              color: const Color(0xFFDFE2E6),
                              width: 1.0,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                color: Colors.white,
                                child: TabBar(
                                  controller: _tabController,
                                  labelColor: const Color(0xFF243757),
                                  unselectedLabelColor: const Color(0xFF4E596A),
                                  labelStyle: GoogleFonts.getFont(
                                    'Plus Jakarta Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  unselectedLabelStyle: GoogleFonts.getFont(
                                    'Plus Jakarta Sans',
                                    color: const Color(0xFF42526D),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  isScrollable: true,
                                  indicatorWeight: 3.0,
                                  indicatorColor: const Color(0xFF1B4078),
                                  tabs: const [
                                    Tab(text: 'Curl'),
                                    Tab(text: 'Java'),
                                    Tab(text: 'Node'),
                                    Tab(text: 'PHP'),
                                    Tab(text: 'Python'),
                                    Tab(text: 'Ruby'),
                                    Tab(text: 'C#'),
                                  ],
                                  labelPadding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  indicatorPadding:
                                      const EdgeInsets.only(left: 10.0),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  border: Border.all(
                                    color: const Color(0xFFDFE2E6),
                                    width: .5,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height + 500,
                                child: TabBarView(
                                  controller: _tabController,
                                  children: [
                                    CurlCodeWidget(),
                                    JavaCodeWidget(),
                                    NodeCodeWidget(),
                                    PhpCodeWidget(),
                                    PythonCodeWidget(),
                                    RubyCodeWidget(),
                                    CCodeWidget(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (Responsive.isMobile(context))
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      color: const Color(0xFFDFE2E6),
                      child: Container(
                        alignment: Alignment.topLeft,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: const Color(0xFFDFE2E6)),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x0D000000),
                              ),
                              BoxShadow(
                                color: Color(0x0D000000),
                              )
                            ],
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(
                                    left: 16, right: 16, top: 16),
                                child: Text(
                                  "Resources",
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Color(0xFF243757),
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(16),
                                margin: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    color: const Color(0xFFFFFFFF),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: const Color(0xFFDFE2E6))),
                                child: InkWell(
                                  onTap: () async {
                                    await launchURL(LocalStateCache()
                                                .countryCode ==
                                            "91"
                                        ? 'https://www.youtube.com/watch?v=bRnaH7fD374'
                                        : "https://www.youtube.com/watch?v=Z_vhlcnQ8VA");
                                    MixPanelAnalyticsManager().sendEvent(
                                        'Resources_Integration_Video',
                                        'Resources Integration Video',
                                        null);
                                  },
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              ImagePath.videoRectangle),
                                          const SizedBox(
                                            width: 6,
                                          ),
                                          const Flexible(
                                            child: Text(
                                              "Integration Video",
                                              softWrap: true,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Color(0xFF243757),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          SvgPicture.asset(
                                            ImagePath.arrowRight,
                                            height: 15,
                                            width: 20,
                                            color: const Color(0xFF42526D),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Stack(
                                            children: [
                                              Image.asset(
                                                  ImagePath.videoGuidesmall),
                                              const Positioned.fill(
                                                  child: Icon(
                                                Icons.play_arrow_rounded,
                                                color: Colors.white,
                                                size: 60,
                                              ))
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Flexible(
                                              child: Text(
                                            "🔐 Learn how to authenticate users with SMS OTP APIs using Message Central in NodeJS, Python, Java, PHP, Ruby, and C#!",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFF42526D)),
                                          ))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(16),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                decoration: BoxDecoration(
                                    color: const Color(0xFFFFFFFF),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: const Color(0xFFDFE2E6))),
                                child: InkWell(
                                  onTap: () async {
                                    await launchApiDocUrl();
                                    MixPanelAnalyticsManager().sendEvent(
                                        'Resources_API_Documentation',
                                        'Resources API Documentation',
                                        null);
                                  },
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(ImagePath.api),
                                          const SizedBox(
                                            width: 6,
                                          ),
                                          const Flexible(
                                            child: Text(
                                              "API Documentation",
                                              softWrap: true,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Color(0xFF243757),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          SvgPicture.asset(
                                            ImagePath.arrowRight,
                                            height: 15,
                                            width: 20,
                                            color: const Color(0xFF42526D),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        "Authenticate users with OTP SMS APIs in multiple languages including NodeJS, Python, Java, PHP, Ruby and C#.",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFF42526D)),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Container(
                                padding: const EdgeInsets.all(16),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                decoration: BoxDecoration(
                                    color: const Color(0xFFFFFFFF),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: const Color(0xFFDFE2E6))),
                                child: InkWell(
                                  onTap: () async {
                                    await launchURL(
                                        'https://cpaas-bucket.s3.ap-south-1.amazonaws.com/Verify_Now_User_Guide.pdf');

                                    MixPanelAnalyticsManager().sendEvent(
                                        'Resources_Verify_Now_User_Guide',
                                        'Resources Verify Now User Guide',
                                        null);
                                  },
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(ImagePath.bookopen),
                                          const SizedBox(
                                            width: 6,
                                          ),
                                          const Text(
                                            "User Guide",
                                            softWrap: true,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Color(0xFF243757),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          SvgPicture.asset(
                                            ImagePath.arrowRight,
                                            height: 15,
                                            width: 20,
                                            color: const Color(0xFF42526D),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        "FAQs solutions to common issues, providing instructions to resolve all your queries.",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFF42526D)),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              if (LocalStateCache().countryCode == "91")
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  margin: const EdgeInsets.only(
                                      left: 8, right: 8, bottom: 8),
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFFFFFFF),
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: const Color(0xFFDFE2E6))),
                                  child: InkWell(
                                    onTap: () async {
                                      MixPanelAnalyticsManager().sendEvent(
                                          'Resources_Verify_Now_WhatsApp_OTP',
                                          'Resources Verify Now WhatsApp OTP',
                                          null);
                                      context.goNamed('whatsApp');
                                    },
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(
                                              FontAwesomeIcons.sms,
                                              color: AppColors.blue80,
                                            ),
                                            const SizedBox(
                                              width: 6,
                                            ),
                                            const Text(
                                              "Explore WhatsApp OTP",
                                              softWrap: true,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Color(0xFF243757),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            SvgPicture.asset(
                                              ImagePath.arrowRight,
                                              height: 15,
                                              width: 20,
                                              color: const Color(0xFF42526D),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text(
                                          "Authenticate users with our WhatsApp OTP without having any Facebook Business Manager account.",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xFF42526D)),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                            ]),
                      ),
                    )
                ],
              )),
          if (Responsive.isDesktop(context))
            Expanded(
              flex: 1,
              child: Container(
                height: double.infinity,
                color: const Color(0xFFDFE2E6),
                padding: const EdgeInsets.all(30),
                child: Container(
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: const Color(0xFFDFE2E6)),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x0D000000),
                        ),
                        BoxShadow(
                          color: Color(0x0D000000),
                        )
                      ],
                      borderRadius: BorderRadius.circular(8)),
                  child: ListView(children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                      child: Text(
                        "Resources",
                        style: TextStyle(
                            fontSize: 17,
                            color: Color(0xFF243757),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: const Color(0xFFDFE2E6))),
                      child: InkWell(
                        onTap: () async {
                          await launchURL(LocalStateCache().countryCode == "91"
                              ? 'https://www.youtube.com/watch?v=bRnaH7fD374'
                              : "https://www.youtube.com/watch?v=Z_vhlcnQ8VA");
                          MixPanelAnalyticsManager().sendEvent(
                              'Resources_Integration_Video',
                              'Resources Integration Video',
                              null);
                        },
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(ImagePath.videoRectangle),
                                const SizedBox(
                                  width: 6,
                                ),
                                const Flexible(
                                  child: Text(
                                    "Integration Video",
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Color(0xFF243757),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SvgPicture.asset(
                                  ImagePath.arrowRight,
                                  height: 15,
                                  width: 20,
                                  color: const Color(0xFF42526D),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Image.asset(ImagePath.videoGuidesmall),
                                    const Positioned.fill(
                                        child: Icon(
                                      Icons.play_arrow_rounded,
                                      color: Colors.white,
                                      size: 60,
                                    ))
                                  ],
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Flexible(
                                    child: Text(
                                  "🔐 Learn how to authenticate users with SMS OTP APIs using Message Central in NodeJS, Python, Java & PHP",
                                  style: TextStyle(
                                      fontSize: 12, color: Color(0xFF42526D)),
                                ))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: const Color(0xFFDFE2E6))),
                      child: InkWell(
                        onTap: () async {
                          await launchApiDocUrl();
                          MixPanelAnalyticsManager().sendEvent(
                              'Resources_API_Documentation',
                              'Resources API Documentation',
                              null);
                        },
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(ImagePath.api),
                                const SizedBox(
                                  width: 6,
                                ),
                                const Text(
                                  "API Documentation",
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Color(0xFF243757),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SvgPicture.asset(
                                  ImagePath.arrowRight,
                                  height: 15,
                                  width: 20,
                                  color: const Color(0xFF42526D),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Authenticate users with OTP SMS APIs in multiple languages including NodeJS, Python, Java, PHP, Ruby and C#.",
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xFF42526D)),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: const Color(0xFFDFE2E6))),
                      child: InkWell(
                        onTap: () async {
                          await launchURL(
                              'https://cpaas-bucket.s3.ap-south-1.amazonaws.com/Verify_Now_User_Guide.pdf');
                          MixPanelAnalyticsManager().sendEvent(
                              'Resources_Verify_Now_User_Guide',
                              'Resources Verify Now User Guide',
                              null);
                        },
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(ImagePath.bookopen),
                                const SizedBox(
                                  width: 6,
                                ),
                                const Text(
                                  "User Guide",
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Color(0xFF243757),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SvgPicture.asset(
                                  ImagePath.arrowRight,
                                  height: 15,
                                  width: 20,
                                  color: const Color(0xFF42526D),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "FAQs solutions to common issues, providing instructions to resolve all your queries.",
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xFF42526D)),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    if (LocalStateCache().countryCode == "91")
                      Container(
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.only(
                            left: 16, right: 16, bottom: 16),
                        decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: const Color(0xFFDFE2E6))),
                        child: InkWell(
                          onTap: () async {
                            MixPanelAnalyticsManager().sendEvent(
                                'Resources_Verify_now_whatsApp_OTP',
                                'Resources Verify Now whatsApp OTP',
                                null);
                            context.goNamed('whatsApp');
                          },
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    FontAwesomeIcons.whatsapp,
                                    color: AppColors.blue80,
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  const Text(
                                    "Explore WhatsApp OTP",
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Color(0xFF243757),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  SvgPicture.asset(
                                    ImagePath.arrowRight,
                                    height: 15,
                                    width: 20,
                                    color: const Color(0xFF42526D),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Authenticate users with our WhatsApp OTP without having any Facebook Business Manager account.",
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xFF42526D)),
                              )
                            ],
                          ),
                        ),
                      ),
                  ]),
                ),
              ),
            )
        ],
      ),
    );
  }
}
