import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:home_glam/app/config/static_value.dart';
import 'package:home_glam/app/modules/auth/models/user_info_model.dart';

import '../../../core/db/local_storage/auth_local_storage.dart';
import '../../../core/exceptions/app_exceptions.dart';
import '../../../core/exceptions/auth_excaption.dart';
import '../../../core/url_launcher/gmail_launcher.dart';

class AuthService extends GetxService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User?> signUp(
      {required String email, required String password}) async {
    try {
      ///
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw AuthException.fromFirebaseAuthException(e);
    } catch (e) {
      rethrow;
    }
  }

  Future<UserCredential> logIn(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw AuthException.fromFirebaseAuthException(e);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> storeUserInfo(
      {required UserInfoModel userInfo, required bool emailVerified}) async {
    final authStorage = Get.find<AuthLocalStorage>();

    try {
      await authStorage.storeUserInfo(userInfo: userInfo);
      await authStorage.storeVerification(emailVerified);
    } on AuthStorageException catch (e) {
      throw AuthStorageException.fromInvalidKeyException(e);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> removeLocalUser() async {
    try {
      final localAuth = Get.find<AuthLocalStorage>();
      localAuth.removeUser();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> clearStaticValue() async {
    StaticValue.localUser.value = null;
    StaticValue.isVerified.value = false;
  }

  Future<void> deleteAccount() async {
    try {
      Future.wait([
        removeLocalUser(),
        _firebaseAuth.currentUser!.delete(),
        clearStaticValue()
      ]);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> openGmail() async => Get.find<GmailLauncher>().launchGmail();
}
