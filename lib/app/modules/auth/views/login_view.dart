import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      body: Form(
        key: controller.formKey,
        child: LoadingOverlay(
          isLoading: controller.isLoading,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 15),
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
                  );
                }),

                /// TODO implement click event on [LogIn] Button
                TextElevatedBtn(
                    padTop: mHeight(context) * 0.05,
                    title: "Login",
                    onPressed: () {
                      if (controller.formKey.currentState!.validate()) {
                        controller.logIn(
                            email: controller.emailController.text.trim(),
                            password: controller.pswController.text.trim());
                      }
                    }),
                CText(
                    padTop: mHeight(context) * 0.02,
                    padBtm: mHeight(context) * 0.02,
                    txt: "or",
                    size: AppTextSize.titleSmallFont,
                    space: 2,
                    weight: FontWeight.w600),

                ListTile(
                  selected: true,
                  leading: const CircleAvatar(),
                  title: const Text("example@gmail.com"),
                  trailing: IconButton(
                      onPressed: () async {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            // Return the content of the bottom sheet
                            return Container(
                              height: 200,
                              color: Colors.white,
                              child: Center(
                                child: Text(
                                  'This is a bottom sheet',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      icon: const Icon(Icons.more_horiz)),
                ),

                // Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: [
                //       Icon(Icons.ac_unit,
                //           color: colorScheme(context).onSurface, size: 30),
                //       Icon(Icons.ac_unit,
                //           color: colorScheme(context).onSurface, size: 30),
                //       Icon(Icons.ac_unit,
                //           color: colorScheme(context).onSurface, size: 30)
                //     ]),

                SizedBox(height: mHeight(context) * 0.03),

                /// TODO implement click event on [LogIn] text
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
                SizedBox(height: mHeight(context) * 0.01),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
