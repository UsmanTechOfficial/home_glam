import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:home_glam/app/modules/auth/models/user_info_model.dart';

import '../../../core/db/local_storage/auth_local_storage.dart';
import '../../../core/exceptions/app_exceptions.dart';
import '../../../core/url_launcher/gmail_launcher.dart';

class AuthService extends GetxService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<User?> signUp(
      {required String email, required String password}) async {
    try {
      ///
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
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
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw AuthException.fromFirebaseAuthException(e);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> storeUserInfo(UserInfoModel userInfo) async {
    final authStorage = Get.find<AuthLocalStorage>();

    try {
      await authStorage.storeUserInfo(userInfo: userInfo);
    } on AuthStorageException catch (e) {
      throw AuthStorageException.fromInvalidKeyException(e);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> openGmail() async => Get.find<GmailLauncher>().launchGmail();
}
