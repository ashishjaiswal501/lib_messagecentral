import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messagecentral/core/constants/app_colors.dart';
import 'package:messagecentral/core/utils/extention_util.dart';
import 'package:messagecentral/core/utils/firebase_analytics_functions.dart';
import 'package:messagecentral/core/utils/flutter_flow_theme.dart';
import 'package:messagecentral/core/utils/mix_pannel.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/presentation/screens/widgets/try_with_code_tab.dart';
import 'package:messagecentral/features/verify_now/getting_started/send_a_sms/presentation/screens/widgets/try_with_ui_tab.dart';

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

String link = 'https://www.messagecentral.com/product/verify-now/api';

String jsonString = '''
{
  "promotion_messages": [
    {
      "sr_no": 1,
      "template_data": "Welcome to Message Central. We are delighted to have you here! - Powered by U2opia",
      "description": "Welcome to Message Central. We are delighted to have you here! - Powered by U2opia"
    },{
      "sr_no": 2,
      "template_data": "For testing purposes, you can use this template to test our services. - Powered by U2opia",
      "description": "For testing purposes, you can use this template to test our services. - Powered by U2opia"
    },{
      "sr_no": 3,
      "template_data": "With Message Central, you can start sending OTPs immediately and save weeks of setup. Use this template to send a message. - Powered by U2opia",
      "description": "With Message Central, you can start sending OTPs immediately and save weeks of setup. Use this template to send a message. - Powered by U2opia"
    },{
      "sr_no": 4,
      "template_data": "Sending messages with Message Central is quick & easy. Integrate our API's & you're good to go. OTP SMS API - U2opia",
      "description": "Sending messages with Message Central is quick & easy. Integrate our API's & you're good to go. $link  - U2opia"
    },{
      "sr_no": 5,
      "template_data": "Message Central stands for anti-fraud and security in SMS messaging. You can use this template to test our service. - Powered by U2opia",
      "description": "Message Central stands for anti-fraud and security in SMS messaging. You can use this template to test our service. - Powered by U2opia"
    },{
      "sr_no": 6,
      "template_data": "Thank you for signing up with Message Central. You can check our API doc here for integration details: OTP SMS API - Powered by U2opia",
      "description": "Thank you for signing up with Message Central. You can check our API doc here for integration details: $link  - Powered by U2opia"
    }

  ]
}
''';
List<PromotionMessage> promotionMessages =
    (json.decode(jsonString)['promotion_messages'] as List)
        .map((item) => PromotionMessage.fromJson(item))
        .toList();

class SendASmsScreen extends StatefulWidget {
  const SendASmsScreen({super.key});

  @override
  State<SendASmsScreen> createState() => _SendASmsScreenState();
}

class _SendASmsScreenState extends State<SendASmsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    MixPanelAnalyticsManager()
        .sendEvent('Send_sms_landing', 'Send SMS landing', null);
    setScreenFirebase("Send_sms_landing", "Send SMS landing");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      floatHeaderSlivers: true,
      scrollBehavior:
          // This only wraps scrollbars around the header <---
          ScrollConfiguration.of(context).copyWith(scrollbars: true),
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            toolbarHeight: 200,
            backgroundColor: AppColors.primaryBackground,
            title: Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.primaryBackground,
                  borderRadius: BorderRadius.circular(0.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 20.0, 0.0, 20.0),
                      child: Text(
                        'Test our API for Free',
                        style: GoogleFonts.getFont(
                          'Plus Jakarta Sans',
                          color: FlutterFlowTheme.of(context).primaryTextColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 27.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 0.0, 20.0),
                      child: Text(
                        'SMS API lets you send promotional content to your customers. Find out how versatile and reliable our SMS API service for your user communication on various business cases.',
                        style: GoogleFonts.getFont(
                          'Plus Jakarta Sans',
                          color: const Color(0xFF42526D),
                          fontWeight: FontWeight.normal,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                    Container(
                      width: 629.0,
                      decoration: BoxDecoration(
                        color: const Color(0xFFCAF2FF),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 12.0, 12.0, 12.0),
                        child: Row(
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.circleInfo,
                              color: Color(0xFF0F8AB0),
                              size: 20.0,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            // ignore: unnecessary_string_escapes
                                            'The Curl employs the Auth Token for testing purposes only. Please utilize the \"Generate token API\" outlined in the comprehensive ',
                                        style: GoogleFonts.getFont(
                                          'Plus Jakarta Sans',
                                          color: const Color(0xFF067699),
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'API Document ',
                                        style: GoogleFonts.getFont(
                                          'Plus Jakarta Sans',
                                          color: const Color(0xFF067699),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.0,
                                        ),
                                        mouseCursor: SystemMouseCursors.click,
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () async {
                                            await launchApiDocUrl();
                                          },
                                      ),
                                      TextSpan(
                                        text: 'to create a fresh token.',
                                        style: GoogleFonts.getFont(
                                          'Plus Jakarta Sans',
                                          color: const Color(0xFF067699),
                                          fontSize: 14.0,
                                        ),
                                      )
                                    ],
                                    style: GoogleFonts.getFont(
                                      'Plus Jakarta Sans',
                                      color: const Color(0xFF067699),
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // const Padding(
                    //   padding: EdgeInsetsDirectional.fromSTEB(
                    //       25.0, 20.0, 25.0, 5.0),
                    //   child: Row(
                    //     mainAxisSize: MainAxisSize.max,
                    //     children: [
                    //       Padding(
                    //         padding: EdgeInsetsDirectional.fromSTEB(
                    //             25.0, 0.0, 0.0, 0.0),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            floating: false,
            pinned: false,
            //  snap: true,
            bottom: PreferredSize(
              preferredSize: const Size(double.infinity, 50),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    // height: 50,
                    // width: 600.w,
                    child: TabBar(
                      isScrollable: true,
                      tabAlignment: TabAlignment.start,
                      controller: _tabController,
                      indicator: const UnderlineTabIndicator(
                          borderSide: BorderSide(
                        width: 4,
                        color: Color(0xFF2861B4),
                      )),
                      padding: EdgeInsets.zero,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelColor: Colors.black,
                      dividerColor: AppColors.black50,
                      tabs: const [
                        Tab(
                          text: "Try with UI",
                        ),
                        Tab(
                          text: "Try with Code",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ];
      },
      body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: [
            ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: const TryWithUITabSendSMS()),
            ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: const TryWithCodeTabSendSMS()),
          ]),
    ));
  }
}
