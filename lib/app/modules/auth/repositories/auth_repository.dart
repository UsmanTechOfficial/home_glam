import 'package:firebase_auth/firebase_auth.dart';
import 'package:home_glam/app/core/exceptions/app_exceptions.dart';
import 'package:home_glam/app/modules/auth/models/user_info_model.dart';

import '../../../../utils/custom_snackbar.dart';
import '../services/auth_service.dart';

class AuthRepository {
  final AuthService _authService;
  AuthRepository(this._authService);

  Future<User?> signUp(UserInfoModel userInfo, String password) async {
    try {
      return await _authService.signUp(
          email: userInfo.email!, password: password);
    } catch (e) {
      if (e is AuthException) {
        CSnackBar.show(e.message.toString(), icon: e.icon);
      } else {
        CSnackBar.show("Something went wrong");
      }
    }
    return null;
  }

  Future<User?> logIn(email, password) async {
    try {
      final userCredential =
          await _authService.logIn(email: email, password: password);
      if (userCredential.user != null) {
        return userCredential.user;
      }
    } catch (e) {
      if (e is AuthException) {
        CSnackBar.show(e.message.toString(), icon: e.icon);
      } else {
        CSnackBar.show("Something went wrong");
      }
    }
    return null;
  }

  Future<void> storeUserInfo(userInfo) async {
    try {
      _authService.storeUserInfo(userInfo);
    } catch (e) {
      if (e is AuthStorageException) {
        CSnackBar.show(e.message.toString());
      } else {
        CSnackBar.show("Error while store user ");
      }
    }
  }

  void openGmail() => _authService.openGmail();
}
