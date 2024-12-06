import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:messagecentral/core/utils/app_environment.dart';
import 'package:messagecentral/core/utils/local_state_cache.dart';

///_setUserIdFirebase();
///_setUserPropertyFirebase();
///_setScreenFirebase(eventName, displayName, properties);
///_sendAnalyticsEventFirebase(eventName, displayName, properties);

Future<void> setScreenFirebase(String event, String screenName) async {
  // ignore: deprecated_member_use
  await FirebaseAnalytics.instance.setCurrentScreen(
    screenName: screenName,
    screenClassOverride: event,
  );
}

Future<void> setUserIdFirebase(String? userId) async {
  await FirebaseAnalytics.instance.setUserId(id: userId ?? '');
}

Future<void> setUserPropertyFirebase(String? name, String? value) async {
  await FirebaseAnalytics.instance
      .setUserProperty(name: name ?? '', value: value ?? '');
}

Future<void> sendEventFirebase(String eventName, String displayName,
    Map<String, Object>? properties) async {
  await FirebaseAnalytics.instance
      .logEvent(name: eventName, parameters: <String, dynamic>{
    'environment': FlavorConfig.instance!.env,
    'userName': LocalStateCache().fName,
    'email': LocalStateCache().email,
    'countryCode': LocalStateCache().countryCode,
    'mobileNumber': LocalStateCache().phoneNo,
    'customerID': LocalStateCache().customerId,
    'displayName': displayName,
    'page_path': Uri.base.toString(),
    'page_url': Uri.base.toString()
  });
}

Future<void> sendConversionEvent(String eventName, String displayName,
    String pagePath, String pageUrl) async {
  await FirebaseAnalytics.instance
      .logEvent(name: eventName, parameters: <String, dynamic>{
    'environment': FlavorConfig.instance!.env,
    'userName': LocalStateCache().fName,
    'email': LocalStateCache().email,
    'countryCode': LocalStateCache().countryCode,
    'mobileNumber': LocalStateCache().phoneNo,
    'customerID': LocalStateCache().customerId,
    'displayName': displayName,
    'page_path': pagePath,
    'page_url': pageUrl
  });
}
