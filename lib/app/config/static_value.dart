import 'package:get/get.dart';
import 'package:home_glam/app/modules/auth/models/user_info_model.dart';

class StaticValue {
  static Rxn<UserInfoModel> localUser = Rxn<UserInfoModel>(null);
  static RxBool isVerified = false.obs;
}
