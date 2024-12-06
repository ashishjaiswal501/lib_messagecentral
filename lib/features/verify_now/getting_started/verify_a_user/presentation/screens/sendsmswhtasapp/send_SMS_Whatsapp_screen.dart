import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:messagecentral/core/constants/app_colors.dart';
import 'package:messagecentral/core/utils/firebase_analytics_functions.dart';
import 'package:messagecentral/core/utils/flutter_flow_theme.dart';
import 'package:messagecentral/core/utils/mix_pannel.dart';
import 'package:messagecentral/features/getuserdeails/presentation/bloc/get_user_details_bloc.dart';
import 'package:messagecentral/features/getuserdeails/presentation/bloc/get_user_details_event.dart';
import 'package:messagecentral/features/getuserdeails/presentation/bloc/get_user_details_state.dart';
import 'package:messagecentral/features/home/presentation/bloc/check_offer_eligibility_cubit.dart';
import 'package:messagecentral/features/home/presentation/bloc/check_offer_eligibility_state.dart';
import 'package:messagecentral/features/home/presentation/bloc/check_offer_update_eligibility_state.dart';
import 'package:messagecentral/features/home/presentation/screens/widgets/home_banner_widget.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/presentation/screens/sendsmswhtasapp/widgets/try_with_code_tab.dart';
import 'package:messagecentral/features/verify_now/getting_started/verify_a_user/presentation/screens/sendsmswhtasapp/widgets/try_with_ui_tab.dart';

class SendSMSWhatsAppScreen extends StatefulWidget {
  const SendSMSWhatsAppScreen({super.key});

  @override
  State<SendSMSWhatsAppScreen> createState() => _SendSMSWhatsAppScreenState();
}

