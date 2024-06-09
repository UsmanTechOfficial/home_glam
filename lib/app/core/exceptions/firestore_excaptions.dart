import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:home_glam/app/core/exceptions/app_exceptions.dart';

class CloudStorageException extends AppException {
  CloudStorageException({super.message, super.icon});

  factory CloudStorageException.fromFireStoreException(FirebaseException e) {
    switch (e.code) {
      case 'permission-denied':
        return CloudStorageException(message: "Permission denied.");
      case 'unavailable':
        return CloudStorageException(
            message: "FireStore service is unavailable.");
      case 'cancelled':
        return CloudStorageException(
            message: "FireStore operation was cancelled.", icon: Icons.cancel);
      case 'unknown':
        return CloudStorageException(message: "Unknown error.");
      default:
        return CloudStorageException(message: "An unknown error occurred.");
    }
  }
}
