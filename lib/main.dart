import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/bindings/init_bindings.dart';
import 'app/routes/app_page.dart';
import 'app/routes/app_routes.dart';
import 'dart:async';
import 'app/theme/app_theme.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    debugPrint('Flutter Error: ${details.exception}');
    debugPrint(details.stack.toString());
  };

  runZonedGuarded(() {
      runApp(const MyApp());
    },(error, stackTrace) {
      debugPrint('Zone Error: $error');
      debugPrint(stackTrace.toString());
    },
  );
}

///=============================================

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Spent Summary App",
      initialBinding: InitBindings(),
      initialRoute: AppRoutes.splash,
      getPages: AppPage.routes,
      theme: AppTheme.lightTheme,
    );
  }
}

