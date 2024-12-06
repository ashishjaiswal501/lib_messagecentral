// ignore_for_file: sized_box_for_whitespace

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messagecentral/core/constants/app_colors.dart';
import 'package:messagecentral/core/constants/image_path.dart';
import 'package:messagecentral/core/global_widgets/custom_button.dart';
import 'package:messagecentral/core/global_widgets/navigation_side_bar/menu_logout_widget.dart';
import 'package:messagecentral/core/utils/custom_icon.dart';
import 'package:messagecentral/core/utils/extention_util.dart';
import 'package:messagecentral/core/utils/flutter_flow_theme.dart';
import 'package:messagecentral/core/utils/local_state_cache.dart';
import 'package:messagecentral/core/utils/mix_pannel.dart';
import 'package:messagecentral/features/add_credits/presentation/screens/add_credits_screen.dart';
import 'package:messagecentral/features/getuserdeails/presentation/bloc/get_user_details_bloc.dart';
import 'package:messagecentral/features/getuserdeails/presentation/bloc/get_user_details_state.dart';
import 'package:unicons/unicons.dart';

class DrawerItem {
  const DrawerItem({
    required this.title,
    required this.icon,
  });

  final IconData icon;
  final String title;
}

class NavigationDrawerWidget extends StatefulWidget {
  const NavigationDrawerWidget(
      {super.key, required this.statefulNavigationShell, this.scaffoldKey});

  final StatefulNavigationShell statefulNavigationShell;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  bool isCollapsed = false;
  final padding = const EdgeInsets.symmetric(horizontal: 15);
  String selectedProduct = "Verify Now";
  void toggleIsCollapsed() {
    setState(() {
      isCollapsed = !isCollapsed;
    });
  }

  IconData? icon;
  String? updatemesage() {
    String selectedProduct2 = "VerifyNow";
    if (widget.statefulNavigationShell.currentIndex == 8) {
      selectedProduct2 = "VerifyNow";
      icon = Icons.verified_user;
      setState(() {});
    } else if (widget.statefulNavigationShell.currentIndex == 7 ||
        widget.statefulNavigationShell.currentIndex == 2) {
      selectedProduct2 = "MessageNow";
      icon = FFIcons.kmsgNow;
      setState(() {});
    } else {
      selectedProduct2 = "VerifyNow";
      icon = Icons.verified_user;
      setState(() {});
    }

    return selectedProduct2;
  }

