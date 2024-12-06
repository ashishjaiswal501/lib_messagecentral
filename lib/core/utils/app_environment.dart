enum Env { staging, prod }

class AppEnvironment {
  String? baseApiUrl;
  String? type;
  String? whatsAppNowBaseUrl;
  AppEnvironment({this.baseApiUrl, this.type, this.whatsAppNowBaseUrl});
  static setupEnv(Env env) {
    switch (env) {
      case Env.staging:
        {
          FlavorConfig(
              flavor: Flavor.STAGING,
              name: " Message Central Dev",
              env: 'DEV',
              values: FlavorValues(
                  baseUrl: "https://cpaas-staging.messagecentral.com/",
                  whatsAppNowBaseUrl:
                      'https://whatsapp-staging.messagecentral.com'));
          break;
        }
      // {
      //   baseApiUrl = 'https://cpaas-staging.messagecentral.com';
      //   whatsAppNowBaseUrl = 'https://whatsapp-staging.messagecentral.com';
      //   type = "staging";
      //   break;
      // }
      case Env.prod:
        {
          FlavorConfig(
              flavor: Flavor.PRODUCTION,
              name: " Message Central Production",
              env: 'PROD',
              values: FlavorValues(
                  baseUrl: "https://cpaas.messagecentral.com/",
                  whatsAppNowBaseUrl:
                      'https://whatsappnow.messagecentral.com'));
          break;
        }
    }
  }
}

enum Flavor {
// ignore: constant_identifier_names
  STAGING,

  // ignore: constant_identifier_names
  PRODUCTION,
}

class FlavorValues {
  final String? baseUrl;
  final String? whatsAppNowBaseUrl;

  FlavorValues({required this.baseUrl, required this.whatsAppNowBaseUrl});
}

class FlavorConfig {
  final Flavor flavor;
  final String env;
  final String name;
  final FlavorValues? values;
  static FlavorConfig? _instance;

  factory FlavorConfig(
      {required Flavor flavor,
      required String name,
      required String env,
      required FlavorValues values}) {
    _instance ??= FlavorConfig._internal(flavor, name, env, values);
    return _instance!;
  }

  FlavorConfig._internal(this.flavor, this.name, this.env, this.values);

  static FlavorConfig? get instance => _instance;

  static bool isDevelopment() => _instance!.flavor == Flavor.STAGING;

  static bool isProduction() => _instance!.flavor == Flavor.PRODUCTION;
}
