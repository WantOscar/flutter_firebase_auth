import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_auth/src/view/home.dart';
import 'package:flutter_firebase_auth/src/view/login.dart';
import 'package:get/get.dart';

import '../constants/firebase_const.dart';

class AuthHandler extends GetxController {
  final Rx<User?> _user = auth.currentUser.obs;

  @override
  void onReady() {
    super.onReady();
    _user.value = auth.currentUser;
    _user.bindStream(auth.authStateChanges());
    ever(_user, moveToPage);
  }

  moveToPage(User? user) {
    if (user == null) {
      Get.off(() => const LoginView());
    } else {
      Get.off(() => const HomeView());
    }
  }
}
