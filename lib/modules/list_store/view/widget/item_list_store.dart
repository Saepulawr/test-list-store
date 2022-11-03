import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as gmap;
import 'package:latlong2/latlong.dart';
import 'package:pitjarus_test/base/base.dart';
import 'package:pitjarus_test/modules/detail_store/view/detail_store_page.dart';
import 'package:pitjarus_test/modules/list_store/controller/store_list_controller.dart';
import 'package:pitjarus_test/modules/list_store/model/list_store_model/store.dart';

class ItemListStore extends StatefulWidget {
  const ItemListStore({required this.index, super.key});
  final int index;
  @override
  State<ItemListStore> createState() => _ItemListStoreState();
}

class _ItemListStoreState extends State<ItemListStore> {
  final ListStoreController _listStoreController = Get.find();

  final Distance distance = const Distance();

  @override
  Widget build(BuildContext context) {
    final data = _listStoreController.listOfStoreData[widget.index];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Card(
        child: ListTile(
          onTap: () {
            Get.to(() => DetailStorePage(
                  index: widget.index,
                ));
          },
          isThreeLine: true,
          title: Text(data.storeName ?? "Belum ada nama"),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Address : ${data.address}"),
              Text(
                "${data.regionName}",
                style: const TextStyle(color: BaseColors.primaryMaroon),
              ),
            ],
          ),
          trailing: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Visibility(
                visible: data.visited,
                child: const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                children: [
                  const Icon(
                    Icons.place,
                    color: Colors.green,
                  ),
                  Obx(() => Text(
                      "${_getDistanceInKM(_listStoreController.currentPosition.value, data) ?? "-"} KM"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  double? _getDistanceInKM(gmap.LatLng? currentPosition, Store data) {
    print(currentPosition);
    // if (currentPosition != null &&
    //     data.latitude != null &&
    //     data.longitude != null) {
    final fromLoc = LatLng(
        _listStoreController.currentPosition.value?.latitude ?? 0,
        _listStoreController.currentPosition.value?.longitude ?? 0);
    return distance.as(LengthUnit.Kilometer, fromLoc,
        LatLng(data.latitude ?? 0, data.longitude ?? 0));
    // }
    // return null;
  }
}
