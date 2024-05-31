import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AppException implements Exception {
  final IconData? icon;
  final String? message;

  AppException({this.message, this.icon = Icons.error});
}

class AuthException extends AppException {
  AuthException({super.message, super.icon});

  factory AuthException.fromFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      // Sign-Up Exceptions
      case 'email-already-in-use':
        return AuthException(
            message: "The email address is already in use.",
            icon: Icons.mark_email_read);
      case 'weak-password':
        return AuthException(
            message: "The password is too weak.",
            icon: Icons.no_encryption_gmailerrorred_rounded);
      case 'invalid-email':
        return AuthException(message: "The email address is not valid.");
      case 'operation-not-allowed':
        return AuthException(
            message: "Email/password accounts are not enabled.");
      case 'server-error':
        return AuthException(message: "Server error occurred.");
      case 'network-request-failed':
        return AuthException(
            message: "Network request failed.",
            icon: Icons.signal_wifi_bad_outlined);
      // Login Exceptions
      case 'user-not-found':
        return AuthException(message: "User not found.");
      case 'wrong-password':
        return AuthException(message: "Incorrect password.");
      case 'user-disabled':
        return AuthException(message: "User account is disabled.");
      // Email Verification Exceptions
      case 'invalid-action-code':
        return AuthException(message: "Invalid action code provided.");
      case 'expired-action-code':
        return AuthException(message: "Expired action code.");
      case 'invalid-credential':
        return AuthException(message: "Incorrect email/password.");
      default:
        print(e.code);
        return AuthException(message: "An unknown error occurred.");
    }
  }
}
// class AuthException extends AppException {
//   AuthException({super.message, super.icon});
//
//   factory AuthException.fromFirebaseAuthException(FirebaseAuthException e) {
//     switch (e.code) {
//       case 'email-already-in-use':
//         return AuthException(
//             message: "The email address is already in use.",
//             icon: Icons.mark_email_read);
//       case 'invalid-email':
//         return AuthException(message: "The email address is not valid.");
//       case 'operation-not-allowed':
//         return AuthException(
//             message: "Email/password accounts are not enabled.");
//       case 'weak-password':
//         return AuthException(
//             message: "The password is too weak.",
//             icon: Icons.no_encryption_gmailerrorred_rounded);
//       case 'network-request-failed':
//         return AuthException(
//             message: "Network request failed.",
//             icon: Icons.signal_wifi_bad_outlined);
//       case 'too-many-requests':
//         return AuthException(message: "Too Many Requests.");
//       case 'invalid-credential':
//         return AuthException(message: "Incorrect email/password.");
//       default:
//         print(e.code);
//         return AuthException(message: "An unknown error occurred.");
//     }
//   }
// }

class AuthStorageException extends AppException {
  AuthStorageException({super.message, super.icon});

  factory AuthStorageException.fromInvalidKeyException(e) {
    return AuthStorageException(message: "Storage permission denied");
  }
}
