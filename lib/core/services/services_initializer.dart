import 'package:bacura_app/core/utils/index.dart';

class ServiceInitializer {
  ServiceInitializer._();

  static final ServiceInitializer instance = ServiceInitializer._();

  factory ServiceInitializer() => instance;
  static late Locale locale;

  initializeSettings() async {
    await initializeDependencyInjection();
    locale = const Locale(AppStrings.ar);
  }

  initializeDependencyInjection() async {
    await DependencyInjectionServices().init();
  }

  initializeScreensOrientation() async {
    await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );
  }

  Future getSavedLocal() async {
    locale = await sl<BaseAppLocalizations>().getUserStoredLocale();
  }
}