  IconData? updatemesageIcon() {
    IconData icon = Icons.verified_user;
    if (widget.statefulNavigationShell.currentIndex == 8) {
      icon = Icons.verified_user;

      setState(() {});
    } else if (widget.statefulNavigationShell.currentIndex == 7 ||
        widget.statefulNavigationShell.currentIndex == 2) {
      icon = FFIcons.kmsgNow;

      setState(() {});
    } else {
      icon = Icons.verified_user;
      setState(() {});
    }

    return icon;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isCollapsed ? 90 : 265,
      color: const Color(0xFF1B4078),
      child: Column(
        children: [
          buildHeader(isCollapsed),

          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                Container(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        16.0, 16.0, 16.0, 0.0),
                    child: !isCollapsed
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Balance',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11.0,
                                    ),
                                  ),
                                  BlocConsumer<GetUserDetailsBloc,
                                          GetUserDetailsState>(
                                      listener: (context, state) {
                                    if (state is GetUserDetailsStateSuccess) {
                                      LocalStateCache().emailId = state
                                              .getUserDetailsEntity
                                              ?.data
                                              ?.email ??
                                          "";
                                      LocalStateCache().fName = state
                                              .getUserDetailsEntity
                                              ?.data
                                              ?.firstName ??
                                          "";
                                      LocalStateCache().lName = state
                                              .getUserDetailsEntity
                                              ?.data
                                              ?.lastName ??
                                          "";
                                      LocalStateCache().phoneNo = state
                                              .getUserDetailsEntity
                                              ?.data
                                              ?.phone ??
                                          "";
                                      LocalStateCache().countryCode = state
                                              .getUserDetailsEntity
                                              ?.data
                                              ?.countryCode ??
                                          "";
                                    }
                                  }, builder: (context, state) {
                                    return Text(
                                      currencyFormatFiveDecimal(state
                                                  .getUserDetailsEntity
                                                  ?.data
                                                  ?.wallet
                                                  ?.credits ??
                                              0.0)
                                          .toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17.0,
                                      ),
                                    );
                                  }),
                                ],
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  MixPanelAnalyticsManager().sendEvent(
                                      'Navigation_panel_top_up',
                                      'Navigation Panel Top Up',
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
                                text: 'TOP UP',
                                options: FFButtonOptions(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      4.0, 8.0, 4.0, 8.0),
                                  iconPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).secondary,
                                  textStyle: GoogleFonts.getFont(
                                    'Plus Jakarta Sans',
                                    color:
                                        FlutterFlowTheme.of(context).whiteColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10.0,
                                  ),
                                  elevation: 0.0,
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 0.0,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                showLoadingIndicator: false,
                              ),
                              // ElevatedButton(
                              //     style: ElevatedButton.styleFrom(
                              //         elevation: 0,
                              //         textStyle: const TextStyle(
                              //           fontSize: 10,
                              //           fontWeight: FontWeight.w600,
                              //         ),
                              //         padding:
                              //             const EdgeInsetsDirectional.fromSTEB(
                              //                 4.0, 8.0, 4.0, 8.0),
                              //         backgroundColor: Colors.green,
                              //         fixedSize: const Size(60, 35)),
                              //     onPressed: () async {
                              //       await showModalBottomSheet(
                              //         isScrollControlled: true,
                              //         backgroundColor: Colors.transparent,
                              //         enableDrag: false,
                              //         context: context,
                              //         builder: (context) {
                              //           return Padding(
                              //             padding:
                              //                 MediaQuery.viewInsetsOf(context),
                              //             child: const AddCreditWidget(),
                              //           );
                              //         },
                              //       );
                              //     },
                              //     child: const Text("TOP UP"))
                            ],
                          )
                        : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                textStyle: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    4.0, 8.0, 4.0, 8.0),
                                backgroundColor: Colors.green,
                                fixedSize: const Size(60, 35)),
                            onPressed: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: const AddCreditWidget(),
                                  );
                                },
                              );
                            },
                            child: const Text("TOP UP"))),
                const SizedBox(height: 24),
                Padding(
                    padding: padding,
                    child: Column(
                      children: [
                        if (widget.statefulNavigationShell.currentIndex == 0)
                          bildListTileItem(
                              isCollapsed: isCollapsed,
                              title: "Home",
                              icon: Icons.home,
                              indexRoute: 0),
                        if (widget.statefulNavigationShell.currentIndex != 0)
                          Material(
                              type: MaterialType.transparency,
                              child: !isCollapsed
                                  ? Container(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              10.0, 10.0, 10.0, 10.0),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF143059),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                // selectedProduct == "Verify Now" ||
                                                updatemesageIcon()!,
                                                color: Colors.white,
                                                size: 20.0,
                                              ),
                                              const SizedBox(
                                                width: 4,
                                              ),
                                              Text(
                                                updatemesage()!,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17.0,
                                                    color: Colors.white),
                                              )
                                            ],
                                          ),
                                          buildDropdownSwitch(context),
                                        ],
                                      ))
                                  : Container(
                                      width: 40,
                                      height: 40,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      decoration: BoxDecoration(
                                          color: AppColors.blue90,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: InkWell(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          onTap: () {
                                            // widget.statefulNavigationShell.goBranch(indexRoute,
                                            //     initialLocation: indexRoute ==
                                            //         widget.statefulNavigationShell.currentIndex);
                                          },
                                          child: const Icon(Icons.verified_user,
                                              color: Colors.white)))),
                        ScreenUtil().setVerticalSpacing(16),
                        // verify now widget
                        Visibility(
                          visible: selectedProduct == "Verify Now",
                          child: Column(
                            children: [
                              bildListTileItem(
                                isCollapsed: isCollapsed,
                                indexRoute: 1,
                                title: 'Dashboard',
                                icon: FFIcons.kdashboardicon,
                              ),
                              ScreenUtil().setVerticalSpacing(16),
                              !isCollapsed
                                  ? Theme(
                                      data: ThemeData()
                                          .copyWith(dividerColor: Colors.blue),
                                      child: ExpansionTile(
                                        textColor: Colors.white,
                                        collapsedIconColor: Colors.white,
                                        collapsedTextColor: Colors.white,
                                        iconColor: Colors.white,
                                        dense: true,
                                        tilePadding:
                                            const EdgeInsets.only(left: 10),
                                        expandedCrossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        expandedAlignment: Alignment.topLeft,
                                        title: Text(
                                          "Analytics",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium!
                                              .copyWith(
                                                  fontSize: 14.0,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                        leading: const Icon(
                                          FFIcons.kanaylticsicon,
                                          color: Color(0xFF9EB9DE),
                                          size: 24.0,
                                        ),
                                        children: [
                                          bildListTileItem(
                                              isCollapsed: isCollapsed,
                                              indexRoute: 2,
                                              title: 'SMS Service',
                                              icon: Icons.chat_bubble_outline),
                                          ScreenUtil().setVerticalSpacing(16),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10),
                                            child: bildListTileItem(
                                                isCollapsed: isCollapsed,
                                                indexRoute: 3,
                                                title: 'OTP Service',
                                                icon: Icons.verified_user),
                                          ),
                                          ScreenUtil().setVerticalSpacing(6),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10),
                                            child: bildListTileItem(
                                                isCollapsed: isCollapsed,
                                                indexRoute: 4,
                                                title: 'Reports',
                                                icon:
                                                    UniconsLine.file_minus_alt),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container(
                                      width: 40,
                                      height: 40,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      decoration: BoxDecoration(
                                          color: 2 ==
                                                  widget.statefulNavigationShell
                                                      .currentIndex
                                              ? AppColors.blue60
                                              : null,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: InkWell(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          onTap: () {
                                            widget.statefulNavigationShell.goBranch(
                                                2,
                                                initialLocation: 2 ==
                                                    widget
                                                        .statefulNavigationShell
                                                        .currentIndex);
                                          },
                                          child: const Icon(
                                            FFIcons.kanaylticsicon,
                                            color: Color(0xFF9EB9DE),
                                            size: 24.0,
                                          ))),
                              ScreenUtil().setVerticalSpacing(16),
                              // bildListTileItem(
                              //   isCollapsed: isCollapsed,
                              //   indexRoute: 5,
                              //   title: 'Manage Sender Id',
                              //   icon: Icons.send,
                              // ),
                              // ScreenUtil().setVerticalSpacing(16),
                              bildListTileItem(
                                isCollapsed: isCollapsed,
                                indexRoute: 5,
                                title: 'Developer Docs',
                                icon: FFIcons.kdevlopericon,
                              ),
                              ScreenUtil().setVerticalSpacing(16),
                              bildListTileItem(
                                isCollapsed: isCollapsed,
                                indexRoute: 6,
                                title: 'Credits',
                                icon: FFIcons.kcrediticon,
                              ),
                              ScreenUtil().setVerticalSpacing(16),
                              !isCollapsed
                                  ? Theme(
                                      data: ThemeData()
                                          .copyWith(dividerColor: Colors.blue),
                                      child: ExpansionTile(
                                        textColor: Colors.white,
                                        collapsedIconColor: Colors.white,
                                        collapsedTextColor: Colors.white,
                                        iconColor: Colors.white,
                                        tilePadding:
                                            const EdgeInsets.only(left: 10),
                                        expandedCrossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        expandedAlignment: Alignment.topLeft,
                                        title: Text(
                                          "Getting Started",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium!
                                              .copyWith(
                                                  fontSize: 14.0,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                        leading: const Icon(
                                          FFIcons.kgetstartingicon,
                                          color: Color(0xFF9EB9DE),
                                          size: 24.0,
                                        ),
                                        children: [
                                          bildListTileItem(
                                              isCollapsed: isCollapsed,
                                              indexRoute: 7,
                                              title: 'Send a SMS',
                                              icon: Icons.chat_bubble_outline),
                                          ScreenUtil().setVerticalSpacing(16),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10),
                                            child: bildListTileItem(
                                                isCollapsed: isCollapsed,
                                                indexRoute: 8,
                                                title: LocalStateCache()
                                                            .countryCode ==
                                                        "91"
                                                    ? "SMS OTP"
                                                    : 'Verify a User',
                                                icon: Icons
                                                    .verified_user_outlined),
                                          ),
                                          Visibility(
                                            visible:
                                                LocalStateCache().countryCode ==
                                                    "91",
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                bottom: 10,
                                              ),
                                              child: bildListTileItem(
                                                  isCollapsed: isCollapsed,
                                                  indexRoute: 12,
                                                  title: LocalStateCache()
                                                              .countryCode ==
                                                          "91"
                                                      ? "WhatsApp OTP"
                                                      : '',
                                                  icon: FontAwesomeIcons
                                                      .whatsapp),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container(
                                      width: 40,
                                      height: 40,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      decoration: BoxDecoration(
                                          color: 6 ==
                                                  widget.statefulNavigationShell
                                                      .currentIndex
                                              ? AppColors.blue60
                                              : null,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: InkWell(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          onTap: () {
                                            widget.statefulNavigationShell.goBranch(
                                                7,
                                                initialLocation: 7 ==
                                                    widget
                                                        .statefulNavigationShell
                                                        .currentIndex);
                                          },
                                          child: const Icon(
                                            FFIcons.kgetstartingicon,
                                            color: Color(0xFF9EB9DE),
                                            size: 24.0,
                                          ))),
                              Visibility(
                                  visible: false,
                                  child: ScreenUtil().setVerticalSpacing(16)),

                              Visibility(
                                visible: false,
                                child: bildListTileItem(
                                  isCollapsed: isCollapsed,
                                  indexRoute: 10,
                                  title: 'Contacts',
                                  icon: FFIcons.kcontacts,
                                ),
                              ),
                              Visibility(
                                visible: false,
                                child: bildListTileItem(
                                  isCollapsed: isCollapsed,
                                  indexRoute: 11,
                                  title: 'SMS',
                                  icon: FontAwesomeIcons.sms,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Visibility(
                        //   visible: selectedProduct == "Message Now",
                        //   child: Column(
                        //     children: [
                        //       ScreenUtil().setVerticalSpacing(16),
                        //       bildListTileItem(
                        //         isCollapsed: isCollapsed,
                        //         indexRoute: 11,
                        //         title: 'SMS',
                        //         icon: Icons.mail_outline,
                        //       ),
                        //       ScreenUtil().setVerticalSpacing(16),
                        //       bildListTileItem(
                        //         isCollapsed: isCollapsed,
                        //         indexRoute: 12,
                        //         title: 'Contacts',
                        //         icon: FFIcons.kcontacts,
                        //       ),
                        //       ScreenUtil().setVerticalSpacing(16),
                        //       bildListTileItem(
                        //         isCollapsed: isCollapsed,
                        //         indexRoute: 13,
                        //         title: 'Reports',
                        //         icon: Icons.insert_chart_outlined_rounded,
                        //       ),
                        //       ScreenUtil().setVerticalSpacing(16),
                        //       bildListTileItem(
                        //         isCollapsed: isCollapsed,
                        //         indexRoute: 14,
                        //         title: 'Application Bar',
                        //         icon: FFIcons.kappbar,
                        //       ),
                        //       ScreenUtil().setVerticalSpacing(16),
                        //       bildListTileItem(
                        //         isCollapsed: isCollapsed,
                        //         indexRoute: 15,
                        //         title: 'Settings',
                        //         icon: Icons.settings_outlined,
                        //       ),
                        //     ],
                        //   ),
                        // )
                      ],
                    )),
                // buildList(items: itemsFirst, isCollapsed: isCollapsed),
                const SizedBox(height: 24),
              ],
            ),
          ),
          // buildList(
          //   indexOffset: itemsFirst.length,
          //   items: itemsSecond,
          //   isCollapsed: isCollapsed,
          // ),
          // const Spacer(),
          buildCollapseIcon(context, isCollapsed),
          const SizedBox(height: 12),
          BlocBuilder<GetUserDetailsBloc, GetUserDetailsState>(
              builder: (context, state) {
            return Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
              child: !isCollapsed
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.account_circle,
                              size: 40,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "${state.getUserDetailsEntity?.data?.firstName ?? ""} ${state.getUserDetailsEntity?.data?.lastName ?? ""}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            )
                          ],
                        ),
                        IconButton(
                            onPressed: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: Container(
                                      height: double.infinity,
                                      child: MenuLogoutWidget(
                                        statefulNavigationShell:
                                            widget.statefulNavigationShell,
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            icon: const Icon(
                              Icons.menu,
                              color: Colors.white,
                              size: 36,
                            ))
                      ],
                    )
                  : const Icon(
                      Icons.account_circle,
                      size: 40,
                      color: Colors.white,
                    ),
            );
          })
        ],
      ),
    );
  }

  // components...
  Widget bildListTileItem({
    required isCollapsed,
    required String title,
    required IconData icon,
    required int indexRoute,
  }) {
    return Material(
        type: MaterialType.transparency,
        child: !isCollapsed
            ? ListTile(
                dense: true,
                minLeadingWidth: 5,
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                selected:
                    indexRoute == widget.statefulNavigationShell.currentIndex,
                selectedTileColor: AppColors.blue60,
                leading: Icon(
                  icon,
                  color: const Color(0xFF9EB9DE),
                  size: 24.0,
                ),
                title: Text(
                  title,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontSize: 14.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  LocalStateCache().setrouteIndex = indexRoute;
                  widget.statefulNavigationShell.goBranch(indexRoute,
                      initialLocation: indexRoute ==
                          widget.statefulNavigationShell.currentIndex);
                  widget.scaffoldKey?.currentState?.closeDrawer();
                },
              )
            : Container(
                width: 40,
                height: 40,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                    color: indexRoute ==
                            widget.statefulNavigationShell.currentIndex
                        ? AppColors.blue60
                        : null,
                    borderRadius: BorderRadius.circular(4)),
                child: InkWell(
                    borderRadius: BorderRadius.circular(4),
                    onTap: () {
                      widget.statefulNavigationShell.goBranch(indexRoute,
                          initialLocation: indexRoute ==
                              widget.statefulNavigationShell.currentIndex);
                    },
                    child: Icon(
                      icon,
                      color: const Color(0xFF9EB9DE),
                      size: 24.0,
                    ))));
  }

  Widget buildMenuItem({
    required bool isCollapsed,
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
    int? index,
    bool isSelected = false,
  }) {
    const color = Colors.white;
    final leading = Icon(icon, color: color);

    return Material(
      type: MaterialType.transparency,
      child: isCollapsed
          ? InkWell(
              onTap: onClicked,
              child: Container(
                  width: 40,
                  height: 40,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: isSelected ? AppColors.blue60 : null,
                      borderRadius: BorderRadius.circular(4)),
                  child: leading),
            )
          : ListTile(
              dense: true,
              minLeadingWidth: 5,
              shape: RoundedRectangleBorder(
                //<-- SEE HERE

                borderRadius: BorderRadius.circular(4),
              ),
              selected: isSelected,
              selectedTileColor: AppColors.blue60,
              leading: leading,
              title: Text(text,
                  style: const TextStyle(color: color, fontSize: 16)),
              onTap: onClicked,
            ),
    );
  }

  Widget buildCollapseIcon(BuildContext context, bool isCollapsed) {
    // final double size = 52;
    // final icon = isCollapsed ? Icons.arrow_forward_ios : Icons.arrow_back_ios;
    final alignment = isCollapsed ? Alignment.center : Alignment.centerRight;
    final margin = isCollapsed ? null : const EdgeInsets.only(right: 16);
    // final width = isCollapsed ? double.infinity : size;

    return Container(
      alignment: alignment,
      margin: margin,
      child: InkWell(
        child: Container(
          width: 30,
          height: 30,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: FaIcon(
            !isCollapsed
                ? FontAwesomeIcons.circleChevronLeft
                : FontAwesomeIcons.circleChevronRight,
            color: Colors.white,
            size: 25.0,
          ),
        ),
        onTap: () {
          toggleIsCollapsed();
        },
      ),
    );
  }

  Widget buildHeader(bool isCollapsed) => isCollapsed
      ? InkWell(
          child: Container(
          width: double.infinity,
          height: 76.0,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding:
                const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: Image.asset(
                'assets/images/imgAppIcon.png',
                width: 38.0,
                height: 32.0,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ))
      : InkWell(
          onTap: widget.statefulNavigationShell.currentIndex != 0
              ? () {
                  // context.goNamed(RoutePath.home.name);

                  widget.statefulNavigationShell.goBranch(0,
                      initialLocation:
                          0 == widget.statefulNavigationShell.currentIndex);
                }
              : null,
          child: Container(
            // width: 250,
            height: 76.0,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.statefulNavigationShell.currentIndex != 0)
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 16.0, 0.0),
                      child: SvgPicture.asset(
                        'assets/images/homeMenu.svg',
                        width: 32.0,
                        height: 32.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: Image.asset(
                      'assets/images/imgAppIcon.png',
                      width: 38.0,
                      height: 32.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        5.0, 0.0, 0.0, 0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: SvgPicture.asset(
                        'assets/images/dashBoardLogoTitle.svg',
                        width: 76.0,
                        height: 29.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ));

  Widget buildDropdownSwitch(BuildContext context) {
    return DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
      customButton: const Text('Switch',
          style: TextStyle(
              color: Color(0xFF11984A),
              fontWeight: FontWeight.w500,
              fontSize: 11.0)),
      //customButton: const Icon(Icons.keyboard_arrow_down_sharp, size: 28, color: Color(0xFF11984A)),
      items: productsList
          .map((String item) => DropdownMenuItem<String>(
                value: item,
                child: Row(
                  children: [
                    buildProductIcon(item),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(4.0, 0.0, 0.0, 0.0),
                      child: Text(
                        item,
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: const Color(0xFF2861B4),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0,
                                ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ))
          .toList(),
      dropdownStyleData: DropdownStyleData(
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          offset: const Offset(-20, 0),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(8),
            thickness: MaterialStateProperty.all<double>(6),
            thumbVisibility: MaterialStateProperty.all<bool>(true),
          )),
      onChanged: (value) {
        setState(() {
          // if (value != "WhatsApp Now") {
          //   selectedProduct = value!;
          // } else {
          //   String authkey = LocalStateCache().authToken;
          //   launchWhatsAppNow(authKey: authkey);
          // }
          if (value == "WhatsApp Now") {
            String authkey = LocalStateCache().authToken;
            launchWhatsAppNow(authKey: authkey);
          } else if (value == "Message Now") {
            context.goNamed("SendSMS");
          } else if (value == "Verify Now") {
            context.goNamed('VerifyUser');
          }
        });
      },
    ));
  }

  Widget buildProductIcon(String item) {
    if (item.toLowerCase() == 'verify now') {
      return SvgPicture.asset(
        ImagePath.verified,
        height: 16,
      );
    } else if (item.toLowerCase() == 'message now') {
      return const Icon(Icons.mail, size: 16, color: Color(0xFF2861B4));
    } else if (item.toLowerCase() == 'whatsapp now') {
      return const Icon(Icons.chat_bubble, size: 16, color: Color(0xFF2861B4));
    }
    return const Icon(Icons.chat_bubble, size: 16, color: Color(0xFF2861B4));
  }

  // end components
}

final List<String> productsList = [
  'Verify Now',
  'Message Now',
  'WhatsApp Now',
]; //Message Now
