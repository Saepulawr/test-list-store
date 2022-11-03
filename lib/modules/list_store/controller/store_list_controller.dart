import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pitjarus_test/base/base.dart';
import 'package:pitjarus_test/modules/list_store/model/list_store_model/store.dart';

class ListStoreController extends GetxController {
  RxList<Store> listOfStoreData = RxList([]);
  final Rx<LatLng?> currentPosition = Rx(null);
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
      if (kDebugMode) {
        print("Save success");
      }
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
      } catch (e, s) {
        if (kDebugMode) print(s);
      }
    }
    return stores;
  }
}
