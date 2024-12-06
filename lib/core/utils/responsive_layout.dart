import 'package:flutter/material.dart';

const kBreakpointSmall = 479.0;
const kBreakpointMedium = 767.0;
const kBreakpointLarge = 991.0;
const kWatch = 200.0;
bool responsiveVisibility(
    {required BuildContext context,
    bool phone = true,
    bool tablet = true,
    bool tabletLandscape = true,
    bool desktop = true,
    bool iswatch = false}) {
  final width = MediaQuery.sizeOf(context).width;
  if (width < kBreakpointSmall) {
    return phone;
  } else if (width < kBreakpointMedium) {
    return tablet;
  } else if (width < kBreakpointLarge) {
    return tabletLandscape;
  } else if (width <= kWatch) {
    return iswatch;
  } else {
    return desktop;
  }
}

//  int _screenWidthDesktop = 1024;
//   int get screenWidthDesktop => _screenWidthDesktop;
//   set screenWidthDesktop(int _value) {
//     _screenWidthDesktop = _value;
//   }

//   int _screenWidthTablet = 800;
//   int get screenWidthTablet => _screenWidthTablet;
//   set screenWidthTablet(int _value) {
//     _screenWidthTablet = _value;
//   }
// This isMobile, isTablet, isDesktop helep us later
bool isMobile(BuildContext context) => Utils.getscreensize(context).width < 650;

bool isBigMobile(BuildContext context) =>
    Utils.getscreensize(context).width > 650 &&
    Utils.getscreensize(context).width < 800;

bool isTablet(BuildContext context) =>
    Utils.getscreensize(context).width < 1100 &&
    Utils.getscreensize(context).width >= 800;

bool isDesktop(BuildContext context) =>
    Utils.getscreensize(context).width >= 1100;

class Utils {
  static Size getscreensize(BuildContext context) {
    return MediaQuery.of(context).size;
  }
}
