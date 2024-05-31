import 'package:get/get.dart';

import '../controllers/buisnes_setting_controller.dart';

class BusinessSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BusinessSettingController>(
      () => BusinessSettingController(),
    );
  }
}
