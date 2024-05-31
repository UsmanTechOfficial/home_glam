import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_glam/app/modules/onboarding/views/page_builder.dart';
import 'package:home_glam/consts/text_size.dart';
import 'package:home_glam/generated/locales.g.dart';

import '../../../../consts/global_var.dart';
import '../../../../shared_widget/text/apptext.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: mHeight(context) * 0.9,
            child: PageView(
              scrollBehavior: const MaterialScrollBehavior(),
              physics: const ClampingScrollPhysics(),
              onPageChanged: (int page) {
                controller.onPageSwipe(page);
              },
              children: [
                PageBuilder(
                    LocaleKeys.on_boarding_1_title.tr,
                    LocaleKeys.on_boarding_1_desc.tr,
                    Image.asset("assets/images/img.png", fit: BoxFit.fill)),
                PageBuilder(
                    LocaleKeys.on_boarding_2_title.tr,
                    LocaleKeys.on_boarding_2_desc.tr,
                    Image.asset("assets/images/img.png", fit: BoxFit.fill)),
                PageBuilder(
                    LocaleKeys.on_boarding_3_title.tr,
                    LocaleKeys.on_boarding_3_desc.tr,
                    Image.asset("assets/images/img.png", fit: BoxFit.fill)),
              ],
            ),
          ),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => Container(
                  height: 8,
                  width: controller.currentPage.value == index ? 25 : 8,
                  decoration: BoxDecoration(
                      color: controller.currentPage.value == index
                          ? colorScheme(context).primary
                          : colorScheme(context).outlineVariant,
                      borderRadius: BorderRadius.circular(50)),
                ).paddingAll(4),
              ),
            ),
          ),
          const Spacer(),
          Obx(() => controller.currentPage.value.isEqual(2)
              ? Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: mWidth(context) * .05,
                      bottom: mHeight(context) * 0.01,
                    ),
                    child: ElevatedButton(
                        onPressed: () {
                          controller.getStart();
                        },
                        child: CText(
                          txt: LocaleKeys.on_boarding_btn.tr,
                          size: AppTextSize.labelMediumFont,
                        )),
                  ))
              : const SizedBox())
        ],
      ),
    );
  }
}
