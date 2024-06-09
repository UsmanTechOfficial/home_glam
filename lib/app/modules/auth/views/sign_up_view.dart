import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_glam/app/modules/auth/controllers/signup_controller.dart';
import 'package:home_glam/app/modules/auth/models/user_info_model.dart';
import 'package:home_glam/shared_widget/loading_overlay.dart';

import '../../../../consts/global_var.dart';
import '../../../../consts/text_size.dart';
import '../../../../consts/validations.dart';
import '../../../../shared_widget/button/elevated_btn.dart';
import '../../../../shared_widget/text/apptext.dart';
import '../../../../shared_widget/text/glam_title.dart';
import '../../../../shared_widget/text_form_field/label_textfield.dart';
import '../../../routes/app_pages.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = mHeight(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                  SizedBox(height: height * 0.05),
                  const GlamTitle(
                    top: "Welcome to",
                    centre: "Sign up as a customer",
                    last: " to buy our services",
                  ),
                  LabelTextField(
                    label: "Name",
                    hint: "Enter your name",
                    controller: controller.nameController,
                    focusNode: controller.nameFocus,
                    keyboardType: TextInputType.name,
                    prefixIcon: Icons.person,
                    textCapitalization: TextCapitalization.words,
                    autofillHints: const [AutofillHints.name],
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (value) => FocusScope.of(context)
                        .requestFocus(controller.emailFocus),
                    padTop: mHeight(context) * 0.02,
                    validator: (p0) => GetValidation.validate(
                        controller.nameController, "Name"),
                  ),
                  LabelTextField(
                    label: "Email",
                    hint: "example@gmail.com",
                    controller: controller.emailController,
                    focusNode: controller.emailFocus,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icons.email,
                    textCapitalization: TextCapitalization.none,
                    autofillHints: const [AutofillHints.email],
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (value) => FocusScope.of(context)
                        .requestFocus(controller.passwordFocus),
                    padTop: mHeight(context) * 0.02,
                    validator: (p0) => GetValidation.emailValidation(
                        controller.emailController),
                  ),

                  Obx(() {
                    return LabelTextField(
                      label: "Password",
                      hint: "Enter password",
                      controller: controller.pswController,
                      focusNode: controller.passwordFocus,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
                      prefixIcon: Icons.lock,
                      autofillHints: const [AutofillHints.password],
                      padTop: mHeight(context) * 0.02,
                      maxLines: 1,
                      psdObs: controller.psdObs.value,
                      suffix: IconButton(
                          onPressed: () => controller.psdObsToggle(),
                          icon: controller.psdObs.value
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility)),
                      onFieldSubmitted: (value) => FocusScope.of(context)
                          .requestFocus(controller.phoneFocus),
                      validator: (p0) =>
                          GetValidation.psdValidation(controller.pswController),
                    );
                  }),
                  LabelTextField(
                    label: "Phone Number",
                    hint: "Enter Phone Number",
                    controller: controller.phoneController,
                    focusNode: controller.phoneFocus,
                    keyboardType: TextInputType.phone,
                    prefixIcon: Icons.phone,
                    autofillHints: const [AutofillHints.telephoneNumber],
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (value) => FocusScope.of(context).unfocus,
                    padTop: mHeight(context) * 0.02,
                    validator: (p0) => GetValidation.validate(
                        controller.phoneController, "Phone Number"),
                  ),

                  /// implement click event on [SignUp] Button
                  TextElevatedBtn(
                      padTop: mHeight(context) * 0.05,
                      title: "Sign Up",
                      onPressed: () {
                        // final gs = Get.find<AuthLocalStorage>();
                        // gs.getUserInfo();
                        if (controller.formKey.currentState!.validate()) {
                          final userInfo = UserInfoModel(
                            name: controller.nameController.text.trim(),
                            email: controller.emailController.text.trim(),
                            phoneNumber: controller.phoneController.text.trim(),
                          );
                          controller.signUp(
                            userInfo: userInfo,
                            password: controller.pswController.text.trim(),
                          );
                        }
                      }),
                  CText(
                      padTop: mHeight(context) * 0.01,
                      padBtm: mHeight(context) * 0.01,
                      txt: "or",
                      size: AppTextSize.titleSmallFont,
                      space: 2,
                      weight: FontWeight.w600),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.ac_unit,
                            color: colorScheme(context).onSurface, size: 30),
                        Icon(Icons.ac_unit,
                            color: colorScheme(context).onSurface, size: 30),
                        Icon(Icons.ac_unit,
                            color: colorScheme(context).onSurface, size: 30)
                      ]),

                  SizedBox(height: height * 0.03),

                  /// implement click event on [LogIn] text
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Already have an account? ',
                          style: TextStyle(
                            letterSpacing: 1,
                            fontWeight: FontWeight.w500,
                            fontSize: AppTextSize.labelMediumFont,
                            color: colorScheme(context).onSurface,
                          ),
                        ),
                        TextSpan(
                          text: 'Log In',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.toNamed(Routes.LOGIN);
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
                  SizedBox(height: height * 0.02),
                ],
              ),
            ),
          )),
    );
  }
}
