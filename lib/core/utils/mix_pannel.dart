import 'package:messagecentral/core/utils/app_environment.dart';
import 'package:messagecentral/core/utils/firebase_analytics_functions.dart'
    as firebasefunctions;
import 'package:messagecentral/core/utils/local_state_cache.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';

class MixPanelAnalyticsManager {
  static final MixPanelAnalyticsManager _instance =
      MixPanelAnalyticsManager._internal();
  late Mixpanel mixpanel;

  MixPanelAnalyticsManager._internal();

  factory MixPanelAnalyticsManager() {
    return _instance;
  }

  Future<void> initMixpanel() async {
    String projectToken = '';
    if (FlavorConfig.instance!.flavor.name == Flavor.PRODUCTION.name) {
      projectToken = 'ee65f4948c78a51a45053cf30cae6d32';
    } else {
      projectToken = '735e80c38227ac3d175fe69bfdaf5c08';
    }
    mixpanel = await Mixpanel.init(projectToken, trackAutomaticEvents: true);
  }

  void sendEvent(String eventName, String displayName,
      Map<String, Object>? properties) async {
    try {
      Map<String, Object>? properties2 = {};
      properties2.addAll({
        'environment': FlavorConfig.instance!.env,
        'userName': LocalStateCache().fName,
        'email': LocalStateCache().email,
        'countryCode': LocalStateCache().countryCode,
        'mobileNumber': LocalStateCache().phoneNo,
        'customerID': LocalStateCache().customerId,
        'displayName': displayName,
        
      });
      firebasefunctions.sendEventFirebase(
          eventName, displayName, properties ?? properties2);
      mixpanel.track(eventName, properties: properties ?? properties2);
      // ignore: empty_catches
    } catch (e) {}
  }

  void sendConversionEvent(String eventName, String displayName,
      Map<String, Object>? properties, String pagePath, String pageUrl) async {
    properties ??= {};
    properties.addAll({
      'environment': FlavorConfig.instance!.env,
      'userName': LocalStateCache().fName,
      'email': LocalStateCache().email,
      'countryCode': LocalStateCache().countryCode,
      'mobileNumber': LocalStateCache().phoneNo,
      'customerID': LocalStateCache().customerId,
      'displayName': displayName
    });
    mixpanel.track(eventName, properties: properties);
    firebasefunctions.sendConversionEvent(
        eventName, displayName, pagePath, pageUrl);
  }
}
