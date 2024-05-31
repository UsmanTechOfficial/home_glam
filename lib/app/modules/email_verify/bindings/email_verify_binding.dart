import 'package:get/get.dart';

import '../controllers/email_verify_controller.dart';
import '../repositories/email_verify_repository.dart';
import '../services/email_verify_service.dart';

class EmailVerifyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EmailVerifyController(Get.find<EmailVerifyRepository>()));

    Get.lazyPut<EmailVerifyRepository>(
        () => EmailVerifyRepository(Get.find<EmailVerifyService>()));

    // Get.lazyPut<EmailVerifyService>(() => EmailVerifyService());
    Get.putAsync<EmailVerifyService>(() async => EmailVerifyService());
  }
}
