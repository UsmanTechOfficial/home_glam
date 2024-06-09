import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/logger.dart';
import '../../../config/static_value.dart';
import '../../../core/db/local_storage/auth_local_storage.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxBool isLoading = false.obs;
  late AnimationController controller;
  late Animation<double> animation;

  @override
  Future<void> onInit() async {
    isLoading.value = true;
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..repeat();
    animation = Tween<double>(begin: 0, end: 1).animate(controller);
    controller.forward();
    animation.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        await getLocalUser();
        Get.offAndToNamed(Routes.LOGIN);
      }
    });

    super.onInit();
  }

  getLocalUser() async {
    try {
      final storedUser = await Get.find<AuthLocalStorage>().getUserInfo();
      final emailVerified = await getEmailVerification();
      Get.find<AuthLocalStorage>().storeVerification(emailVerified);
      StaticValue.localUser.value = storedUser;
      controller.stop();
      Logger.d(storedUser);
      Logger.d(emailVerified);
      return;
    } finally {}
  }

  Future<bool> getEmailVerification() async {
    await FirebaseAuth.instance.currentUser?.reload();
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.emailVerified;
    } else {
      return false;
    }
  }

  @override
  Future<void> onClose() async {
    controller.dispose();
    isLoading.value = false;
    super.onClose();
  }
}
