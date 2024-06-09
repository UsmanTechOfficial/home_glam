import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_glam/app/modules/auth/models/user_info_model.dart';

import '../../../routes/app_pages.dart';
import '../repositories/auth_repository.dart';

class SignUpController extends GetxController {
  final AuthRepository _authRepository;
  SignUpController(this._authRepository);

  /// FormKey for [TextFormField] validation
  final formKey = GlobalKey<FormState>();

  /// for loading state
  RxBool isLoading = false.obs;
  RxBool psdObs = false.obs;

  /// TextFormField [Controller]
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final pswController = TextEditingController();

  /// TextFormField [FocusNodes]
  final nameFocus = FocusNode();
  final emailFocus = FocusNode();
  final phoneFocus = FocusNode();
  final passwordFocus = FocusNode();

  Future<void> signUp({
    required UserInfoModel userInfo,
    required String password,
  }) async {
    try {
      onLoadingState();

      final User? user = await _authRepository.signUp(userInfo, password);
      if (user != null && !user.emailVerified) {
        await _authRepository.storeUserInfo(userInfo, user.emailVerified);
        Get.toNamed(Routes.EMAIL_VERIFY, arguments: user);
      }
    } finally {
      offLoadingState();
    }
  }

  /// change loading state
  onLoadingState() {
    unFocus();
    return isLoading.value = true;
  }

  offLoadingState() => isLoading.value = false;

  psdObsToggle() => psdObs.value = !psdObs.value;

  void unFocus() {
    nameFocus.unfocus();
    emailFocus.unfocus();
    phoneFocus.unfocus();
    passwordFocus.unfocus();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    pswController.dispose();
    nameFocus.dispose();
    emailFocus.dispose();
    phoneFocus.dispose();
    passwordFocus.dispose();
    super.onClose();
  }
}
