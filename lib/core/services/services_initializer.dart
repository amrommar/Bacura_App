import 'package:bacura_app/core/services/dependency_injection_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ServiceInitializer {
  ServiceInitializer._();

  static final ServiceInitializer instance = ServiceInitializer._();

  factory ServiceInitializer() => instance;
  static late Locale locale;

  initializeSettings() async {
    await initializeDependencyInjection();
  }

  initializeDependencyInjection() async {
    await DependencyInjectionServices().init();
  }

  initializeScreensOrientation() async {
    await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );
  }
}
