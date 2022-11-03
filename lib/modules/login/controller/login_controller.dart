import 'package:get/get.dart';
import 'package:pitjarus_test/base/base.dart';
import 'package:pitjarus_test/modules/login/api/login_api.dart';
import 'package:pitjarus_test/modules/list_store/controller/store_list_controller.dart';
import 'package:pitjarus_test/modules/login/view/login_page.dart';

class LoginController extends GetxController {
  RxBool isLogingin = RxBool(false);
  Future<bool> login({
    required String username,
    required String password,
  }) async {
    isLogingin.value = true;
    final res = await LoginApi().login(username: username, password: password);
    isLogingin.value = false;
    //ini  ga akan sentuh error,karena response code dari server selalu 200
    if (res.isError) {
      //error
      BaseDialog.showError(
          title: "Error", message: res.response?.message ?? "Gagal login");
      return false;
    } else {
      final ListStoreController storeListController = Get.find();
      final datas = res.response?.stores ?? [];
      //error jika  status == failure
      if (res.response?.status == "failure") {
        BaseDialog.showError(
            title: "Error", message: res.response?.message ?? "Gagal login");
        return false;
      }
      storeListController.listOfStoreData.addAll(datas);
      return true;
    }
  }

  void logout() {
    final ListStoreController listStoreController = Get.find();
    listStoreController.listOfStoreData.clear();
    Get.offAll(() => const LoginPage());
  }
}
