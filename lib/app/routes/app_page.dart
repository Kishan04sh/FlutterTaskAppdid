

import 'package:get/get.dart';
import 'package:spent_summary_app/app/routes/app_routes.dart';
import 'package:spent_summary_app/features/spend_summary/bindings/spend_summary_binding.dart';
import 'package:spent_summary_app/features/splash/bindings/splash_binding.dart';
import 'package:spent_summary_app/features/splash/view/splash_screen.dart';

import '../../features/spend_summary/view/spend_summary_view.dart';

class AppPage {

  static final routes = [
    //==========splash==========
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),

    //===========================
    GetPage(
        name: AppRoutes.spentSummary,
        page: ()=> const SpendSummaryView(),
        binding: SpendSummaryBinding()
    ),

  ];

}