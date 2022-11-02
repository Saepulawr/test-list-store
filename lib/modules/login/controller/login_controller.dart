import 'package:get/get.dart';
import 'package:pitjarus_test/modules/login/api/login_api.dart';
import 'package:pitjarus_test/modules/store_list/controller/store_list_controller.dart';

class LoginController extends GetxController {
  RxBool isLogingin = RxBool(false);
  Future<bool> login({
    required String username,
    required String password,
  }) async {
    isLogingin.value = true;
    final res = await LoginApi().login(username: username, password: password);
    isLogingin.value = false;
    if (res.isError) {
      //error
      return false;
    } else {
      final StoreListController storeListController = Get.find();
      final datas = res.response?.stores ?? [];

      storeListController.listOfStoreData.addAll(datas);
      return true;
    }
  }
}
