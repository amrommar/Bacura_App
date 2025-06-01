import 'package:bacura_app/core/localization/all_translation_keys.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/home/presentation/controller/home_provider.dart';
import 'package:bacura_app/feature/order_services/presentation/controller/order_services_provider.dart';
import 'package:bacura_app/feature/profile/presentation/controller/my_profile_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await ServiceInitializer().initializeSettings();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => MyProfileProvider(context)),
          ChangeNotifierProvider(create: (context) => HomeProvider(context)),
          ChangeNotifierProvider(create: (context) => LanguageProvider()),
          ChangeNotifierProvider(create: (context) => OrderServicesProvider()),
        ],
        child: const MyApp(),
      ),
    );
  });
  FlutterNativeSplash.remove();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    _checkInternetConnection();
  }

  void _checkInternetConnection() {
    InternetConnectionChecker.createInstance().onStatusChange.listen((status) {
      if (status == InternetConnectionStatus.disconnected) {
        _showNoInternetOverlay();
      } else {
        _removeNoInternetOverlay();
      }
    });
  }

  OverlayEntry? _overlayEntry;

  void _showNoInternetOverlay() {
    if (_overlayEntry != null) return;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 50,
        left: 20,
        right: 20,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.wifi_off, color: Colors.white),
                SizedBox(width: 10),
                Text(
                  tr(AppStrings.noInternetConnection),
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    _navigatorKey.currentState?.overlay?.insert(_overlayEntry!);
  }

  void _removeNoInternetOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [Locale(AppStrings.en), Locale(AppStrings.ar)],
        fallbackLocale: ServiceInitializer.locale,
        translations: LanguageTranslation(),
        locale: ServiceInitializer.locale,
        navigatorKey: _navigatorKey,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.getStartedRoute,
        theme: getAppTheme(),
      ),
    );
  }
}
