import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:home_glam/app/config/app_keys.dart';
import 'package:home_glam/app/modules/auth/models/user_info_model.dart';

class AuthLocalStorage extends GetxService {
  late GetStorage _getStorage;

  /// [onInit] initialize GetStorage
  @override
  void onInit() async {
    await GetStorage.init("AuthLocalStorage");
    _getStorage = GetStorage();
    print("getStorage Init");
    super.onInit();
  }

  Future<void> storeVerification(bool value) async {
    try {
      await _getStorage.write(AppKeys.userVerification, value);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> storeUserInfo({required UserInfoModel userInfo}) async {
    try {
      await _getStorage.write(AppKeys.userInfo, userInfo.toMap());
    } catch (e) {
      rethrow;
    }
  }

  Future<UserInfoModel> getUserInfo() async {
    try {
      final userInfo = await _getStorage.read(AppKeys.userInfo);
      return UserInfoModel.fromMap(userInfo);
    } catch (e) {
      print(e.toString());
      return const UserInfoModel();
    }
  }

  Future<bool?> isUserVerified() async {
    try {
      var result = _getStorage.read(AppKeys.userVerification);

      if (result != null) {
        return result;
      } else {
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }
}
