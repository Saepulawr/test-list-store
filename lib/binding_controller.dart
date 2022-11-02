import 'package:get/get.dart';

import 'modules/login/controller/login_controller.dart';

class BindingControllers implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(), fenix: true);
  }
}
