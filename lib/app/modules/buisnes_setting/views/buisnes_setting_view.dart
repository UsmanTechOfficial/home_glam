import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/buisnes_setting_controller.dart';

class BusinessSettingView extends GetView<BusinessSettingController> {
  const BusinessSettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BusinessSettingView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BusinessSettingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
