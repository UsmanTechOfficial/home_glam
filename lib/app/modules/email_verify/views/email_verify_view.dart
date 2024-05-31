import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_glam/consts/global_var.dart';
import 'package:home_glam/consts/text_size.dart';
import 'package:home_glam/shared_widget/button/elevated_btn.dart';
import 'package:home_glam/shared_widget/text/apptext.dart';

import '../controllers/email_verify_controller.dart';

class EmailVerifyView extends GetView<EmailVerifyController> {
  const EmailVerifyView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const CText(txt: 'Verification'),
          centerTitle: true,
        ),
        body: Center(
            child: SizedBox(
                height: mHeight(context),
                width: mWidth(context) * 0.9,
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: mHeight(context) * 0.05),
                      CText(
                        padTop: mHeight(context) * 0.1,
                        txt: "Verify your email address",
                        size: AppTextSize.titleMediumFont,
                        weight: FontWeight.bold,
                      ),
                      const CText(
                        padTop: 20,
                        txt: "Please verify the email by clicking on link",
                        size: AppTextSize.labelMediumFont,
                      ),
                      TextElevatedBtn(
                        padTop: mHeight(context) * 0.1,
                        title: "send Verification Email ",
                        onPressed: () {
                          controller.startVerification();
                        },
                      ),
                    ]))));
  }
}
