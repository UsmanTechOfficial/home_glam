import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/verify_o_t_p_controller.dart';

class VerifyOTPView extends GetView<VerifyOTPController> {
  const VerifyOTPView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VerifyOTPView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'VerifyOTPView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
