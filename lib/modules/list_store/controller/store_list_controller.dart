import 'dart:convert';

import 'package:get/get.dart';
import 'package:pitjarus_test/base/base.dart';
import 'package:pitjarus_test/modules/list_store/model/list_store_model/store.dart';

class ListStoreController extends GetxController {
  RxList<Store> listOfStoreData = RxList([]);
  @override
  void onInit() {
    debounce(listOfStoreData, (_) {
      //save to local storage
      BaseStorage.instance.saveListString(
        key: "listOfStoreData",
        value: listOfStoreData
            .map((element) => jsonEncode(element.toJson()))
            .toList(),
      );
    }, time: 300.milliseconds);
    super.onInit();
  }

  List<Store> loadDataFromLocalStorage() {
    final res = BaseStorage.instance.loadListString(key: "listOfStoreData");
    List<Store> stores = [];
    for (final rawData in res) {
      Map<String, dynamic> json = {};
      try {
        json = jsonDecode(rawData);
        stores.add(Store.fromJson(json));
        // ignore: empty_catches
      } catch (e) {}
    }
    return stores;
  }
}
