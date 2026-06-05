import 'dart:async';

import 'package:get/get.dart';

import '../../../app/routes/app_routes.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    // print("SplashController onInit");
    super.onInit();
    _navigateToHome();
  }

  void _navigateToHome() {
    // print("Timer Start");
    Timer(
      const Duration(seconds: 2),
          () {
        // print("Navigating...");
        Get.offAllNamed(
          AppRoutes.spentSummary,
        );
      },
    );
  }
}