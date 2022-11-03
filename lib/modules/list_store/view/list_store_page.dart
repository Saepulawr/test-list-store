import 'dart:async';
import 'dart:math';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pitjarus_test/base/base.dart';
import 'package:pitjarus_test/base/tools/base_location_service.dart';
import 'package:pitjarus_test/base/widgets/base_map.dart';
import 'package:pitjarus_test/base/widgets/third_party/button.dart';
import 'package:pitjarus_test/modules/list_store/view/layout/list_store_layout.dart';
import 'package:pitjarus_test/modules/login/controller/login_controller.dart';

import '../controller/store_list_controller.dart';

class ListStorePage extends StatefulWidget {
  const ListStorePage({super.key});

  @override
  State<ListStorePage> createState() => _ListStorePageState();
}

class _ListStorePageState extends State<ListStorePage>
    with AfterLayoutMixin<ListStorePage> {
  final ListStoreController _listStoreController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Store"),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: PrimaryButton(
                elevation: 0,
                backgroundColor: BaseColors.primaryRed,
                text: "Logout",
                onPressed: () {
                  final LoginController loginController = Get.find();
                  loginController.logout();
                }),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Container(
            color: Colors.transparent,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: BaseTextField(
              hintText: "Cari Toko/Distributor",
              backgroundcolor: BaseColors.primaryWhite,
              prefixIcon: const Icon(
                Icons.search,
              ),
            ),
          ),
        ),
      ),
      body: Obx(
        () => Column(
          children: [
            Expanded(
                flex: 2,
                child: BaseMap(
                  markers: _listStoreController.listOfStoreData
                      .map(
                        (d) => Marker(
                            markerId: MarkerId(
                                Random.secure().nextDouble().toString()),
                            icon: BitmapDescriptor.defaultMarker,
                            position:
                                LatLng(d.latitude ?? 0, d.longitude ?? 0)),
                      )
                      .toList(),
                )),
            const Expanded(flex: 2, child: ListStoreLayout())
          ],
        ),
      ),
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    //init location service
    await BaseLocationService.init();
    //add listener location untuk update jarak
    BaseLocationService.location.onLocationChanged.listen((event) {
      _listStoreController.currentPosition.value =
          LatLng(event.latitude ?? 0, event.longitude ?? 0);
      print("location changed");
    });
  }
}
