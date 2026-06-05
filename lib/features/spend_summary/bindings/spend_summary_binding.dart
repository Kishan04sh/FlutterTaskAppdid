import 'package:get/get.dart';

import '../controller/spend_summary_controller.dart';

class SpendSummaryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpendSummaryController>(() => SpendSummaryController(),
    );
  }
}