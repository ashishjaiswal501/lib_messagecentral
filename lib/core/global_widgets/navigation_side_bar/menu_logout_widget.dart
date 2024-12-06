// ignore_for_file: use_build_context_synchronously
import 'package:fluttertoast/fluttertoast.dart';

import 'package:go_router/go_router.dart';
import 'package:messagecentral/config/routes/route.dart';
import 'package:messagecentral/core/constants/app_colors.dart';

import 'package:messagecentral/core/global_widgets/app_animation.dart';
import 'package:messagecentral/core/utils/custom_icon.dart';
import 'package:messagecentral/core/utils/local_state_cache.dart';
import 'package:messagecentral/core/utils/mix_pannel.dart';
import 'package:messagecentral/user_cache_manager/bloc/user_cache_manager_bloc.dart';

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MenuLogoutWidget extends StatefulWidget {
  final StatefulNavigationShell? statefulNavigationShell;
  const MenuLogoutWidget({super.key, this.statefulNavigationShell});

  @override
  State<MenuLogoutWidget> createState() => _MenuLogoutWidgetState();
}

class _MenuLogoutWidgetState extends State<MenuLogoutWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(100.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
  };
  bool iSobscureTextCustomerId = true;

  void obscureTextCustomerId() {
    setState(() {
      iSobscureTextCustomerId = !iSobscureTextCustomerId;
    });
  }

  @override
  Widget build(BuildContext context) {
    // context.watch<FFAppState>();

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
              child: Material(
                color: Colors.transparent,
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Container(
                  width: 228.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 5.0),
                        child: Text(
                          'Customer ID',
                          style: GoogleFonts.getFont(
                            'Plus Jakarta Sans',
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.normal,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFF5F6F7),
                              borderRadius: BorderRadius.circular(4.0),
                              border: Border.all(
                                color: const Color(0xFFB3B9C4),
                                width: 1.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: TextFormField(
                                    initialValue: LocalStateCache().customerId,
                                    readOnly: true,
                                    obscureText: iSobscureTextCustomerId,
                                    decoration: InputDecoration(
                                      fillColor: Colors.transparent,
                                      filled: true,
                                      hoverColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hintStyle: const TextStyle(
                                        color: Color(0xFF98A1B0),
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14.0,
                                      ),
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
                                      contentPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              6.0, 12.0, 12.0, 12.0),
                                      suffixIcon: InkWell(
                                        onTap: () => obscureTextCustomerId(),
                                        focusNode:
                                            FocusNode(skipTraversal: true),
                                        child: Icon(
                                          iSobscureTextCustomerId
                                              ? Icons.visibility_off_outlined
                                              : Icons.visibility_outlined,
                                          color: const Color(0xFF7A8699),
                                          size: 20.0,
                                        ),
                                      ),
                                    ),
                                    style: const TextStyle(
                                      color: Color(0xFF42526D),
                                      fontSize: 14.0,
                                    ),
                                    textAlign: TextAlign.start,
                                    // validator: _model.textControllerValidator
                                    //   .asValidator(context),
                                  )),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await Clipboard.setData(ClipboardData(
                                          text: LocalStateCache().customerId));

                                      Fluttertoast.showToast(
                                          msg:
                                              "Customer ID Successfully Copied.",
                                          toastLength: Toast.LENGTH_SHORT,
                                          webBgColor: "#003153",
                                          textColor: Colors.white,
                                          timeInSecForIosWeb: 5,
                                          webPosition: 'center');
                                    },
                                    child: const Icon(
                                      FFIcons.kcopy,
                                      color: Color(0xFF7A8699),
                                      size: 20.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 16.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFCAF2FF),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 12.0, 12.0, 12.0),
                            child: Text(
                              'Use this code to integrate API’s and keep it confidential',
                              style: GoogleFonts.getFont(
                                'Plus Jakarta Sans',
                                color: const Color(0xFF067699),
                                fontWeight: FontWeight.normal,
                                fontSize: 11.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 1.0,
                        color: Color(0xFFDFE2E6),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          //  MixPanelAnalyticsManager().sendEvent('account_details', 'Account Details', null);

                          Navigator.pop(context);
                          context.goNamed('accountdetails');
                          // widget.statefulNavigationShell.goBranch(8,
                          //     initialLocation: 8 ==
                          //         widget.statefulNavigationShell.currentIndex);

                          // FFAppState().update(() {
                          //   FFAppState().selectedPage = 'account_details';
                          //   FFAppState().showDrawer = false;
                          // });
                        },
                        child: const Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 0.0, 16.0),
                              child: Icon(
                                Icons.person_outline,
                                color: Color(0xFF42526D),
                                size: 20.0,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 16.0, 16.0, 16.0),
                              child: Text(
                                'Account Details',
                                style: TextStyle(
                                  color: AppColors.primaryText,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          // MixPanelAnalyticsManager().sendEvent('log_out', 'Log out', null);

                          LocalStateCache().clearChache();
                          Provider.of<UserCacheManagerBloc>(context,
                                  listen: false)
                              .loginSession();

                          context.goNamed(RoutePath.login.name);
                          Navigator.pop(context);
                        },
                        child: const Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 0.0, 16.0),
                              child: Icon(
                                Icons.logout,
                                color: Color(0xFF42526D),
                                size: 20.0,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 16.0, 16.0, 16.0),
                              child: Text(
                                'Log Out',
                                style: TextStyle(
                                  color: AppColors.primaryText,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation']!),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuLogoutHomeWidget extends StatefulWidget {
  const MenuLogoutHomeWidget({
    super.key,
  });

  @override
  State<MenuLogoutHomeWidget> createState() => _MenuLogoutHomeWidgetState();
}

class _MenuLogoutHomeWidgetState extends State<MenuLogoutHomeWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(100.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
  };
  bool iSobscureTextCustomerId = true;

  void obscureTextCustomerId() {
    setState(() {
      iSobscureTextCustomerId = !iSobscureTextCustomerId;
    });
  }

  String customerid = '';
  void getCUstomerId() {
    setState(() {
      customerid = LocalStateCache().customerId;
    });
  }

  @override
  void initState() {
    getCUstomerId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // context.watch<FFAppState>();

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
              child: Material(
                color: Colors.transparent,
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Container(
                  width: 228.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          //  MixPanelAnalyticsManager().sendEvent('account_details', 'Account Details', null);

                          Navigator.pop(context);
                          context.goNamed('accountdetails');
                          MixPanelAnalyticsManager().sendEvent(
                              "MC_Con_Acc_details_CTA",
                              "MC Con Acc details CTA",
                              null);
                          // widget.statefulNavigationShell.goBranch(8,
                          //     initialLocation: 8 ==
                          //         widget.statefulNavigationShell.currentIndex);

                          // FFAppState().update(() {
                          //   FFAppState().selectedPage = 'account_details';
                          //   FFAppState().showDrawer = false;
                          // });
                        },
                        child: const Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 0.0, 0.0),
                              child: Icon(
                                Icons.person_outline,
                                color: Color(0xFF42526D),
                                size: 20.0,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 16.0, 16.0, 0.0),
                              child: Text(
                                'Account Details',
                                style: TextStyle(
                                  color: AppColors.primaryText,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // InkWell(
                      //   splashColor: Colors.transparent,
                      //   focusColor: Colors.transparent,
                      //   hoverColor: Colors.transparent,
                      //   highlightColor: Colors.transparent,
                      //   onTap: () async {
                      //     //  MixPanelAnalyticsManager().sendEvent('account_details', 'Account Details', null);

                      //     Navigator.pop(context);
                      //     context.goNamed('accountdetails');
                      //     // widget.statefulNavigationShell.goBranch(8,
                      //     //     initialLocation: 8 ==
                      //     //         widget.statefulNavigationShell.currentIndex);

                      //     // FFAppState().update(() {
                      //     //   FFAppState().selectedPage = 'account_details';
                      //     //   FFAppState().showDrawer = false;
                      //     // });
                      //   },
                      //   child: Row(
                      //     mainAxisSize: MainAxisSize.max,
                      //     children: [
                      //       Padding(
                      //         padding: const EdgeInsetsDirectional.fromSTEB(
                      //             16.0, 16.0, 0.0, 0.0),
                      //         child: SvgPicture.asset(
                      //           ImagePath.customerSupport,
                      //           // ignore: deprecated_member_use
                      //           color: const Color(0xFF42526D),
                      //           height: 20.0,
                      //         ),
                      //       ),
                      //       const Padding(
                      //         padding: EdgeInsetsDirectional.fromSTEB(
                      //             8.0, 16.0, 16.0, 0.0),
                      //         child: Text(
                      //           'Contact Support',
                      //           style: TextStyle(
                      //             color: AppColors.primaryText,
                      //             fontWeight: FontWeight.normal,
                      //             fontSize: 14.0,
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),

                      const Divider(
                        thickness: 0.5,
                        color: Color(0xFFDFE2E6),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 5.0, 16.0, 5.0),
                        child: Text(
                          'Customer ID',
                          style: GoogleFonts.getFont(
                            'Plus Jakarta Sans',
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.normal,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFF5F6F7),
                              borderRadius: BorderRadius.circular(4.0),
                              border: Border.all(
                                color: const Color(0xFFB3B9C4),
                                width: 1.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: TextFormField(
                                    initialValue: customerid,

                                    readOnly: true,
                                    obscureText: iSobscureTextCustomerId,
                                    decoration: InputDecoration(
                                      hoverColor: Colors.transparent,
                                      fillColor: Colors.transparent,
                                      filled: true,
                                      hintStyle: const TextStyle(
                                        color: Color(0xFF98A1B0),
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14.0,
                                      ),
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
                                      contentPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              6.0, 12.0, 12.0, 12.0),
                                      suffixIcon: InkWell(
                                        onTap: () => obscureTextCustomerId(),
                                        focusNode:
                                            FocusNode(skipTraversal: true),
                                        child: Icon(
                                          iSobscureTextCustomerId
                                              ? Icons.visibility_off_outlined
                                              : Icons.visibility_outlined,
                                          color: const Color(0xFF7A8699),
                                          size: 20.0,
                                        ),
                                      ),
                                    ),
                                    style: const TextStyle(
                                      color: Color(0xFF42526D),
                                      fontSize: 14.0,
                                    ),
                                    textAlign: TextAlign.start,
                                    // validator: _model.textControllerValidator
                                    //   .asValidator(context),
                                  )),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await Clipboard.setData(ClipboardData(
                                          text: LocalStateCache().customerId));

                                      Fluttertoast.showToast(
                                          msg:
                                              "Customer ID Successfully Copied.",
                                          toastLength: Toast.LENGTH_SHORT,
                                          webBgColor: "#003153",
                                          textColor: Colors.white,
                                          timeInSecForIosWeb: 5,
                                          webPosition: 'center');
                                      MixPanelAnalyticsManager().sendEvent(
                                          "MC_Con_Acc_details_CID_Copy_CTA",
                                          "MC Con Acc details CID Copy CTA",
                                          null);
                                    },
                                    child: const Icon(
                                      FFIcons.kcopy,
                                      color: Color(0xFF7A8699),
                                      size: 20.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFCAF2FF),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 12.0, 12.0, 12.0),
                            child: Text(
                              'Use this code to integrate API’s and keep it confidential',
                              style: GoogleFonts.getFont(
                                'Plus Jakarta Sans',
                                color: const Color(0xFF067699),
                                fontWeight: FontWeight.normal,
                                fontSize: 11.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 0.5,
                        color: Color(0xFFDFE2E6),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          // MixPanelAnalyticsManager().sendEvent('log_out', 'Log out', null);

                          LocalStateCache().clearChache();
                          Provider.of<UserCacheManagerBloc>(context,
                                  listen: false)
                              .loginSession();

                          context.goNamed(RoutePath.login.name);
                          Navigator.pop(context);
                          MixPanelAnalyticsManager().sendEvent(
                              "MC_Con_Acc_details_Logout_CTA",
                              "MC Con Acc details Logout CTA",
                              null);
                        },
                        child: const Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 0.0, 16.0),
                              child: Icon(
                                Icons.logout,
                                color: Color(0xFF42526D),
                                size: 20.0,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 16.0, 16.0),
                              child: Text(
                                'Log Out',
                                style: TextStyle(
                                  color: AppColors.primaryText,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation']!),
            ),
          ],
        ),
      ),
    );
  }
}
