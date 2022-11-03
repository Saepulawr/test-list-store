import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pitjarus_test/base/base.dart';
import 'package:pitjarus_test/modules/list_store/controller/store_list_controller.dart';

class ItemListStore extends StatelessWidget {
  ItemListStore({required this.index, super.key});
  final int index;
  final ListStoreController _listStoreController = Get.find();

  @override
  Widget build(BuildContext context) {
    final data = _listStoreController.listOfStoreData[index];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Card(
        child: ListTile(
          onTap: () {
            _listStoreController.listOfStoreData[index] =
                data.copyWith(visited: !data.visited);
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
                children: const [
                  Icon(
                    Icons.place,
                    color: Colors.green,
                  ),
                  Text("200 KM")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
