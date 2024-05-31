import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_glam/app/routes/app_pages.dart';
import 'package:home_glam/consts/color_const/gradients.dart';
import 'package:home_glam/consts/global_var.dart';
import 'package:home_glam/gen_assets/assets.gen.dart';
import 'package:home_glam/shared_widget/text/apptext.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  bool isLoading = false;
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation = Tween<double>(begin: 0, end: 1).animate(controller);
    controller.forward();
    animation.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        setState(() => isLoading = true);
        await Future.delayed(const Duration(microseconds: 500),
            () => Get.offAndToNamed(Routes.LOGIN));
      }
    });
  }

  @override
  dispose() {
    controller.dispose();
    isLoading = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = mHeight(context);
    double width = mWidth(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Container(
        alignment: Alignment.center,
        height: height,
        width: width,
        decoration: BoxDecoration(gradient: AppGradient.splashGradient),
        child: Stack(alignment: Alignment.center, children: [
          FadeTransition(
              opacity: animation,
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
          isLoading
              ? Positioned(
                  bottom: height * 0.1,
                  child: FadeTransition(
                      opacity: animation,
                      child: const CircularProgressIndicator()))
              : const SizedBox()
        ]),
      ),
    );
  }
}
