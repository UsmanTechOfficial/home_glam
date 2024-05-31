import 'package:get/get.dart';
import 'package:home_glam/app/modules/auth/controllers/login_controller.dart';
import 'package:home_glam/app/modules/auth/controllers/signup_controller.dart';
import 'package:home_glam/app/modules/auth/repositories/auth_repository.dart';
import 'package:home_glam/app/modules/auth/services/auth_service.dart';

import '../../../core/db/local_storage/auth_local_storage.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LogInController(Get.find<AuthRepository>()));
    Get.lazyPut(() => SignUpController(Get.find<AuthRepository>()));

    Get.lazyPut<AuthRepository>(() => AuthRepository(Get.find<AuthService>()));
    Get.lazyPut<AuthService>(() => AuthService());
    // Get.lazyPut<AuthLocalStorage>(() => AuthLocalStorage());
    Get.putAsync(() async => AuthLocalStorage());
  }
}
