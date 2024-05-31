import 'package:get/get.dart';

import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/login_view.dart';
import '../modules/auth/views/sign_up_view.dart';
import '../modules/buisnes_setting/bindings/buisnes_setting_binding.dart';
import '../modules/buisnes_setting/views/buisnes_setting_view.dart';
import '../modules/email_verify/bindings/email_verify_binding.dart';
import '../modules/email_verify/views/email_verify_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/role/bindings/role_binding.dart';
import '../modules/role/views/role_view.dart';
import '../modules/verifyOTP/bindings/verify_o_t_p_binding.dart';
import '../modules/verifyOTP/views/verify_o_t_p_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ONBOARDING;

  static final routes = [
    GetPage(
      transitionDuration: const Duration(seconds: 1),
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.ROLE,
      page: () => const RoleView(),
      binding: RoleBinding(),
    ),
    GetPage(
      name: _Paths.VERIFY_O_T_P,
      page: () => const VerifyOTPView(),
      binding: VerifyOTPBinding(),
    ),
    GetPage(
      name: _Paths.Business_SETTING,
      page: () => const BusinessSettingView(),
      binding: BusinessSettingBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignUpView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.EMAIL_VERIFY,
      page: () => const EmailVerifyView(),
      binding: EmailVerifyBinding(),
    ),
  ];
}
