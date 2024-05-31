import 'package:get/get.dart';
import 'package:home_glam/app/core/url_launcher/gmail_launcher.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GmailLauncher());
  }
}
