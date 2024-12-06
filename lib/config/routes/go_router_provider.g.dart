// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'go_router_provider.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $shellRouteData,
    ];

RouteBase get $shellRouteData => StatefulShellRouteData.$route(
      factory: $ShellRouteDataExtension._fromState,
      branches: [
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/',
              name: 'home',
              factory: $HomeRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/dashboard',
              name: 'dashboard',
              factory: $DashboardRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/analytics-SMS-Service',
              name: 'analytics-SMS-Service',
              factory: $SMSServiceAnalyticsRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/analytics-OTP-Service',
              name: 'analytics-OTP-Service',
              factory: $OTPServiceAnalyticsRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/reports',
              name: 'reports',
              factory: $ReportsAnalyticsRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/developerDocs',
              name: 'developerDocs',
              factory: $DeveloperDocsRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/credits',
              name: 'credits',
              factory: $CreditsRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/SendSMS',
              name: 'SendSMS',
              factory: $SendSMSRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/VerifyUser',
              name: 'VerifyUser',
              factory: $VerifiedUserRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/accountdetails',
              name: 'accountdetails',
              factory: $AccountDetailsRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/Groups',
              name: 'Groups',
              factory: $ContactGroupRouteExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'contact/:id',
                  name: 'contact',
                  factory: $ContactsRouteExtension._fromState,
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/smssender',
              name: 'sms',
              factory: $SMSSenderRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/whatsApp-OTP',
              name: 'whatsApp',
              factory: $WhatsAPPRouteExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $ShellRouteDataExtension on ShellRouteData {
  static ShellRouteData _fromState(GoRouterState state) =>
      const ShellRouteData();
}

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => HomeRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $DashboardRouteExtension on DashboardRoute {
  static DashboardRoute _fromState(GoRouterState state) =>
      const DashboardRoute();

  String get location => GoRouteData.$location(
        '/dashboard',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SMSServiceAnalyticsRouteExtension on SMSServiceAnalyticsRoute {
  static SMSServiceAnalyticsRoute _fromState(GoRouterState state) =>
      const SMSServiceAnalyticsRoute();

  String get location => GoRouteData.$location(
        '/analytics-SMS-Service',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $OTPServiceAnalyticsRouteExtension on OTPServiceAnalyticsRoute {
  static OTPServiceAnalyticsRoute _fromState(GoRouterState state) =>
      const OTPServiceAnalyticsRoute();

  String get location => GoRouteData.$location(
        '/analytics-OTP-Service',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ReportsAnalyticsRouteExtension on ReportsAnalyticsRoute {
  static ReportsAnalyticsRoute _fromState(GoRouterState state) =>
      const ReportsAnalyticsRoute();

  String get location => GoRouteData.$location(
        '/reports',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $DeveloperDocsRouteExtension on DeveloperDocsRoute {
  static DeveloperDocsRoute _fromState(GoRouterState state) =>
      const DeveloperDocsRoute();

  String get location => GoRouteData.$location(
        '/developerDocs',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CreditsRouteExtension on CreditsRoute {
  static CreditsRoute _fromState(GoRouterState state) => const CreditsRoute();

  String get location => GoRouteData.$location(
        '/credits',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SendSMSRouteExtension on SendSMSRoute {
  static SendSMSRoute _fromState(GoRouterState state) => const SendSMSRoute();

  String get location => GoRouteData.$location(
        '/SendSMS',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $VerifiedUserRouteExtension on VerifiedUserRoute {
  static VerifiedUserRoute _fromState(GoRouterState state) =>
      const VerifiedUserRoute();

  String get location => GoRouteData.$location(
        '/VerifyUser',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AccountDetailsRouteExtension on AccountDetailsRoute {
  static AccountDetailsRoute _fromState(GoRouterState state) =>
      const AccountDetailsRoute();

  String get location => GoRouteData.$location(
        '/accountdetails',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ContactGroupRouteExtension on ContactGroupRoute {
  static ContactGroupRoute _fromState(GoRouterState state) =>
      ContactGroupRoute();

  String get location => GoRouteData.$location(
        '/Groups',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ContactsRouteExtension on ContactsRoute {
  static ContactsRoute _fromState(GoRouterState state) => ContactsRoute(
        id: state.pathParameters['id']! ?? '',
      );

  String get location => GoRouteData.$location(
        '/Groups/contact/${Uri.encodeComponent(id)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SMSSenderRouteExtension on SMSSenderRoute {
  static SMSSenderRoute _fromState(GoRouterState state) => SMSSenderRoute();

  String get location => GoRouteData.$location(
        '/smssender',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $WhatsAPPRouteExtension on WhatsAPPRoute {
  static WhatsAPPRoute _fromState(GoRouterState state) => const WhatsAPPRoute();

  String get location => GoRouteData.$location(
        '/whatsApp-OTP',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
