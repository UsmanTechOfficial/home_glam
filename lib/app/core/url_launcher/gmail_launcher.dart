import 'dart:io';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/custom_snackbar.dart';

class GmailLauncher extends GetxService {
  Future<void> launchGmail() async {
    Uri uri = Uri.parse("");
    try {
      if (Platform.isAndroid) {
        uri = Uri.parse("https://gmail.app.goo.gl/");
      } else {
        uri = Uri.parse("https://mail.google.com/mail/u/0/#inbox");
      }
      launchUrl(uri);
    } catch (e) {
      CSnackBar.show("Gmail not found");
    }
  }
}
