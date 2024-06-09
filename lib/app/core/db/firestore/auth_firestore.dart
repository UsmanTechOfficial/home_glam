import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:home_glam/app/config/app_constants.dart';
import 'package:home_glam/app/core/exceptions/request_timeout_exception.dart';
import 'package:home_glam/app/modules/auth/models/user_info_model.dart';

import '../../../config/app_url.dart';

class AuthFireStore extends GetxService {
  static final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<UserInfoModel?> getUser({required String email}) async {
    try {
      DocumentSnapshot snapshot = await _fireStore
          .collection(basePath)
          .doc(customerPath)
          .collection(users)
          .doc(email)
          .get()
          .timeout(AppConsts.timeout, onTimeout: () {
        throw RequestTimeoutException.fromTimeout();
      });

      if (snapshot.exists) {
        return UserInfoModel.fromMap(snapshot.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<int> registerUser({required UserInfoModel userModel}) async {
    try {
      await _fireStore
          .collection(basePath)
          .doc(customerPath)
          .collection(users)
          .doc(userModel.email)
          .set(userModel.toMap())
          .timeout(AppConsts.timeout, onTimeout: () {
        throw RequestTimeoutException.fromTimeout();
      });
      return 200;
    } catch (e) {
      rethrow;
    }
  }

  // Future<void> deleteUser({String? email}) async {
  //   try {
  //     _fireStore
  //         .collection(basePath)
  //         .doc(customerPath)
  //         .collection(users)
  //         .doc(email)
  //         .delete()
  //         .timeout(AppConsts.timeout, onTimeout: () {
  //       throw RequestTimeoutException.fromTimeout();
  //     });
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}

// class AuthFireStore extends GetxService {
//   final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
//
//   Future<int> registerUserToFireStore(
//       {required UserInfoModel userModel}) async {
//     try {
//       Logger.i("userJson ${userModel.toMap()}");
//
//       await _fireStore
//           .collection(AppUrl.user)
//           .doc(userModel.email)
//           .set(userModel.toMap());
//       return 200;
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
