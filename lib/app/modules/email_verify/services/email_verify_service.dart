import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:home_glam/app/core/url_launcher/gmail_launcher.dart';
import 'package:home_glam/app/modules/auth/models/user_info_model.dart';
import 'package:home_glam/app/modules/email_verify/controllers/email_verify_controller.dart';

import '../../../core/db/local_storage/auth_local_storage.dart';
import '../../../core/exceptions/app_exceptions.dart';

class EmailVerifyService extends GetxService {
  Future<void> sendVerification({required User user}) async {
    try {
      await user.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      log("Error Code ${e.code}");
      throw AuthException.fromFirebaseAuthException(e);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> checkVerification() async {
    Future.doWhile(() async {
      await FirebaseAuth.instance.currentUser!.reload();
      if (FirebaseAuth.instance.currentUser!.emailVerified) {
        Get.find<EmailVerifyController>().isVerified.value = true;
        return false;
      }
      return true;
    });
  }

  Future<void> storeVerification(value) async {
    final authStorage = Get.find<AuthLocalStorage>();

    try {
      await authStorage.storeVerification(value);
    } on AuthStorageException catch (e) {
      throw AuthStorageException.fromInvalidKeyException(e);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> registerUserToFireStore(UserInfoModel userInfo) async {
    try {} on FirebaseException catch (e) {
    } catch (e) {}
  }

  Future<void> openGmail() async => Get.find<GmailLauncher>().launchGmail();
}
