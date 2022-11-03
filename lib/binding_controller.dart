import 'package:get/get.dart';
import 'package:pitjarus_test/modules/list_store/controller/store_list_controller.dart';

import 'modules/login/controller/login_controller.dart';

class BindingControllers implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => ListStoreController(), fenix: true);
  }
}
