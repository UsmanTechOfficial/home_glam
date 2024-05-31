import 'package:get/get.dart';

class OnboardingController extends GetxController {
  static get instance => Get.find<OnboardingController>();
  RxInt currentPage = 0.obs;

  onPageSwipe(int page) {
    currentPage.value = page;
  }

  final count = 0.obs;

  void getStart() {}
}

// PageController pageController = PageController();
// onPageChange() {
//   if (currentPage.value >= 2) {
//     Get.toNamed(Routes.LOGIN);
//   }
//   pageController.nextPage(
//       duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
// }
