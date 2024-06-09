import 'package:get/get.dart';

import '../../../utils/logger.dart';
import '../../config/app_keys.dart';
import '../../config/static_value.dart';
import '../db/local_storage/auth_local_storage.dart';

class ValueListener extends GetxService {
  late AuthLocalStorage authLocalStorage;

  @override
  Future<void> onInit() async {
    authLocalStorage = Get.find<AuthLocalStorage>();
    listenUserInfo();
    listenUserVerification();
    super.onInit();
  }

  listenUserInfo() async {
    authLocalStorage.getStorage.listenKey(
      AppKeys.userInfoKey,
      (value) async {
        Logger.d("listenUserInfo");
        final localUser = await authLocalStorage.getUserInfo();
        if (localUser != null) {
          StaticValue.localUser.value = localUser;
        }
      },
    );
  }

  listenUserVerification() async {
    authLocalStorage.getStorage.listenKey(AppKeys.userVerifyKey, (value) async {
      Logger.d("listenUserVerification");
      final isVerified = await authLocalStorage.isUserVerified();
      StaticValue.isVerified.value = isVerified;
    });
  }
}
