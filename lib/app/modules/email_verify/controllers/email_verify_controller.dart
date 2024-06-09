import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:home_glam/app/modules/email_verify/repositories/email_verify_repository.dart';

class EmailVerifyController extends GetxController {
  final EmailVerifyRepository _emailVerifyRepository;
  EmailVerifyController(this._emailVerifyRepository);
  RxBool isVerified = false.obs;

  User? user = Get.arguments;

  Future<void> startVerification() async {
    try {
      await _emailVerifyRepository.sendVerification(user: user!);
      await _emailVerifyRepository.checkVerification();

      ever(isVerified, (value) async {
        if (value == true) {
          final result = await _emailVerifyRepository.storeVerification(value);
          if (result) await _registerUserToFireStore();
        }
      });
    } finally {}
  }

  _registerUserToFireStore() async {
    try {
      _emailVerifyRepository.registerUserToFireStore();
      return;
    } finally {}
  }
}

// isVerified.listen(
//   (value) async {
//     if (value == true) {
//       await _emailVerifyRepository.storeVerification(value);
//
//       Get.offAllNamed(Routes.ONBOARDING);
//     }
//   },
// );
