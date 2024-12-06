import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:messagecentral/config/routes/route.dart';
import 'package:messagecentral/core/base/features/countrycode/presentation/screens/cubit/country_code_cubit.dart';
import 'package:messagecentral/core/utils/app_environment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messagecentral/core/utils/local_state_cache.dart';
import 'package:messagecentral/core/utils/mix_pannel.dart';
import 'package:messagecentral/features/login/presentation/bloc/login_bloc.dart';
import 'package:messagecentral/injection_container.dart';
import 'package:messagecentral/user_cache_manager/bloc/user_cache_manager_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'app_bloc_observer.dart';
import 'config/routes/go_router_provider.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:intl/date_symbol_data_local.dart';
// import 'package:webview_flutter_web/webview_flutter_web.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:messagecentral/core/utils/firebase_analytics_functions.dart'
    as firebasefunctions;

void main() async {
  //WebViewPlatform.instance = WebWebViewPlatform();
  Bloc.observer = AppBlocObserver();
  AppEnvironment.setupEnv(Env.staging);

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  await ScreenUtil.ensureScreenSize();
  configureDependencies();

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAGKSRSI6Am-xZ3yJNz8zULvLBlR3XaxT8",
          authDomain: "messagecentralstaging.firebaseapp.com",
          projectId: "messagecentralstaging",
          storageBucket: "messagecentralstaging.appspot.com",
          messagingSenderId: "255205579544",
          appId: "1:255205579544:web:f1f07f7e8ec0bddec2dc6d",
          measurementId: "G-VHMN4NQHSX"));

  await MixPanelAnalyticsManager().initMixpanel();
  firebasefunctions.setUserPropertyFirebase(
      'app_environment', FlavorConfig.instance!.env);
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  usePathUrlStrategy();

  initializeDateFormatting().then((_) => runApp(MyApp()));

  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  MyApp({
    super.key,
  });

  // This widget is the root of your application.
  final UserCacheManagerBloc _loginInfo = UserCacheManagerBloc();
  @override
  Widget build(
    BuildContext context,
  ) {
    return ScreenUtilInit(
      designSize: ScreenUtil.defaultSize,
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => getIt<LoginBloc>()),
            BlocProvider(
                create: (_) => getIt<CountryCodeCubit>()..getCountryCode()),
            BlocProvider(create: (_) => getIt<UserCacheManagerBloc>()),
          ],
          child: ChangeNotifierProvider<UserCacheManagerBloc>.value(
            value: _loginInfo,
            child: MaterialApp.router(
              title: 'Message Central',
              debugShowCheckedModeBanner: false,
              routerConfig: router,
              theme: ThemeData(
                colorScheme:
                    ColorScheme.fromSeed(seedColor: const Color(0xFF215196)),
                useMaterial3: false,
                textTheme: GoogleFonts.plusJakartaSansTextTheme(),
                textSelectionTheme: TextSelectionThemeData(
                  cursorColor:
                      const Color(0xFF243757).withOpacity(0.8), //<-- SEE HERE
                ),
                elevatedButtonTheme: ElevatedButtonThemeData(
                    style: ButtonStyle(
                  textStyle: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return const TextStyle(
                          inherit: false,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w500);
                    }
                    if (states.contains(MaterialState.disabled)) {
                      return const TextStyle(
                          inherit: false,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w500);
                    }
                    return null;
                  }),
                  foregroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return const Color(0xFFFFFFFF);
                      } else if (states.contains(MaterialState.disabled))
                        // ignore: curly_braces_in_flow_control_structures
                        return const Color(0xFFFFFFFF);
                      return const Color(
                          0xFFFFFFFF); // Use the component's default.
                    },
                  ),
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return const Color(0xFF2861B4);
                      } else if (states.contains(MaterialState.disabled))
                        // ignore: curly_braces_in_flow_control_structures
                        return const Color(0xFF2861B4);
                      return const Color(
                          0xFF2861B4); // Use the component's default.
                    },
                  ),
                )),
                scaffoldBackgroundColor: const Color(0xffF5F5F5),
                inputDecorationTheme: InputDecorationTheme(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFFB3B9C4),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFFB3B9C4),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFFB3B9C4),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFFF4493E),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFFF4493E),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  filled: true,
                  fillColor: const Color(0xFFFFFFFF),
                  contentPadding: const EdgeInsetsDirectional.fromSTEB(
                      12.0, 12.0, 12.0, 12.0),
                ),
                fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
              ),
              builder: (context, Widget? child) {
                ScreenUtil.init(context);

                return MediaQuery(
                  ///Setting font does not change with system font size
                  data: MediaQuery.of(context)
                      .copyWith(textScaler: const TextScaler.linear(1.0)),
                  child: child!,
                );
              },
            ),
          ),
        );
      },
    );
  }

  late final router = GoRouter(
    navigatorKey: key,
    routes: coreRoutes + $appRoutes,
    debugLogDiagnostics: kDebugMode,
    initialLocation: routerInitialLocation,
    refreshListenable: _loginInfo,
    redirect: (context, state) {
      final bool loggedIn =
          ((LocalStateCache().authToken.isNotEmpty ? true : false) &&
                  LocalStateCache().isVerificationOtp == true
              ? true
              : false);

      if ((state.matchedLocation == RoutePath.forgotpassword.path) &&
          !loggedIn) {
        return null;
      }
      if ((state.matchedLocation == RoutePath.signup.path) && !loggedIn) {
        return null;
      }
      final bool loggingIn = (state.matchedLocation == '/login') ||
          (state.matchedLocation == RoutePath.signup.path) ||
          (state.matchedLocation == RoutePath.forgotpassword.path);

      if (!_loginInfo.isLoggedIn && !loggedIn) {
        return '/login';
      }

      // if the user is logged in but still on the login page, send them to
      // the home page
      if (loggingIn && loggedIn) {
        return '/';
      }

      return null;
    },
  );
}
