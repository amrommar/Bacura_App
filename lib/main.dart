import 'package:bacura_app/providers/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/app.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => AppConfigProvider(),
    child: MyApp(),
  ));
}