class _SendSMSWhatsAppScreenState extends State<SendSMSWhatsAppScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool visibleofferbannerPopup = false;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    MixPanelAnalyticsManager()
        .sendEvent('Getting_started_landing', 'Getting Started landing', null);
    setScreenFirebase('Getting_started_landing', 'Getting Started landing');
    MixPanelAnalyticsManager()
        .sendEvent('verify_user_landing', 'verify user landing', null);
    setScreenFirebase("verify_user_landing", "Verify user landing");
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(blurRadius: 4, color: Colors.white60)]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      20.0, 20.0, 0.0, 8.0),
                  child: Text(
                    'Test our API for Free',
                    style: GoogleFonts.getFont(
                      'Plus Jakarta Sans',
                      color: FlutterFlowTheme.of(context).primaryTextColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 24.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      20.0, 0.0, 0.0, 20.0),
                  child: Text(
                    "Test how Verify Now API and let you send a PIN to a user's phone and validate that they received it.",
                    style: GoogleFonts.getFont(
                      'Plus Jakarta Sans',
                      color: const Color(0xFF42526D),
                      fontWeight: FontWeight.normal,
                      fontSize: 14.0,
                    ),
                  ),
                ),
                BlocListener<CheckOfferEligibilityUpdateCubit,
                    CheckOfferUpdateEligibilityState>(
                  listener: (context, statelisn) {
                    statelisn.maybeWhen(
                        success: (checkOfferUpdateEligibilityEntity) async {
                          if (visibleofferbannerPopup) {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (contextalert) {
                                return Padding(
                                  padding: MediaQuery.of(context).viewInsets,
                                  child: SizedBox(
                                      height: double.infinity,
                                      child: HomeBannerWidget(
                                          onPressed: () {
                                            context
                                                .read<
                                                    CheckOfferEligibilityCubit>()
                                                .getCheckOfferEligibility();
                                            context
                                                .read<GetUserDetailsBloc>()
                                                .add(
                                                    const GetUserDetailsCall());
                                            Navigator.pop(contextalert);
                                          },
                                          onPressedClose: () {
                                            context
                                                .read<
                                                    CheckOfferEligibilityCubit>()
                                                .getCheckOfferEligibility();
                                            context
                                                .read<GetUserDetailsBloc>()
                                                .add(
                                                    const GetUserDetailsCall());
                                            Navigator.pop(contextalert);
                                          },
                                          content:
                                              "We've credited your account with \$90 balance.\nIntegrate with our APIs and enjoy sending 10,000 OTPs with us.",
                                          userName:
                                              checkOfferUpdateEligibilityEntity
                                                      .data?.username ??
                                                  "",
                                          endDate: DateFormat("dd/MM/yyyy").format(
                                              checkOfferUpdateEligibilityEntity
                                                  .data!.endDate!))),
                                );
                              },
                            );
                          }
                        },
                        orElse: () {});
                  },
                  child: BlocBuilder<GetUserDetailsBloc, GetUserDetailsState>(
                      builder: (context2, snapshot) {
                    return BlocBuilder<CheckOfferEligibilityCubit,
                        CheckOfferEligibilityState>(builder: (context2, state) {
                      return state.when(
                        initial: () => const Center(),
                        loading: () => const Center(),
                        error: (errorMessage) => const Center(),
                        success: (checkOfferEligibilityEntity) {
                          return Visibility(
                            visible: (checkOfferEligibilityEntity
                                        .responseCode !=
                                    733 &&
                                checkOfferEligibilityEntity.data != null &&
                                checkOfferEligibilityEntity.data == true &&
                                snapshot.getUserDetailsEntity != null &&
                                snapshot.getUserDetailsEntity?.data != null &&
                                snapshot.getUserDetailsEntity?.data
                                        ?.countryCode ==
                                    "1"),
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              margin: const EdgeInsets.only(
                                  left: 20, right: 20, top: 10),
                              height: 60,

                              decoration: BoxDecoration(
                                  color: const Color(0xFFEBDEFF),
                                  borderRadius: BorderRadius.circular(4)),
                              // other widget properties here
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.lightbulb,
                                        color: Color(0xFF4500B2),
                                      ),
                                      Text(
                                        "Avail \$30 Free SMS Verification cost now. Offer valid up till 15th June",
                                        style:
                                            TextStyle(color: Color(0xFF4500B2)),
                                      ),
                                    ],
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          elevation: 0.1,
                                          backgroundColor:
                                              const Color(0xFF11984A)),
                                      onPressed: () {
                                        setState(() {
                                          visibleofferbannerPopup = true;
                                        });
                                        context
                                            .read<
                                                CheckOfferEligibilityUpdateCubit>()
                                            .updateCheckOfferEligibility();
                                      },
                                      child: const Text("Avail Now"))
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    });
                  }),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(width: 1.0, color: Colors.grey[300]!),
                  )),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: TabBar(
                        isScrollable: true,
                        tabAlignment: TabAlignment.start,
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: const Color(0xFFEDF2FA)),
                        // indicator: const UnderlineTabIndicator(
                        //     borderSide: BorderSide(
                        //   width: 3,
                        //   color: Color(0xFF2861B4),
                        // )),
                        padding: EdgeInsets.zero,

                        indicatorSize: TabBarIndicatorSize.tab,
                        labelColor: const Color(0xFF2861B4),
                        unselectedLabelColor: const Color(0xFF7A8699),
                        labelStyle: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                        unselectedLabelStyle: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
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
              ],
            ),
          ),
          Expanded(
              child: TabBarView(
            children: [
              ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context)
                      .copyWith(scrollbars: false),
                  child: const TryWithUITabVerify()),
              ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context)
                      .copyWith(scrollbars: false),
                  child: const TryWithCodeTabVerify()),
            ],
          ))
        ],
      ),
    );
    // return DefaultTabController(
    //   length: 2,
    //   child: Scaffold(
    //       body: NestedScrollView(
    //     headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
    //       return <Widget>[
    //         SliverToBoxAdapter(
    //           child:
    //           BlocListener<CheckOfferEligibilityUpdateCubit,
    //               CheckOfferUpdateEligibilityState>(
    //             listener: (context, statelisn) {
    //               statelisn.maybeWhen(
    //                   success: (checkOfferUpdateEligibilityEntity) async {
    //                     if (visibleofferbannerPopup) {
    //                       await showModalBottomSheet(
    //                         isScrollControlled: true,
    //                         backgroundColor: Colors.transparent,
    //                         enableDrag: false,
    //                         context: context,
    //                         builder: (contextalert) {
    //                           return Padding(
    //                             padding: MediaQuery.of(context).viewInsets,
    //                             child: SizedBox(
    //                                 height: double.infinity,
    //                                 child: HomeBannerWidget(
    //                                     onPressed: () {
    //                                       context
    //                                           .read<
    //                                               CheckOfferEligibilityCubit>()
    //                                           .getCheckOfferEligibility();
    //                                       context
    //                                           .read<GetUserDetailsBloc>()
    //                                           .add(const GetUserDetailsCall());
    //                                       Navigator.pop(contextalert);
    //                                     },
    //                                     onPressedClose: () {
    //                                       context
    //                                           .read<
    //                                               CheckOfferEligibilityCubit>()
    //                                           .getCheckOfferEligibility();
    //                                       context
    //                                           .read<GetUserDetailsBloc>()
    //                                           .add(const GetUserDetailsCall());
    //                                       Navigator.pop(contextalert);
    //                                     },
    //                                     content:
    //                                         "We've credited your account with \$90 balance.\nIntegrate with our APIs and enjoy sending 10,000 OTPs with us.",
    //                                     userName:
    //                                         checkOfferUpdateEligibilityEntity
    //                                                 .data?.username ??
    //                                             "",
    //                                     endDate: DateFormat("dd/MM/yyyy").format(
    //                                         checkOfferUpdateEligibilityEntity
    //                                             .data!.endDate!))),
    //                           );
    //                         },
    //                       );
    //                     }
    //                   },
    //                   orElse: () {});
    //             },
    //             child: BlocBuilder<GetUserDetailsBloc, GetUserDetailsState>(
    //                 builder: (context2, snapshot) {
    //               return BlocBuilder<CheckOfferEligibilityCubit,
    //                   CheckOfferEligibilityState>(builder: (context2, state) {
    //                 return state.when(
    //                   initial: () => const Center(),
    //                   loading: () => const Center(),
    //                   error: (errorMessage) => const Center(),
    //                   success: (checkOfferEligibilityEntity) {
    //                     return Visibility(
    //                       visible: (checkOfferEligibilityEntity.responseCode !=
    //                               733 &&
    //                           checkOfferEligibilityEntity.data != null &&
    //                           checkOfferEligibilityEntity.data == true &&
    //                           snapshot.getUserDetailsEntity != null &&
    //                           snapshot.getUserDetailsEntity?.data != null &&
    //                           snapshot.getUserDetailsEntity?.data
    //                                   ?.countryCode ==
    //                               "1"),
    //                       child: Container(
    //                         padding: const EdgeInsets.all(12),
    //                         margin: const EdgeInsets.only(
    //                             left: 20, right: 20, top: 10),
    //                         height: 60,

    //                         decoration: BoxDecoration(
    //                             color: const Color(0xFFEBDEFF),
    //                             borderRadius: BorderRadius.circular(4)),
    //                         // other widget properties here
    //                         child: Row(
    //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                           children: [
    //                             const Row(
    //                               children: [
    //                                 Icon(
    //                                   FontAwesomeIcons.lightbulb,
    //                                   color: Color(0xFF4500B2),
    //                                 ),
    //                                 Text(
    //                                   "Avail \$30 Free SMS Verification cost now. Offer valid up till 15th June",
    //                                   style:
    //                                       TextStyle(color: Color(0xFF4500B2)),
    //                                 ),
    //                               ],
    //                             ),
    //                             ElevatedButton(
    //                                 style: ElevatedButton.styleFrom(
    //                                     elevation: 0.1,
    //                                     backgroundColor:
    //                                         const Color(0xFF11984A)),
    //                                 onPressed: () {
    //                                   setState(() {
    //                                     visibleofferbannerPopup = true;
    //                                   });
    //                                   context
    //                                       .read<
    //                                           CheckOfferEligibilityUpdateCubit>()
    //                                       .updateCheckOfferEligibility();
    //                                 },
    //                                 child: const Text("Avail Now"))
    //                           ],
    //                         ),
    //                       ),
    //                     );
    //                   },
    //                 );
    //               });
    //             }),
    //           ),

    //         ),
    //         SliverAppBar(
    //             centerTitle: false,
    //             backgroundColor: Colors.transparent,
    //             flexibleSpace: FlexibleSpaceBar(
    //               collapseMode: CollapseMode.pin,
    //               background: Padding(
    //                 padding:
    //                     const EdgeInsets.only(left: 20, top: 20, right: 20),
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   mainAxisAlignment: MainAxisAlignment.start,
    //                   children: <Widget>[
    //                     Text('Test our API for Free',
    //                         style: GoogleFonts.getFont(
    //                           'Plus Jakarta Sans',
    //                           color:
    //                               FlutterFlowTheme.of(context).primaryTextColor,
    //                           fontWeight: FontWeight.w600,
    //                           fontSize: 24.0,
    //                         )),
    //                     Padding(
    //                       padding: const EdgeInsetsDirectional.fromSTEB(
    //                           0.0, 20.0, 0.0, 20.0),
    //                       child: Text(
    //                         'Verify Now API lets you send a OTP (one time password) to a user\'s phone and validate that they received it. The service can be used for a number of authentication and anti-fraud purposes, such as 2-factor authentication, password-less sign-in, and validating users phone numbers.',
    //                         style: GoogleFonts.getFont(
    //                           'Plus Jakarta Sans',
    //                           color: const Color(0xFF42526D),
    //                           fontWeight: FontWeight.normal,
    //                           fontSize: 14.0,
    //                         ),
    //                       ),
    //                     ),
    //                     Container(
    //                       width: 629.0,
    //                       decoration: BoxDecoration(
    //                         color: const Color(0xFFCAF2FF),
    //                         borderRadius: BorderRadius.circular(4.0),
    //                       ),
    //                       child: Padding(
    //                         padding: const EdgeInsetsDirectional.fromSTEB(
    //                             12.0, 12.0, 12.0, 12.0),
    //                         child: Row(
    //                           children: [
    //                             const FaIcon(
    //                               FontAwesomeIcons.circleInfo,
    //                               color: Color(0xFF0F8AB0),
    //                               size: 20.0,
    //                             ),
    //                             Expanded(
    //                               child: Padding(
    //                                 padding:
    //                                     const EdgeInsetsDirectional.fromSTEB(
    //                                         8.0, 0.0, 0.0, 0.0),
    //                                 child: RichText(
    //                                   text: TextSpan(
    //                                     children: [
    //                                       TextSpan(
    //                                         text:
    //                                             'The Curl employs the Auth Token for testing purposes only. Please utilize the "Generate token API" outlined in the comprehensive ',
    //                                         style: GoogleFonts.getFont(
    //                                           'Plus Jakarta Sans',
    //                                           color: const Color(0xFF067699),
    //                                           fontWeight: FontWeight.normal,
    //                                           fontSize: 14.0,
    //                                         ),
    //                                       ),
    //                                       TextSpan(
    //                                         text: 'API Document ',
    //                                         style: GoogleFonts.getFont(
    //                                           'Plus Jakarta Sans',
    //                                           color: const Color(0xFF067699),
    //                                           fontWeight: FontWeight.bold,
    //                                           fontSize: 14.0,
    //                                         ),
    //                                         mouseCursor:
    //                                             SystemMouseCursors.click,
    //                                         recognizer: TapGestureRecognizer()
    //                                           ..onTap = () async {},
    //                                       ),
    //                                       TextSpan(
    //                                         text: 'to create a fresh token.',
    //                                         style: GoogleFonts.getFont(
    //                                           'Plus Jakarta Sans',
    //                                           color: const Color(0xFF067699),
    //                                           fontSize: 14.0,
    //                                         ),
    //                                       )
    //                                     ],
    //                                     style: GoogleFonts.getFont(
    //                                       'Plus Jakarta Sans',
    //                                       color: const Color(0xFF067699),
    //                                       fontSize: 14.0,
    //                                     ),
    //                                   ),
    //                                 ),
    //                               ),
    //                             ),
    //                           ],
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //             expandedHeight: isDesktop(context) ? 250.0 : 300,
    //             bottom: PreferredSize(
    //               preferredSize: const Size(double.infinity, 50),
    //               child:
    //                Padding(
    //                 padding: const EdgeInsets.only(left: 20),
    //                 child: Align(
    //                   alignment: Alignment.topLeft,
    //                   child: TabBar(
    //                     isScrollable: true,
    //                     tabAlignment: TabAlignment.start,
    //                     indicator: const UnderlineTabIndicator(
    //                         borderSide: BorderSide(
    //                       width: 3,
    //                       color: Color(0xFF2861B4),
    //                     )),
    //                     padding: EdgeInsets.zero,
    //                     indicatorSize: TabBarIndicatorSize.tab,
    //                     labelColor: Colors.black,
    //                     dividerColor: AppColors.black50,
    //                     tabs: const [
    //                       Tab(
    //                         text: "Try with UI",
    //                       ),
    //                       Tab(
    //                         text: "Try with Code",
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ),

    //             )),
    //       ];
    //     },
    //     body: TabBarView(
    //       physics: const NeverScrollableScrollPhysics(),
    //       children: <Widget>[
    //         ScrollConfiguration(
    //             behavior:
    //                 ScrollConfiguration.of(context).copyWith(scrollbars: false),
    //             child: const TryWithUITabVerify()),
    //         ScrollConfiguration(
    //             behavior:
    //                 ScrollConfiguration.of(context).copyWith(scrollbars: false),
    //             child: const TryWithCodeTabVerify()),
    //       ],
    //     ),
    //   )),

    // );
  }
}
