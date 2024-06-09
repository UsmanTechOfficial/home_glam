import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:home_glam/app/config/app_keys.dart';
import 'package:home_glam/app/modules/auth/models/user_info_model.dart';

class AuthLocalStorage extends GetxService {
  late GetStorage getStorage;

  /// [onInit] initialize GetStorage
  @override
  Future<void> onInit() async {
    getStorage = GetStorage();
    super.onInit();
  }

  Future<void> storeVerification(bool value) async {
    try {
      await getStorage.write(AppKeys.userVerifyKey, value);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> storeUserInfo({required UserInfoModel userInfo}) async {
    try {
      await getStorage.write(
          AppKeys.userInfoKey,
          userInfo
              .copyWith(
                  name: userInfo.name ?? '',
                  email: userInfo.email ?? '',
                  phoneNumber: userInfo.phoneNumber ?? '',
                  country: userInfo.country ?? '',
                  location: userInfo.location ?? '',
                  profileUrl: userInfo.profileUrl ?? '')
              .toMap());
    } catch (e) {
      rethrow;
    }
  }

  Future<UserInfoModel?> getUserInfo() async {
    try {
      final userInfo = await getStorage.read(AppKeys.userInfoKey);
      return UserInfoModel.fromMap(userInfo);
    } catch (e) {
      return null;
    }
  }

  Future<void> updateUserEmail(String email) async {
    try {
      UserInfoModel? currentUserInfo = await getUserInfo();
      if (currentUserInfo != null) {
        UserInfoModel updatedUserInfo = currentUserInfo.copyWith(email: email);
        await storeUserInfo(userInfo: updatedUserInfo);
      }
    } catch (e) {
      rethrow;
    }
  }

  // Future<void> updateUserName(String name) async {
  //   try {
  //     UserInfoModel currentUserInfo = await getUserInfo();
  //     UserInfoModel updatedUserInfo = currentUserInfo.copyWith(name: name);
  //     await storeUserInfo(userInfo: updatedUserInfo);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // Future<void> updateUserPhone(String phone) async {
  //   try {
  //     UserInfoModel currentUserInfo = await getUserInfo();
  //     UserInfoModel updatedUserInfo =
  //         currentUserInfo.copyWith(phoneNumber: phone);
  //     await storeUserInfo(userInfo: updatedUserInfo);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // Future<void> updateProfileUrl(String url) async {
  //   try {
  //     UserInfoModel currentUserInfo = await getUserInfo();
  //     UserInfoModel updatedUserInfo = currentUserInfo.copyWith(profileUrl: url);
  //     await storeUserInfo(userInfo: updatedUserInfo);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // Future<void> updateUserCountry(String country) async {
  //   try {
  //     UserInfoModel currentUserInfo = await getUserInfo();
  //     UserInfoModel updatedUserInfo =
  //         currentUserInfo.copyWith(country: country);
  //     await storeUserInfo(userInfo: updatedUserInfo);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // Future<void> updateUserLocation(String location) async {
  //   try {
  //     UserInfoModel currentUserInfo = await getUserInfo();
  //     UserInfoModel updatedUserInfo =
  //         currentUserInfo.copyWith(location: location);
  //     await storeUserInfo(userInfo: updatedUserInfo);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future<void> removeUser() async {
    try {
      Future.wait([
        getStorage.remove(AppKeys.userInfoKey),
        getStorage.remove(AppKeys.userVerifyKey)
      ]);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> isUserVerified() async {
    try {
      var result = getStorage.read(AppKeys.userVerifyKey);
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
