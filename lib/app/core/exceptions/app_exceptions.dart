import 'package:flutter/material.dart';

class AppException implements Exception {
  final IconData? icon;
  final String? message;

  AppException({this.message, this.icon = Icons.error});
}

class AuthStorageException extends AppException {
  AuthStorageException({super.message, super.icon});

  factory AuthStorageException.fromInvalidKeyException(e) {
    return AuthStorageException(message: "Storage permission denied");
  }
}
