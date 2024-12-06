// ignore_for_file: prefer_adjacent_string_concatenation, unnecessary_string_interpolations

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:messagecentral/core/constants/app_colors.dart';
import 'package:messagecentral/core/constants/image_path.dart';
import 'package:messagecentral/core/language/utils/app_localizations.dart';
import 'package:messagecentral/core/utils/custom_icon.dart';
import 'package:messagecentral/core/utils/extention_util.dart';
import 'package:messagecentral/core/utils/firebase_analytics_functions.dart';
import 'package:messagecentral/core/utils/local_state_cache.dart';
import 'package:messagecentral/core/utils/mix_pannel.dart';
import 'package:messagecentral/core/utils/responsive.dart';
import 'package:messagecentral/core/utils/responsive_layout.dart';
import 'package:messagecentral/features/add_credits/presentation/screens/add_credits_screen.dart';
import 'package:messagecentral/features/getuserdeails/presentation/bloc/get_user_details_bloc.dart';
import 'package:messagecentral/features/getuserdeails/presentation/bloc/get_user_details_event.dart';
import 'package:messagecentral/features/getuserdeails/presentation/bloc/get_user_details_state.dart';

import 'package:messagecentral/features/home/presentation/bloc/check_offer_eligibility_cubit.dart';
import 'package:messagecentral/features/home/presentation/bloc/check_offer_eligibility_state.dart';
import 'package:messagecentral/features/home/presentation/bloc/check_offer_update_eligibility_state.dart';
import 'package:messagecentral/features/home/presentation/screens/widgets/home_banner_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool iSobscureTextCustomerId = true;

  void obscureTextCustomerId() {
    setState(() {
      iSobscureTextCustomerId = !iSobscureTextCustomerId;
    });
  }

  bool visibleofferbanner = false;
  @override
  void initState() {
    super.initState();

    MixPanelAnalyticsManager()
        .sendEvent('MC_Console_Landing', 'MC Console Landing', null);
    setScreenFirebase('MC_Console_Landing', 'MC Console Landing');
  }

  String countryCode = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0.2,
      //   titleSpacing: isDesktop(context) ? 40 : 10,
      //   backgroundColor: Colors.white,
      //   //toolbarHeight: 76.5,
      //   shadowColor: Colors.transparent,
      //   titleTextStyle: const TextStyle(color: Colors.black),
      //   title: SvgPicture.asset(
      //     ImagePath.logo,
      //     height: 35,
      //   ),
      //   actions: [
      //     Center(
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           const Text(
      //             "Balance",
      //             style: TextStyle(
      //                 color: Color(0xFF091E42),
      //                 fontSize: 10,
      //                 fontWeight: FontWeight.w400),
      //           ),
      //           Center(
      //             child: BlocBuilder<GetUserDetailsBloc, GetUserDetailsState>(
      //                 builder: (context, state) {
      //               countryCode =
      //                   state.getUserDetailsEntity?.data?.countryCode ?? "";
      //               return Text(
      //                 currencyFormatFiveDecimal(state.getUserDetailsEntity
      //                             ?.data?.wallet?.credits ??
      //                         0.0)
      //                     .toString(),
      //                 style: const TextStyle(
      //                     color: Color(0xFF243757),
      //                     fontSize: 17,
      //                     fontWeight: FontWeight.bold),
      //               );
      //             }),
      //           ),
      //         ],
      //       ),
      //     ),
      //     const SizedBox(
      //       width: 16,
      //     ),
      //     Center(
      //       child: SizedBox(
      //           height: 34,
      //           width: 79,
      //           child: OutlinedButton(
      //               style: OutlinedButton.styleFrom(
      //                   foregroundColor: Colors.white,
      //                   backgroundColor: const Color(0xff11984A),
      //                   side: const BorderSide(
      //                     color: Color(0xFF11984A),
      //                   ),
      //                   textStyle: const TextStyle(
      //                       color: Color(0xFF11984A),
      //                       fontSize: 14,
      //                       fontWeight: FontWeight.bold),
      //                   shape: RoundedRectangleBorder(
      //                     borderRadius: BorderRadius.circular(4),
      //                   )),
      //               onPressed: () async {
      //                 MixPanelAnalyticsManager().sendEvent(
      //                     'MC_Con_topbar_top_up',
      //                     'MC Con topbar top up',
      //                     null);
      //                 await showModalBottomSheet(
      //                   isScrollControlled: true,
      //                   backgroundColor: Colors.transparent,
      //                   enableDrag: false,
      //                   context: context,
      //                   builder: (context) {
      //                     return Padding(
      //                       padding: MediaQuery.viewInsetsOf(context),
      //                       child: const AddCreditWidget(),
      //                     );
      //                   },
      //                 );
      //               },
      //               child: const Text(
      //                 "Top Up",
      //                 style: TextStyle(),
      //               ))),
      //     ),
      //     const SizedBox(
      //       width: 16,
      //     ),
      //     Center(
      //       child: InkWell(
      //         radius: 8,
      //         onTap: () async {
      //           await showModalBottomSheet(
      //             isScrollControlled: true,
      //             backgroundColor: Colors.transparent,
      //             enableDrag: false,
      //             context: context,
      //             builder: (context) {
      //               return Padding(
      //                 padding: MediaQuery.viewInsetsOf(context),
      //                 child: const SizedBox(
      //                   height: double.infinity,
      //                   child: MenuLogoutHomeWidget(),
      //                 ),
      //               );
      //             },
      //           );
      //         },
      //         child: Padding(
      //           padding: const EdgeInsets.all(4.0),
      //           child: Row(
      //             children: [
      //               Container(
      //                   height: 30,
      //                   width: 30,
      //                   padding: const EdgeInsets.all(6),
      //                   decoration: const BoxDecoration(
      //                       shape: BoxShape.circle, color: Color(0xFFDBE5F4)),
      //                   child: SvgPicture.asset(ImagePath.user)),
      //               const Icon(
      //                 Icons.keyboard_arrow_down,
      //                 color: Colors.black,
      //               )
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //     SizedBox(
      //       width: 20.w,
      //     )
      //   ],
      // ),

      body: ListView(
        padding: const EdgeInsets.only(bottom: 30),
        children: [
          ScreenUtil().setVerticalSpacing(16),

          CarouselSlider(
            options: CarouselOptions(
                aspectRatio: 12, viewportFraction: 1.0, autoPlay: true),
            items: [
              // Container(
              //   width: double.infinity,
              //   margin: EdgeInsets.symmetric(
              //     horizontal: isDesktop(context) ? 12 : 5,
              //   ),
              //   padding:
              //       const EdgeInsets.all(1.5), // Adjust padding as needed
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.circular(
              //         8.0), // Rounded corners of the Container
              //     // Add any other decoration properties such as color, boxShadow, etc.
              //   ),
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(
              //         8.0), // Rounded corners for the image
              //     child: InkWell(
              //       hoverColor: Colors.transparent,
              //       onTap: () {
              //         launchWhatsAppNow(
              //             authKey:
              //                 "${LocalStateCache().authToken}&default=true");
              //       },
              //       child: Image.asset(
              //         'assets/images/banner_w2.png',
              //         fit: BoxFit
              //             .fitWidth, // Ensures the image covers the container
              //       ),
              //     ),
              //   ),
              // ),
              if (LocalStateCache().countryCode == "91")
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(
                    horizontal: isDesktop(context) ? 12 : 5,
                  ),
                  padding:
                      const EdgeInsets.all(1.5), // Adjust padding as needed
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                        8.0), // Rounded corners of the Container
                    // Add any other decoration properties such as color, boxShadow, etc.
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        8.0), // Rounded corners for the image
                    child: InkWell(
                      hoverColor: Colors.transparent,
                      onTap: () {
                        context.goNamed('VerifyUser');
                        MixPanelAnalyticsManager().sendEvent(
                            'Home_Console_30_paisa_banner',
                            'Home_console_30_paisa_banner',
                            null);
                      },
                      child: Image.asset(
                        'assets/images/30_paisa.png',
                        fit: BoxFit
                            .fitWidth, // Ensures the image covers the container
                      ),
                    ),
                  ),
                ),

              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(
                  horizontal: isDesktop(context) ? 12 : 5,
                ),
                padding: const EdgeInsets.all(1.5), // Adjust padding as needed
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                      8.0), // Rounded corners of the Container
                  // Add any other decoration properties such as color, boxShadow, etc.
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      8.0), // Rounded corners for the image
                  child: InkWell(
                    hoverColor: Colors.transparent,
                    onTap: () {
                      context.goNamed('whatsApp');
                      MixPanelAnalyticsManager().sendEvent(
                          'Home_Console_whatsapp_Otp_bnner',
                          'Home_Console_whatsapp_Otp_banner',
                          null);
                    },
                    child: Image.asset(
                      ImagePath.whastappOtpBanner,
                      fit: BoxFit
                          .fitWidth, // Ensures the image covers the container
                    ),
                  ),
                ),
              ),
            ],
          ),

          BlocListener<CheckOfferEligibilityUpdateCubit,
              CheckOfferUpdateEligibilityState>(
            listener: (context, statelisn) {
              statelisn.maybeWhen(
                  success: (checkOfferUpdateEligibilityEntity) async {
                    if (visibleofferbanner) {
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
                                          .read<CheckOfferEligibilityCubit>()
                                          .getCheckOfferEligibility();
                                      context
                                          .read<GetUserDetailsBloc>()
                                          .add(const GetUserDetailsCall());
                                      Navigator.pop(contextalert);
                                    },
                                    onPressedClose: () {
                                      context
                                          .read<CheckOfferEligibilityCubit>()
                                          .getCheckOfferEligibility();
                                      context
                                          .read<GetUserDetailsBloc>()
                                          .add(const GetUserDetailsCall());
                                      Navigator.pop(contextalert);
                                    },
                                    content:
                                        "We've credited your account with \$30 balance.\nIntegrate our APIs and enjoy SMS Verification with us",
                                    userName: checkOfferUpdateEligibilityEntity
                                            .data?.username
                                            ?.replaceAll(
                                                RegExp(r'\bnull\b'), '') ??
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
              if (snapshot is GetUserDetailsStateSuccess) {
                return BlocBuilder<CheckOfferEligibilityCubit,
                    CheckOfferEligibilityState>(builder: (context2, state) {
                  return state.when(
                    initial: () => const Center(),
                    loading: () => const Center(),
                    error: (errorMessage) => const Center(),
                    success: (checkOfferEligibilityEntity) {
                      return Visibility(
                        visible: (checkOfferEligibilityEntity.responseCode !=
                                733 &&
                            checkOfferEligibilityEntity.data != null &&
                            checkOfferEligibilityEntity.data == true &&
                            snapshot.getUserDetailsEntity != null &&
                            snapshot.getUserDetailsEntity?.data != null &&
                            snapshot.getUserDetailsEntity?.data?.countryCode ==
                                "1"),
                        child: Container(
                          width: double.infinity,
                          height: 120,
                          margin: EdgeInsets.symmetric(
                            horizontal: isDesktop(context) ? 16 : 14.0.w,
                          ),
                          padding: const EdgeInsets.all(
                              4.0), // Adjust padding as needed
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                8.0), // Rounded corners of the Container
                            // Add any other decoration properties such as color, boxShadow, etc.
                          ),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                visibleofferbanner = true;
                              });
                              context
                                  .read<CheckOfferEligibilityUpdateCubit>()
                                  .updateCheckOfferEligibility();
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  8.0), // Rounded corners for the image
                              child: Image.asset(
                                'assets/images/us_banner30.png',
                                fit: BoxFit
                                    .cover, // Ensures the image covers the container
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                });
              } else {
                return const SizedBox.shrink();
              }
            }),
          ),

         
         
          ScreenUtil().setVerticalSpacing(16),

          if (responsiveVisibility(
              context: context,
              phone: true,
              desktop: true,
              tablet: true,
              iswatch: false,
              tabletLandscape: true))
            Visibility(
              visible: MediaQuery.of(context).size.width > 250,
              child: Container(
                padding: const EdgeInsets.all(20),
                margin: EdgeInsets.symmetric(
                    horizontal: isDesktop(context) ? 16 : 16, vertical: 0),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color(0xFFDFE2E6).withOpacity(0.5)),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 0,
                          spreadRadius: 1,
                          color: Color(0x0D000000))
                    ]),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(ImagePath.gettingStarted),
                        Flexible(
                          child: Text(
                            AppLocalizations.of(context)!
                                .translate('_Getting_Statrted'),
                            //   "Getting Statrted",
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Color(0xFF243757),
                                fontSize: 17,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                    ScreenUtil().setVerticalSpacing(16),
                    GridView.count(
                      shrinkWrap: true,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: isDesktop(context)
                          ? 3
                          : isTablet(context)
                              ? 2
                              : isBigMobile(context)
                                  ? 1
                                  : 1,
                      childAspectRatio: isDesktop(context) &&
                              MediaQuery.of(context).size.height > 700
                          ? 0.38.w
                          : isTablet(context)
                              ? 0.40.w
                              : isMobile(context)
                                  ? 1.15.w
                                  : isBigMobile(context)
                                      ? 0.8.w
                                      : isDesktop(context) &&
                                              MediaQuery.of(context)
                                                      .size
                                                      .height <
                                                  700
                                          ? 0.30.w
                                          : 0.31.w,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          // height: 100,
                          //constraints: BoxConstraints(minHeight: 300),

                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xFFDFE2E6)),
                              color: const Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: const [
                                BoxShadow(
                                    blurRadius: 0,
                                    spreadRadius: 1,
                                    color: Color(0x0D000000))
                              ]),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Center(
                                        child: titleWidget(
                                            'VerifiyNow',
                                            'OTP SMS Verification',
                                            ImagePath.verified)),
                                    ScreenUtil().setVerticalSpacing(16),
                                    checkmarkwithText("User authentication"),
                                    ScreenUtil().setVerticalSpacing(10),
                                    checkmarkwithText(
                                        "Seamless user onboarding"),
                                    ScreenUtil().setVerticalSpacing(10),
                                    checkmarkwithText("No sender ID required"),
                                    ScreenUtil().setVerticalSpacing(16),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      minimumSize:
                                          const Size(double.infinity, 42),
                                      backgroundColor: const Color(0xFF11984A),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4))),
                                  onPressed: () {
                                    context.goNamed('VerifyUser');
                                    MixPanelAnalyticsManager().sendEvent(
                                        'MC_Con_Try_VN_CTA',
                                        "MC Con Try VN CTA",
                                        null);
                                  },
                                  child: const Text(
                                    "Get Started",
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                  ))
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(16),
                          // height: 226.h,
                          width: 80.w,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xFFDFE2E6)),
                              color: const Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: const [
                                BoxShadow(
                                    blurRadius: 0,
                                    spreadRadius: 1,
                                    color: Color(0x0D000000))
                              ]),
                          child: Column(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Center(
                                        child: titleWidget('MessageNow',
                                            'SMS APIs', ImagePath.messageNow)),
                                    ScreenUtil().setVerticalSpacing(16),
                                    checkmarkwithText("SMS Marketing"),
                                    ScreenUtil().setVerticalSpacing(10),
                                    checkmarkwithText("Trancational SMS"),
                                    ScreenUtil().setVerticalSpacing(10),
                                    checkmarkwithText("Promotional SMS"),
                                    ScreenUtil().setVerticalSpacing(16),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      minimumSize:
                                          const Size(double.infinity, 42),
                                      backgroundColor: const Color(0xFF11984A),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4))),
                                  onPressed: () async {
                                    context.goNamed('SendSMS');

                                    MixPanelAnalyticsManager().sendEvent(
                                        "MC_Con_Try_MN_CTA",
                                        "MC Con Try MN CTA",
                                        null);
                                  },
                                  child: const Text(
                                    "Get Started",
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                  ))
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(16),
                          // height: 226.h,
                          width: 80.w,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xFFDFE2E6)),
                              color: const Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: const [
                                BoxShadow(
                                    blurRadius: 0,
                                    spreadRadius: 1,
                                    color: Color(0x0D000000))
                              ]),
                          child: Column(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Center(
                                        child: titleWidget(
                                            'WhatsAppNow',
                                            'WhatsApp Business APIs',
                                            ImagePath.whatsappMessage)),
                                    ScreenUtil().setVerticalSpacing(16),
                                    checkmarkwithText("WhatsApp broadcast"),
                                    ScreenUtil().setVerticalSpacing(10),
                                    checkmarkwithText("Live chat support"),
                                    ScreenUtil().setVerticalSpacing(10),
                                    checkmarkwithText(
                                        "Personalized WhatsApp marketing"),
                                    ScreenUtil().setVerticalSpacing(16),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      minimumSize:
                                          const Size(double.infinity, 42),
                                      backgroundColor: const Color(0xFF11984A),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4))),
                                  onPressed: () {
                                    launchWhatsAppNow();
                                    MixPanelAnalyticsManager().sendEvent(
                                        "MC_Con_Try_WN_CTA",
                                        "MC Con Try WN CTA",
                                        null);
                                  },
                                  child: const Text(
                                    "Get Started",
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          const SizedBox(
            height: 16,
          ),
          Responsive(
            mobile: Padding(
              padding: isDesktop(context)
                  ? EdgeInsets.fromLTRB(16, 4, 30.w, 16)
                  : const EdgeInsets.fromLTRB(16, 4, 16, 16),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 1,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                physics: const NeverScrollableScrollPhysics(),
                //padding: EdgeInsets.fromLTRB(30.w, 4, 30.w, 16),
                childAspectRatio: isDesktop(context)
                    ? 0.25.w
                    : isTablet(context)
                        ? 0.90.w
                        : isBigMobile(context)
                            ? 0.60.w
                            : 0.85.w,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    width: 80.w,
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFDFE2E6)),
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 0,
                              spreadRadius: 1,
                              color: Color(0x0D000000))
                        ]),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(ImagePath.api),
                            const SizedBox(
                              width: 6,
                            ),
                            const Flexible(
                              child: Text(
                                "API",
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Color(0xFF243757),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                        ScreenUtil().setVerticalSpacing(16),
                        Container(
                          color: const Color(0xFFFFFFFF),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8)),
                                child: Image.asset(
                                  ImagePath.apiDocumentation,
                                  fit: BoxFit.cover,
                                  width: 310.w,
                                  height: 190,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(16.0),
                                decoration: const BoxDecoration(
                                    //border: Border.all(color: const Color(0xFFDFE2E6)),
                                    border: BorderDirectional(top: BorderSide.none, bottom: BorderSide.none, start: BorderSide(color: Color(0xFFDFE2E6), width: 0.4), end: BorderSide(color: Color(0xFFDFE2E6), width: 0.4)),
                                    color: Color(0xFFFFFFFF),
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 0,
                                          spreadRadius: 1,
                                          color: Color(0x0D000000))
                                    ]),
                                child: InkWell(
                                  onTap: () async {
                                    await launchApiDocUrl();
                                    MixPanelAnalyticsManager().sendEvent(
                                        "MC_Con_VN_API_Doc_CTA",
                                        "MC Con VN API Doc CTA",
                                        null);
                                  },
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Text(
                                            "VerifyNow",
                                            style: TextStyle(
                                                color: Color(0xFF42526D),
                                                fontSize: 17.5,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          const SizedBox(
                                            width: 6,
                                          ),
                                          SvgPicture.asset(
                                              ImagePath.arrowRight),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      const Text(
                                        'Authenticate users with OTP SMS APIs in multiple languages including NodeJS, Python, Java, PHP, Ruby and C#.',
                                        style: TextStyle(
                                            color: Color(0xFF42526D),
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    // height: 100,
                    //constraints: BoxConstraints(minHeight: 300),

                    width: 80.w,
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFDFE2E6)),
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 0,
                              spreadRadius: 1,
                              color: Color(0x0D000000))
                        ]),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(ImagePath.videoRectangle),
                            const SizedBox(
                              width: 6,
                            ),
                            const Flexible(
                              child: Text(
                                "Video Guide",
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Color(0xFF243757),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                        ScreenUtil().setVerticalSpacing(16),
                        Container(
                          color: const Color(0xFFFFFFFF),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8)),
                                child: Stack(
                                  children: [
                                    Image.asset(
                                      ImagePath.videoGuide,
                                      fit: BoxFit.cover,
                                      width: 310.w,
                                      height: 190,
                                    ),
                                    Positioned.fill(
                                      child: IconButton(
                                          onPressed: () async {
                                            await launchURL(LocalStateCache()
                                                        .countryCode ==
                                                    "91"
                                                ? 'https://www.youtube.com/watch?v=8uYqbAR8Rps'
                                                : "https://www.youtube.com/watch?v=lxqGw3vQ53A");
                                            MixPanelAnalyticsManager()
                                                .sendEvent(
                                                    "MC_Con_VN_Video_CTA",
                                                    "MC Con VN Video CTA",
                                                    null);
                                          },
                                          icon: const Icon(
                                            Icons.play_arrow,
                                            size: 70,
                                            color: Colors.white,
                                          )),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(16.0),
                                decoration: const BoxDecoration(
                                    //border: Border.all(color: const Color(0xFFDFE2E6)),
                                    border: BorderDirectional(top: BorderSide.none, bottom: BorderSide.none, start: BorderSide(color: Color(0xFFDFE2E6), width: 0.4), end: BorderSide(color: Color(0xFFDFE2E6), width: 0.4)),
                                    color: Color(0xFFFFFFFF),
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 0,
                                          spreadRadius: 1,
                                          color: Color(0x0D000000))
                                    ]),
                                child: InkWell(
                                  onTap: () async {
                                    await launchURL(LocalStateCache()
                                                .countryCode ==
                                            "91"
                                        ? 'https://www.youtube.com/watch?v=8uYqbAR8Rps'
                                        : "https://www.youtube.com/watch?v=lxqGw3vQ53A");
                                    MixPanelAnalyticsManager().sendEvent(
                                        "MC_Con_VN_Video_CTA",
                                        "MC Con VN Video CTA",
                                        null);
                                  },
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Flexible(
                                            child: Text(
                                              "How to Use OTP SMS APIs?",
                                              softWrap: true,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Color(0xFF42526D),
                                                  fontSize: 17.5,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 6,
                                          ),
                                          SvgPicture.asset(
                                              ImagePath.arrowRight),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      const Text(
                                        '🔐 Learn how to authenticate users with SMS OTP APIs using Message Central in NodeJS, Python, Java, PHP, Ruby, and C#!',
                                        softWrap: true,
                                        style: TextStyle(
                                            color: Color(0xFF42526D),
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    // height: 100,
                    //constraints: BoxConstraints(minHeight: 300),

                    width: 80.w,
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFDFE2E6)),
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 0,
                              spreadRadius: 1,
                              color: Color(0x0D000000))
                        ]),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Trusted by Fastest Growing Organizations",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xFF243757),
                              fontSize: 17,
                              fontWeight: FontWeight.w700),
                        ),
                        ScreenUtil().setVerticalSpacing(16),
                        Image.asset(ImagePath.organization)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            tablet: Padding(
              padding: isDesktop(context)
                  ? EdgeInsets.fromLTRB(16, 4, 30.w, 16)
                  : const EdgeInsets.fromLTRB(16, 4, 16, 16),
              child: Column(
                children: [
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: isDesktop(context) ? 3 : 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    physics: const NeverScrollableScrollPhysics(),
                    //padding: EdgeInsets.fromLTRB(30.w, 4, 30.w, 16),
                    childAspectRatio: isDesktop(context)
                        ? 0.20.w
                        : isTablet(context)
                            ? 0.32.w
                            : 0.25.w,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        // height: 100,
                        //constraints: BoxConstraints(minHeight: 300),

                        width: 80.w,
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFFDFE2E6)),
                            color: const Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 0,
                                  spreadRadius: 1,
                                  color: Color(0x0D000000))
                            ]),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(ImagePath.api),
                                const SizedBox(
                                  width: 6,
                                ),
                                const Flexible(
                                  child: Text(
                                    "API",
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Color(0xFF243757),
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            ),
                            ScreenUtil().setVerticalSpacing(16),
                            Container(
                              color: const Color(0xFFFFFFFF),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8)),
                                    child: Image.asset(
                                      ImagePath.apiDocumentation,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(16.0),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 2.9),
                                    decoration: const BoxDecoration(
                                        //border: Border.all(color: const Color(0xFFDFE2E6)),
                                        border: BorderDirectional(top: BorderSide.none, bottom: BorderSide.none, start: BorderSide(color: Color(0xFFDFE2E6), width: 0.4), end: BorderSide(color: Color(0xFFDFE2E6), width: 0.4)),
                                        color: Color(0xFFFFFFFF),
                                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 0,
                                              spreadRadius: 1,
                                              color: Color(0x0D000000))
                                        ]),
                                    child: InkWell(
                                      onTap: () async {
                                        await launchApiDocUrl();
                                        MixPanelAnalyticsManager().sendEvent(
                                            "MC_Con_VN_API_Doc_CTA",
                                            "MC Con VN API Doc CTA",
                                            null);
                                      },
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              const Text(
                                                "VerifyNow",
                                                style: TextStyle(
                                                    color: Color(0xFF42526D),
                                                    fontSize: 17.5,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              const SizedBox(
                                                width: 6,
                                              ),
                                              SvgPicture.asset(
                                                  ImagePath.arrowRight),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          const Text(
                                            'Authenticate users with OTP SMS APIs in multiple languages including NodeJS, Python, Java, PHP, Ruby and C#.',
                                            style: TextStyle(
                                                color: Color(0xFF42526D),
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(16),
                        // height: 100,
                        //constraints: BoxConstraints(minHeight: 300),

                        width: 80.w,
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFFDFE2E6)),
                            color: const Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 0,
                                  spreadRadius: 1,
                                  color: Color(0x0D000000))
                            ]),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(ImagePath.videoRectangle),
                                const SizedBox(
                                  width: 6,
                                ),
                                const Flexible(
                                  child: Text(
                                    "Video Guide",
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Color(0xFF243757),
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            ),
                            ScreenUtil().setVerticalSpacing(16),
                            Container(
                              color: const Color(0xFFFFFFFF),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8)),
                                    child: Stack(
                                      children: [
                                        Image.asset(
                                          ImagePath.videoGuide,
                                          fit: BoxFit.cover,
                                        ),
                                        Positioned.fill(
                                          child: IconButton(
                                              onPressed: () async {
                                                await launchURL(LocalStateCache()
                                                            .countryCode ==
                                                        "91"
                                                    ? 'https://www.youtube.com/watch?v=8uYqbAR8Rps'
                                                    : "https://www.youtube.com/watch?v=lxqGw3vQ53A");
                                                MixPanelAnalyticsManager()
                                                    .sendEvent(
                                                        "MC_Con_VN_Video_CTA",
                                                        "MC Con VN Video CTA",
                                                        null);
                                              },
                                              icon: const Icon(
                                                Icons.play_arrow,
                                                size: 70,
                                                color: Colors.white,
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(16.0),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 2.9),
                                    decoration: const BoxDecoration(
                                        //border: Border.all(color: const Color(0xFFDFE2E6)),
                                        border: BorderDirectional(top: BorderSide.none, bottom: BorderSide.none, start: BorderSide(color: Color(0xFFDFE2E6), width: 0.4), end: BorderSide(color: Color(0xFFDFE2E6), width: 0.4)),
                                        color: Color(0xFFFFFFFF),
                                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 0,
                                              spreadRadius: 1,
                                              color: Color(0x0D000000))
                                        ]),
                                    child: InkWell(
                                      onTap: () async {
                                        await launchURL(LocalStateCache()
                                                    .countryCode ==
                                                "91"
                                            ? 'https://www.youtube.com/watch?v=8uYqbAR8Rps'
                                            : "https://www.youtube.com/watch?v=lxqGw3vQ53A");
                                        MixPanelAnalyticsManager().sendEvent(
                                            "MC_Con_VN_Video_CTA",
                                            "MC Con VN Video CTA",
                                            null);
                                      },
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              const Flexible(
                                                child: Text(
                                                  "How to Use OTP SMS APIs?",
                                                  softWrap: true,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color: Color(0xFF42526D),
                                                      fontSize: 17.5,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 6,
                                              ),
                                              SvgPicture.asset(
                                                  ImagePath.arrowRight),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          const Text(
                                            '🔐 Learn how to authenticate users with SMS OTP APIs using Message Central in NodeJS, Python, Java, PHP, Ruby, and C#!',
                                            softWrap: true,
                                            style: TextStyle(
                                                color: Color(0xFF42526D),
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  ScreenUtil().setVerticalSpacing(20),
                  Container(
                    padding: const EdgeInsets.all(16),
                    // height: 100,
                    //constraints: BoxConstraints(minHeight: 300),

                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFDFE2E6)),
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 0,
                              spreadRadius: 1,
                              color: Color(0x0D000000))
                        ]),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Trusted by Fastest Growing Organizations",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xFF243757),
                              fontSize: 17,
                              fontWeight: FontWeight.w700),
                        ),
                        ScreenUtil().setVerticalSpacing(16),
                        Image.asset(ImagePath.organizationtablet)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            desktop: Padding(
              padding: isDesktop(context)
                  ? const EdgeInsets.fromLTRB(16, 4, 16, 16)
                  : EdgeInsets.fromLTRB(16, 4, 16.w, 16),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: isDesktop(context) &&
                        MediaQuery.of(context).size.width > 1100
                    ? 3
                    : 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                physics: const NeverScrollableScrollPhysics(),
                //padding: EdgeInsets.fromLTRB(30.w, 4, 30.w, 16),
                childAspectRatio: isDesktop(context)
                    ? 0.24.w
                    : isTablet(context)
                        ? 0.42.w
                        : 0.24.w,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    width: 80.w,
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFDFE2E6)),
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 0,
                              spreadRadius: 1,
                              color: Color(0x0D000000))
                        ]),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(ImagePath.api),
                            const SizedBox(
                              width: 6,
                            ),
                            const Flexible(
                              child: Text(
                                "API",
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Color(0xFF243757),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                        ScreenUtil().setVerticalSpacing(16),
                        Container(
                          color: const Color(0xFFFFFFFF),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8)),
                                child: Image.asset(
                                  ImagePath.apiDocumentation,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(16.0),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 2.9),
                                decoration: const BoxDecoration(
                                    //border: Border.all(color: const Color(0xFFDFE2E6)),
                                    border: BorderDirectional(top: BorderSide.none, bottom: BorderSide.none, start: BorderSide(color: Color(0xFFDFE2E6), width: 0.4), end: BorderSide(color: Color(0xFFDFE2E6), width: 0.4)),
                                    color: Color(0xFFFFFFFF),
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 0,
                                          spreadRadius: 1,
                                          color: Color(0x0D000000))
                                    ]),
                                child: InkWell(
                                  onTap: () async {
                                    await launchApiDocUrl();
                                    MixPanelAnalyticsManager().sendEvent(
                                        "MC_Con_VN_API_Doc_CTA",
                                        "MC Con VN API Doc CTA",
                                        null);
                                  },
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Text(
                                            "VerifyNow",
                                            style: TextStyle(
                                                color: Color(0xFF42526D),
                                                fontSize: 17.5,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          const SizedBox(
                                            width: 6,
                                          ),
                                          SvgPicture.asset(
                                              ImagePath.arrowRight),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      const Text(
                                        'Authenticate users with OTP SMS APIs in multiple languages including NodeJS, Python, Java, PHP, Ruby and C#.',
                                        style: TextStyle(
                                            color: Color(0xFF42526D),
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    // height: 100,
                    //constraints: BoxConstraints(minHeight: 300),

                    width: 80.w,
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFDFE2E6)),
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 0,
                              spreadRadius: 1,
                              color: Color(0x0D000000))
                        ]),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(ImagePath.videoRectangle),
                            const SizedBox(
                              width: 6,
                            ),
                            const Flexible(
                              child: Text(
                                "Video Guide",
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Color(0xFF243757),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                        ScreenUtil().setVerticalSpacing(16),
                        Container(
                          color: const Color(0xFFFFFFFF),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8)),
                                child: Stack(
                                  children: [
                                    Image.asset(
                                      ImagePath.videoGuide,
                                      fit: BoxFit.cover,
                                    ),
                                    Positioned.fill(
                                      child: IconButton(
                                          onPressed: () async {
                                            await launchURL(LocalStateCache()
                                                        .countryCode ==
                                                    "91"
                                                ? 'https://www.youtube.com/watch?v=8uYqbAR8Rps'
                                                : "https://www.youtube.com/watch?v=lxqGw3vQ53A");
                                            MixPanelAnalyticsManager()
                                                .sendEvent(
                                                    "MC_Con_VN_Video_CTA",
                                                    "MC Con VN Video CTA",
                                                    null);
                                          },
                                          icon: const Icon(
                                            Icons.play_arrow,
                                            size: 70,
                                            color: Colors.white,
                                          )),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(16.0),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 2.9),
                                decoration: const BoxDecoration(
                                    //border: Border.all(color: const Color(0xFFDFE2E6)),
                                    border: BorderDirectional(top: BorderSide.none, bottom: BorderSide.none, start: BorderSide(color: Color(0xFFDFE2E6), width: 0.4), end: BorderSide(color: Color(0xFFDFE2E6), width: 0.4)),
                                    color: Color(0xFFFFFFFF),
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 0,
                                          spreadRadius: 1,
                                          color: Color(0x0D000000))
                                    ]),
                                child: InkWell(
                                  onTap: () async {
                                    await launchURL(LocalStateCache()
                                                .countryCode ==
                                            "91"
                                        ? 'https://www.youtube.com/watch?v=8uYqbAR8Rps'
                                        : "https://www.youtube.com/watch?v=lxqGw3vQ53A");
                                    MixPanelAnalyticsManager().sendEvent(
                                        "MC_Con_VN_Video_CTA",
                                        "MC Con VN Video CTA",
                                        null);
                                  },
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Flexible(
                                            child: Text(
                                              "How to Use OTP SMS APIs?",
                                              softWrap: true,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Color(0xFF42526D),
                                                  fontSize: 17.5,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 6,
                                          ),
                                          SvgPicture.asset(
                                              ImagePath.arrowRight),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      const Text(
                                        '🔐 Learn how to authenticate users with SMS OTP APIs using Message Central in NodeJS, Python, Java, PHP, Ruby, and C#!',
                                        softWrap: true,
                                        style: TextStyle(
                                            color: Color(0xFF42526D),
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    // height: 100,
                    //constraints: BoxConstraints(minHeight: 300),

                    width: 80.w,
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFDFE2E6)),
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 0,
                              spreadRadius: 1,
                              color: Color(0x0D000000))
                        ]),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Trusted by Fastest Growing Organizations",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xFF243757),
                              fontSize: 17,
                              fontWeight: FontWeight.w700),
                        ),
                        ScreenUtil().setVerticalSpacing(16),
                        Image.asset(ImagePath.organization)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          //ScreenUtil().setVerticalSpacing(20),
          Container(
            padding: const EdgeInsets.all(16),
            margin:
                EdgeInsets.symmetric(horizontal: isDesktop(context) ? 16 : 16),
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFDFE2E6)),
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 0, spreadRadius: 1, color: Color(0x0D000000))
                ]),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(ImagePath.customerSupport),
                    const SizedBox(
                      width: 6,
                    ),
                    const Text(
                      "We're Here to help",
                      textAlign: TextAlign.start,
                      softWrap: true,
                      style: TextStyle(
                          color: Color(0xFF243757),
                          fontSize: 17,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                ScreenUtil().setVerticalSpacing(16),
                const Flexible(
                  child: Text(
                    "Our dedicated support team is ready to assist you. Reach out to us for any inquiries, technical assistance, or feedback.",
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF42526D),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Column(
                  children: [
                    Wrap(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      runSpacing: 10,
                      children: [
                        SizedBox(
                          width: 350,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Technical Help",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF243757),
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(ImagePath.mail),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      launchMailto(
                                          "operations@messagecentral.com");
                                    },
                                    child: const Text(
                                      "operations@messagecentral.com",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          decorationColor: Color(0xFF0F8AB0),
                                          color: Color(0xFF0F8AB0)),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 350,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Partnership Opportunities",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF243757),
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(ImagePath.mail),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      launchMailto("growth@messagecentral.com");
                                    },
                                    child: const Text(
                                      "growth@messagecentral.com",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          decorationColor: Color(0xFF0F8AB0),
                                          color: Color(0xFF0F8AB0)),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 350,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Sales Assistance",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF243757),
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(ImagePath.mail),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      launchMailto("sales@messagecentral.com");
                                    },
                                    child: const Text(
                                      "sales@messagecentral.com",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          decorationColor: Color(0xFF0F8AB0),
                                          color: Color(0xFF0F8AB0)),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 350,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Chat With Us!",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF243757),
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(ImagePath.whatsapp),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  const Text(
                                    "+91 96678 88199",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        decorationColor: Color(0xFF0F8AB0),
                                        color: Color(0xFF0F8AB0)),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          ScreenUtil().setVerticalSpacing(20),
          Container(
            padding: const EdgeInsets.all(16),
            margin: EdgeInsets.symmetric(
                horizontal: isDesktop(context) ? 16.0 : 16),
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFDFE2E6)),
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 0, spreadRadius: 1, color: Color(0x0D000000))
                ]),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(ImagePath.userCircle),
                    const SizedBox(
                      width: 6,
                    ),
                    const Text(
                      "Account Information",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFF243757),
                          fontSize: 17,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                ScreenUtil().setVerticalSpacing(16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      runSpacing: 10,
                      spacing: 20,
                      children: [
                        SizedBox(
                          width: 290,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text("Account Details",
                                      style: TextStyle(
                                          color: Color(0xFF243757),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14)),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      context.goNamed('accountdetails');
                                    },
                                    child: const Text(
                                      "Edit",
                                      style: TextStyle(
                                          color: Color(0xFF0F8AB0),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              BlocBuilder<GetUserDetailsBloc,
                                      GetUserDetailsState>(
                                  builder: (context, state) {
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Name",
                                          style: TextStyle(
                                              color: Color(0xFF7A8699),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14.0),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "Email",
                                          style: TextStyle(
                                              color: Color(0xFF7A8699),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14.0),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "Phone no",
                                          style: TextStyle(
                                              color: Color(0xFF7A8699),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14.0),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Tooltip(
                                            message:
                                                "${state.getUserDetailsEntity?.data?.firstName ?? ""} ${state.getUserDetailsEntity?.data?.lastName ?? ""}",
                                            child: Text(
                                              "${state.getUserDetailsEntity?.data?.firstName ?? ""} ${state.getUserDetailsEntity?.data?.lastName ?? ""}",
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  color: Color(0xFF42526D),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14.0),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Tooltip(
                                            message:
                                                "${state.getUserDetailsEntity?.data?.email ?? ""}",
                                            child: Text(
                                              "${state.getUserDetailsEntity?.data?.email ?? ""}",
                                              softWrap: true,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  color: Color(0xFF42526D),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14.0),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            "+${state.getUserDetailsEntity?.data?.countryCode ?? ""}${state.getUserDetailsEntity?.data?.phone ?? ""}",
                                            softWrap: true,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                color: Color(0xFF42526D),
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14.0),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              }),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 340,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                "Customer ID",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF243757),
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              const Text(
                                "You will use this unique code during your integration. Keep it confidential.",
                                style: TextStyle(
                                    color: Color(0xFF42526D), fontSize: 11),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              TextFormField(
                                initialValue: LocalStateCache().customerId,
                                readOnly: true,
                                obscureText: iSobscureTextCustomerId,
                                decoration: InputDecoration(
                                  fillColor: const Color(0xFFF5F6F7),
                                  filled: true,
                                  hoverColor: const Color(0xFFF5F6F7),
                                  focusColor: const Color(0xFFF5F6F7),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: const BorderSide(
                                        color: Color(0xFFB3B9C4),
                                      )),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: const BorderSide(
                                        color: Color(0xFFB3B9C4),
                                      )),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: const BorderSide(
                                        color: Color(0xFFB3B9C4),
                                      )),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: const BorderSide(
                                        color: Color(0xFFB3B9C4),
                                      )),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: const BorderSide(
                                        color: Color(0xFFB3B9C4),
                                      )),
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.only(right: 12),
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
                                                  : Icons.visibility_outlined,
                                              color: const Color(0xFF7A8699),
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
                                                  toastLength:
                                                      Toast.LENGTH_SHORT,
                                                  webBgColor: "#003153",
                                                  textColor: Colors.white,
                                                  timeInSecForIosWeb: 5,
                                                  webPosition: 'center');
                                            },
                                            child: const Icon(
                                              FFIcons.kcopy,
                                              color: Color(0xFF7A8699),
                                              size: 20.0,
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
                        SizedBox(
                          width: 350,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Balance",
                                style: TextStyle(
                                    color: Color(0xFF243757),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.0),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              BlocBuilder<GetUserDetailsBloc,
                                      GetUserDetailsState>(
                                  builder: (context, state) {
                                return Text(
                                  currencyFormatFiveDecimal(state
                                              .getUserDetailsEntity
                                              ?.data
                                              ?.wallet
                                              ?.credits ??
                                          0.0)
                                      .toString(),
                                  style: const TextStyle(
                                      color: Color(0xFF243757),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 27.0),
                                );
                              }),
                              const SizedBox(
                                height: 4,
                              ),
                              const Text(
                                "Enjoy these credits to test our products. Topup any amount with a single click.",
                                style: TextStyle(
                                    color: Color(0xFF42526D),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.0),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0.2,
                                      minimumSize: const Size(100, 36),
                                      backgroundColor: const Color(0xFF11984A),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4))),
                                  onPressed: () async {
                                    MixPanelAnalyticsManager().sendEvent(
                                        'MC_Con_bottom_top_up',
                                        'MC Con bottom top up',
                                        null);
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: const AddCreditWidget(),
                                        );
                                      },
                                    );
                                  },
                                  child: const Text(
                                    "Top Up Credits",
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 13),
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget checkmarkwithText(String? discription) {
    return Row(
      children: [
        SvgPicture.asset(ImagePath.checkmark),
        const SizedBox(
          width: 4,
        ),
        Flexible(
          child: Text(
            discription ?? "",
            softWrap: true,
            overflow: discription!.length > 20 ? null : TextOverflow.ellipsis,
            style: const TextStyle(
                color: Color(0xFF42526D),
                fontSize: 12.5,
                fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }

  Widget titleWidget(String? title, String? subtitle, String assetPath) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(assetPath),
            Flexible(
              child: Text(
                title ?? "",
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: AppColors.blue60,
                    fontSize: 21,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        ScreenUtil().setVerticalSpacing(8),
        Text(
          subtitle ?? "",
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: const Color(0xFF42526D).withOpacity(0.85),
              fontSize: 14,
              fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
