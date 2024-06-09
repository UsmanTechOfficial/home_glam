import 'package:flutter/material.dart';
import 'package:home_glam/app/core/exceptions/app_exceptions.dart';

class RequestTimeoutException extends AppException {
  RequestTimeoutException({super.message, super.icon});

  factory RequestTimeoutException.fromTimeout() {
    return RequestTimeoutException(
        message: "Request Timeout", icon: Icons.wifi_off);
  }
}
