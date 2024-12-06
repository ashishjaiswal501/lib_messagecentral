// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:messagecentral/core/utils/responsive_layout.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const Responsive({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  });

// This size work fine on my design, maybe you need some customization depends on your design

  // This isMobile, isTablet, isDesktop helep us later
  static bool isMobile(BuildContext context) =>
      Utils.getscreensize(context).width < 600;

  static bool isBigMobile(BuildContext context) =>
      Utils.getscreensize(context).width > 600 &&
      Utils.getscreensize(context).width < 800;

  static bool isTablet(BuildContext context) =>
      Utils.getscreensize(context).width < 1100 &&
      Utils.getscreensize(context).width >= 800;

  static bool isDesktop(BuildContext context) =>
      Utils.getscreensize(context).width >= 1100;

  @override
  Widget build(BuildContext context) {
    final Size _size = Utils.getscreensize(context);
    // If our width is more than 1100 then we consider it a desktop
    if (_size.width >= 1100) {
      return desktop;
    }
    // If width it less then 1100 and more then 850 we consider it as tablet
    else if (_size.width >= 850 && tablet != null) {
      return tablet!;
    }
    // Or less then that we called it mobile
    else if (_size.width >= 270) {
      return mobile;
    } else {
      return const SizedBox.shrink();
    }
  }
}