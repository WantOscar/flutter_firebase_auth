import 'package:get/get.dart';

import '../service/auth_handler.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthHandler());
  }
}
