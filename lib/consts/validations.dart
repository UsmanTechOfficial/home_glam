import 'package:flutter/material.dart';

class GetValidation {
  static String? psdValidation(TextEditingController controller) {
    if (controller.text.isEmpty) {
      return 'Password is required';
    }

    return null;
  }

  static String? emailValidation(TextEditingController controller) {
    if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(controller.text)) {
      return 'Enter a valid email';
    }
    return null;
  }

  static String? validate(TextEditingController controller, String field) {
    if (controller.text.isEmpty) {
      return '$field is required';
    }

    return null;
  }
}
