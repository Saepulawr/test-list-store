import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pitjarus_test/base/base.dart';
import 'package:pitjarus_test/modules/detail_store/view/widget/card_detail_store.dart';
import 'package:pitjarus_test/modules/list_store/controller/store_list_controller.dart';
import 'package:pitjarus_test/modules/list_store/model/list_store_model/store.dart';
import 'package:shimmer/shimmer.dart';

class DetailStorePage extends StatefulWidget {
  const DetailStorePage({required this.index, super.key});

  final int index;
  @override
  State<DetailStorePage> createState() => _DetailStorePageState();
}

class _DetailStorePageState extends State<DetailStorePage> {
  final ListStoreController _listStoreController = Get.find();
  late final Store data;
  @override
  void initState() {
    data = _listStoreController.listOfStoreData[widget.index];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: CachedNetworkImage(
              imageUrl: data.imageUrl,
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
              placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    color: Colors.white,
                  )),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Positioned.fill(top: 310, child: CardDetailStore(data: data))
        ],
      ),
      bottomNavigationBar: Container(
        height: 50,
        margin: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: FractionallySizedBox(
                heightFactor: 1,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: BaseColors.primaryRed),
                    onPressed: () {
                      _listStoreController.listOfStoreData[widget.index] =
                          _listStoreController.listOfStoreData[widget.index]
                              .copyWith(visited: true);
                      Get.back();
                    },
                    child: const Text("No Visit")),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
                child: FractionallySizedBox(
              heightFactor: 1,
              child: ElevatedButton(
                  onPressed: () {
                    _listStoreController.listOfStoreData[widget.index] =
                        _listStoreController.listOfStoreData[widget.index]
                            .copyWith(visited: true);
                    Get.back();
                  },
                  child: const Text("Visit")),
            ))
          ],
        ),
      ),
    );
  }
}
