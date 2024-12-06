import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:messagecentral/config/routes/route.dart';
import 'package:messagecentral/core/constants/app_colors.dart';
import 'package:messagecentral/core/constants/image_path.dart';
import 'package:messagecentral/core/global_widgets/navigation_side_bar/navigation_drawer_widget.dart';
import 'package:messagecentral/core/utils/responsive.dart';
import 'package:messagecentral/core/utils/responsive_layout.dart';

class NavigationDrawerMainWidget extends StatefulWidget {
  final StatefulNavigationShell statefulNavigationShell;
  const NavigationDrawerMainWidget(
      {super.key, required this.statefulNavigationShell});

  @override
  State<NavigationDrawerMainWidget> createState() =>
      _NavigationDrawerMainWidgetState();
}

class _NavigationDrawerMainWidgetState
    extends State<NavigationDrawerMainWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer:
          //  responsiveVisibility(
          //         context: context,
          //         phone: true,
          //         tablet: true,
          //         desktop: false,
          //         tabletLandscape: false)
          !Responsive.isDesktop(context)
              ? NavigationDrawerWidget(
                  scaffoldKey: _scaffoldKey,
                  statefulNavigationShell: widget.statefulNavigationShell,
                )
              : null,
      appBar: responsiveVisibility(
              context: context,
              phone: true,
              tablet: true,
              desktop: false,
              tabletLandscape: false)
          ? AppBar(
              elevation: 0.2,

              backgroundColor: Colors.white,
              //toolbarHeight: 76.5,
              shadowColor: Colors.transparent,
              titleTextStyle: const TextStyle(color: Colors.black),
              title: GestureDetector(
                onTap: () {
                  context.goNamed(RoutePath.home.name);
                },
                child: Image.asset(
                  ImagePath.appIconMessageCentral,
                  width: 51.0,
                  height: 36.0,
                  fit: BoxFit.contain,
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Center(
                    child: IconButton(
                        onPressed: () {
                          _scaffoldKey.currentState?.openDrawer();
                        },
                        icon: Icon(
                          Icons.menu_outlined,
                          size: 35,
                          color: AppColors.primaryTextColor,
                        )),
                  ),
                ),
              ],
            )
          : null,
      body: Row(
        children: <Widget>[
          if (responsiveVisibility(
            context: context,
            phone: false,
            tablet: false,
          ))
            NavigationDrawerWidget(
              statefulNavigationShell: widget.statefulNavigationShell,
            ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(child: widget.statefulNavigationShell)
        ],
      ),
    );
  }
}
