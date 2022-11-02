import 'package:get/get.dart';
import 'package:pitjarus_test/modules/store_list/controller/store_list_controller.dart';

import 'modules/login/controller/login_controller.dart';

class BindingControllers implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => StoreListController(), fenix: true);
  }
}
