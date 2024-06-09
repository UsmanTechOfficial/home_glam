import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:home_glam/app/core/exceptions/firestore_excaptions.dart';
import 'package:home_glam/app/core/url_launcher/gmail_launcher.dart';
import 'package:home_glam/app/modules/auth/models/user_info_model.dart';
import 'package:home_glam/app/modules/email_verify/controllers/email_verify_controller.dart';

import '../../../core/db/firestore/auth_firestore.dart';
import '../../../core/db/local_storage/auth_local_storage.dart';
import '../../../core/exceptions/app_exceptions.dart';
import '../../../core/exceptions/auth_excaption.dart';

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

  Future<int> registerUserToFireStore(UserInfoModel userInfo) async {
    try {
      final authFireStore = Get.find<AuthFireStore>();

      return await authFireStore.registerUser(userModel: userInfo);
    } on FirebaseException catch (e) {
      throw CloudStorageException.fromFireStoreException(e);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> openGmail() async => Get.find<GmailLauncher>().launchGmail();
}
