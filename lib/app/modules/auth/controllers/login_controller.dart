import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_glam/utils/custom_snackbar.dart';

import '../../../routes/app_pages.dart';
import '../repositories/auth_repository.dart';

class LogInController extends GetxController {
  final AuthRepository _authRepository;
  LogInController(this._authRepository);

  /// FormKey for [TextFormField] validation
  final formKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;
  RxBool psdObs = false.obs;

  /// TextFormField [Controller]
  final emailController = TextEditingController();
  final pswController = TextEditingController();

  /// TextFormField [FocusNodes]
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();

  logIn({required String email, required String password}) async {
    try {
      onLoadingState();
      User? user = await _authRepository.logIn(email, password);
      if (user != null && !user.emailVerified) {
        CSnackBar.show("Email not verified");
        _authRepository.openGmail();
        Get.toNamed(Routes.EMAIL_VERIFY, arguments: user);
      }
    } finally {
      offLoadingState();
    }
  }

  removeUser() async {
    try {
      _authRepository.removeLocalUser();
    } finally {}
  }

  deleteAccount() async {
    try {
      _authRepository.deleteUserAccount();
    } finally {}
  }

  bool onLoadingState() {
    unFocus();
    return isLoading.value = true;
  }

  bool offLoadingState() => isLoading.value = false;

  void psdObsToggle() => psdObs.value = !psdObs.value;

  void unFocus() {
    emailFocus.unfocus();
    passwordFocus.unfocus();
  }

  @override
  onClose() {
    emailController.dispose();
    pswController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    super.onClose();
  }
}
