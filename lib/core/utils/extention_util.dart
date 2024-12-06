// ignore_for_file: prefer_adjacent_string_concatenation

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:messagecentral/core/constants/api_end_points.dart';
import 'package:messagecentral/core/utils/app_environment.dart';
import 'package:messagecentral/core/utils/local_state_cache.dart';
import 'package:url_launcher/url_launcher.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

extension Base64convertExtention on String {
  String? base64Function(String? str) {
    if (str != null && str.isNotEmpty) {
      return base64Encode(utf8.encode(str.trim()));
    } else {
      return "";
    }
  }
}

extension CurrencyFormatFiveDecimal on num {}

String? currencyFormatFiveDecimal(double? num, {int totalDigits = 5}) {
  if (num == null) {
    return " ";
  }
  if (num < 10000) {
    var decimalNo = num.toStringAsFixed(totalDigits);
    return "\$$decimalNo";
  }
  var formattedNo = NumberFormat.compactCurrency(
          decimalDigits: 3, locale: "en_US", symbol: "\$")
      .format(num);
  return formattedNo;
}

String? currencyFormat(double? num) {
  if (num == null) {
    return " ";
  }
  if (num < 10000) {
    var decimalNo = num.toStringAsFixed(3);
    return "\$$decimalNo";
  }
  var formattedNo = NumberFormat.compactCurrency(
          decimalDigits: 3, locale: "en_US", symbol: "\$")
      .format(num);
  return formattedNo;
}

String getReturnUrl() => html.window.location.href;
Future launchWhatsAppNow({String? authKey}) async {
  authKey = authKey ?? LocalStateCache().authToken;
  if (FlavorConfig.instance!.flavor == Flavor.PRODUCTION) {
    await launchURL(
        'https://whatsappnow.messagecentral.com' + '?key=' + authKey);
  } else {
    await launchURL(
        'https://whatsapp-staging.messagecentral.com' + '?key=' + authKey);
  }
}

void launchMailto(String emailId) async {
  Uri mail = Uri.parse("mailto:$emailId?subject=" "&body=" "");
  // Convert the Mailto instance into a string.
  // Use either Dart's string interpolation
  // or the toString() method.
  await launchUrl(mail);
}

Future launchURL(String url) async {
  var uri = Uri.parse(url);
  // print(uri);
  try {
    await launchUrl(uri);
  } catch (e) {
    throw 'Could not launch $uri: $e';
  }
}

Future launchApiDocUrl() async {
  await launchURL(
      '${FlavorConfig.instance!.values!.baseUrl}${AppUrl.verifyNowApiDoc}');
}

Future<bool> validAmount(String? amount) async {
  // Add your function code here!
  if (amount != null && amount.isNotEmpty) {
    var pattern = "^[0-9]{1,}";
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(amount)) {
      return false;
    } else {
      return true;
    }
  }
  return false;
}

bool checkMinAmount(
  String? amount,
  String? minimumAmount,
) {
  if (amount != null &&
      amount.isNotEmpty &&
      minimumAmount != null &&
      minimumAmount.isNotEmpty) {
    if (int.parse(amount) >= int.parse(minimumAmount)) {
      return true;
    } else {
      return false;
    }
  }
  return false;
}

Future loadUrl(String? url) async {
  // Add your function code here!
  if (url != null && url.isNotEmpty) {
    html.window.open(url, "_self");
  }
}

double? findPercentage(
  int? total,
  int? value,
) {
  // find percentage formula
  if (total == null || value == null || total == 0) {
    return 0.0;
  }
  var percentage = ((value / total) * 100).round();
  double roundOffPercent = percentage / 100;
  if (roundOffPercent >= 0.0 && roundOffPercent <= 1.0) {
    return roundOffPercent;
  } else {
    return 0.0;
  }
}

int? findPercentageText(
  int? total,
  int? value,
) {
  // find percentage formula
  if (total == null || value == null || total == 0) {
    return 0;
  }
  return ((value / total) * 100).round();
}

String formatDuration(int seconds) {
  Duration duration = Duration(seconds: seconds);
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  return "$twoDigitMinutes:$twoDigitSeconds";
}

void showOverlaySnackbar(
    BuildContext context, String message, IconData icon, backgroundColor) {
  final overlay = Overlay.of(context);
  late OverlayEntry overlayEntry;

  overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: 50,
      right: 10,
      child: Material(
        // adding transparent to apply custom border
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
              color: backgroundColor, borderRadius: BorderRadius.circular(4)),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Colors.white, size: 20),
              const SizedBox(width: 10),
              Text(
                message,
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(
                width: 30,
              ),
              IconButton(
                icon: const Icon(Icons.close, color: Colors.white, size: 15),
                onPressed: () {
                  overlayEntry.remove();
                },
              )
            ],
          ),
        ),
      ),
    ),
  );

  overlay.insert(overlayEntry);
  Future.delayed(const Duration(seconds: 3), () {
    overlayEntry.remove();
  });
}
