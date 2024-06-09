import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../consts/color_const/gradients.dart';
import '../../../../consts/global_var.dart';
import '../../../../gen_assets/assets.gen.dart';
import '../../../../shared_widget/text/apptext.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Container(
        alignment: Alignment.center,
        height: mHeight(context),
        width: mWidth(context),
        decoration: BoxDecoration(gradient: AppGradient.splashGradient),
        child: Stack(alignment: Alignment.center, children: [
          FadeTransition(
              opacity: controller.animation,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgGenImage(Assets.icons.icLogo.path)
                        .svg(fit: BoxFit.scaleDown),
                    CText(
                      txt: "Home Glam",
                      color: colorScheme(context).outline,
                    ),
                  ])),
          Obx(
            () {
              return controller.isLoading.isTrue
                  ? Positioned(
                      bottom: mHeight(context) * 0.1,
                      child: FadeTransition(
                          opacity: controller.animation,
                          child: const CircularProgressIndicator()))
                  : const SizedBox();
            },
          )
        ]),
      ),
    );
  }
}
