import 'package:get/get.dart';
import 'package:home_glam/app/core/services/value_listener.dart';
import 'package:home_glam/app/core/url_launcher/gmail_launcher.dart';

import '../db/firestore/auth_firestore.dart';
import '../db/local_storage/auth_local_storage.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.putAsync(() async => AuthLocalStorage());
    Get.putAsync(() async => AuthFireStore());
    Get.putAsync(() async => ValueListener());
    Get.lazyPut(() => GmailLauncher());
  }
}
