import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:home_glam/app/modules/email_verify/services/email_verify_service.dart';

import '../../../../utils/custom_snackbar.dart';
import '../../../core/db/local_storage/auth_local_storage.dart';
import '../../../core/exceptions/app_exceptions.dart';

class EmailVerifyRepository {
  final EmailVerifyService _emailVerifyService;
  EmailVerifyRepository(this._emailVerifyService);
  Future<void> sendVerification({required User user}) async {
    try {
      await _emailVerifyService.sendVerification(user: user);
      _emailVerifyService.openGmail();
    } catch (e) {
      if (e is AuthException) {
        CSnackBar.show(e.message.toString(), icon: e.icon);
      } else if (e is AuthException) {
        CSnackBar.show(e.message.toString(), icon: e.icon);
      } else {
        CSnackBar.show("Something went wrong");
      }
    }
  }

  Future<void> checkVerification() async {
    try {
      _emailVerifyService.checkVerification();
    } catch (e) {
      CSnackBar.show("Verification Failed");
    }
  }

  Future<bool> storeVerification(value) async {
    try {
      await _emailVerifyService.storeVerification(value);
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<void> registerUserToFireStore() async {
    try {
      final authStorage = Get.find<AuthLocalStorage>();
      final userInfo = await authStorage.getUserInfo();
      final result =
          await _emailVerifyService.registerUserToFireStore(userInfo);

      // if (result) Get.offAllNamed(Routes.ONBOARDING);
    } catch (e) {
      CSnackBar.show("User registration failed");
    }
  }
}
