import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pitjarus_test/modules/list_store/controller/store_list_controller.dart';
import 'package:pitjarus_test/modules/list_store/view/widget/item_list_store.dart';

class ListStoreLayout extends StatefulWidget {
  const ListStoreLayout({super.key});

  @override
  State<ListStoreLayout> createState() => _ListStoreLayoutState();
}

class _ListStoreLayoutState extends State<ListStoreLayout> {
  final ListStoreController _listStoreController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: _listStoreController.listOfStoreData.length,
        itemBuilder: (context, index) => ItemListStore(
          index: index,
        ),
      ),
    );
  }
}
