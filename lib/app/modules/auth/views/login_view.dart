import 'package:dartx/dartx.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_glam/app/config/static_value.dart';
import 'package:home_glam/app/modules/auth/controllers/login_controller.dart';
import 'package:home_glam/consts/global_var.dart';
import 'package:home_glam/consts/text_size.dart';
import 'package:home_glam/consts/validations.dart';
import 'package:home_glam/shared_widget/loading_overlay.dart';
import 'package:home_glam/shared_widget/text/apptext.dart';

import '../../../../shared_widget/button/elevated_btn.dart';
import '../../../../shared_widget/text/glam_title.dart';
import '../../../../shared_widget/text_form_field/label_textfield.dart';
import '../../../routes/app_pages.dart';

class LoginView extends GetView<LogInController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: controller.formKey,
        child: LoadingOverlay(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          isLoading: controller.isLoading,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: mHeight(context) * 0.05),
              const GlamTitle(
                top: "Welcome back to",
                centre: "Log in as a customer",
                last: " to buy our services",
              ),
              LabelTextField(
                label: "Email",
                hint: "example@gmail.com",
                controller: controller.emailController,
                focusNode: controller.emailFocus,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icons.email,
                autofillHints: const [AutofillHints.email],
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (value) => FocusScope.of(context)
                    .requestFocus(controller.passwordFocus),
                padTop: mHeight(context) * 0.02,
                validator: (p0) =>
                    GetValidation.emailValidation(controller.emailController),
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
              ),
              Obx(() {
                return LabelTextField(
                  label: "Password",
                  hint: "Enter password",
                  controller: controller.pswController,
                  focusNode: controller.passwordFocus,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  prefixIcon: Icons.lock,
                  autofillHints: const [AutofillHints.password],
                  maxLines: 1,
                  suffix: IconButton(
                      onPressed: () => controller.psdObsToggle(),
                      icon: controller.psdObs.value
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility)),
                  onFieldSubmitted: (value) => FocusScope.of(context).unfocus,
                  padTop: mHeight(context) * 0.02,
                  validator: (p0) =>
                      GetValidation.psdValidation(controller.pswController),
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                );
              }),

              TextElevatedBtn(
                  padTop: mHeight(context) * 0.05,
                  padBtm: mHeight(context) * 0.04,
                  title: "Login",
                  onPressed: () async {
                    if (controller.formKey.currentState!.validate()) {
                      controller.logIn(
                          email: controller.emailController.text.trim(),
                          password: controller.pswController.text.trim());
                    }
                  }),
              // CText(
              //     padTop: mHeight(context) * 0.02,
              //     padBtm: mHeight(context) * 0.04,
              //     txt: "or",
              //     size: AppTextSize.titleSmallFont,
              //     space: 2,
              //     weight: FontWeight.w600),

              Obx(() {
                if (StaticValue.localUser.value != null) {
                  return Column(
                    children: [
                      const SizedBox(
                          width: double.maxFinite,
                          child: CText(
                              txt: "Recent Account", align: TextAlign.start)),
                      const SizedBox(height: 5),
                      Card(
                        elevation: 4,
                        margin: EdgeInsets.zero,
                        child: ListTile(
                          selected: true,
                          leading: StaticValue
                                  .localUser.value!.profileUrl.isNotNullOrEmpty
                              ? const CircleAvatar()
                              : const Icon(Icons.account_circle, size: 35),
                          title: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: CText(
                                  txt: StaticValue.localUser.value!.email
                                      .toString(),
                                  overflow: TextOverflow.ellipsis,
                                  align: TextAlign.start,
                                ),
                              ),
                              if (StaticValue.isVerified.isTrue)
                                const Icon(Icons.verified_user)
                            ],
                          ),
                          trailing: PopupMenuButton<int>(
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry<int>>[
                              const PopupMenuItem<int>(
                                  value: 0, child: Text('Remove')),
                            ],
                            onSelected: (int result) {
                              switch (result) {
                                case 0:
                                  if (StaticValue.isVerified.isTrue) {
                                    controller.removeUser();
                                  } else if (StaticValue.isVerified.isFalse) {
                                    controller.deleteAccount();
                                  }
                                  break;
                                default:
                                  return;
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                }
                return const SizedBox();
              }),

              SizedBox(height: mHeight(context) * 0.03),

              const Spacer(),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(
                        letterSpacing: 1,
                        fontWeight: FontWeight.w500,
                        fontSize: AppTextSize.labelMediumFont,
                        color: colorScheme(context).onSurface,
                      ),
                    ),
                    TextSpan(
                      text: 'Register',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.toNamed(Routes.SIGNUP);
                        },
                      style: TextStyle(
                        letterSpacing: 1,
                        fontWeight: FontWeight.w500,
                        fontSize: AppTextSize.bodyLargeFont,
                        color: colorScheme(context).primary,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: mHeight(context) * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
