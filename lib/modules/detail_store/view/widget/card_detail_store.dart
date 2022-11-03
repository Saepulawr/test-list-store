import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pitjarus_test/modules/detail_store/view/widget/circular_button.dart';
import 'package:pitjarus_test/modules/list_store/model/list_store_model/store.dart';

class CardDetailStore extends StatelessWidget {
  const CardDetailStore({required this.data, super.key});
  final Store data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Positioned.fill(
          top: 20,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.store,
                      color: Colors.amber,
                      size: 52,
                    ),
                    title: Text(data.storeName ?? "Belum ada nama"),
                    subtitle: Text(data.address ?? ""),
                  ),
                  _row(label: "Tipe Outlet", value: data.dcName ?? ""),
                  _row(label: "Tipe Display", value: data.channelName ?? ""),
                  _row(
                      label: "Sub Tipe Display",
                      value: data.subchannelName ?? ""),
                  _row(label: "ERTM", value: "Ya"),
                  _row(label: "Pareto", value: "Ya"),
                  _row(label: "E-merchandising", value: "Ya"),
                  const Expanded(child: SizedBox()),
                  ListTile(
                    minLeadingWidth: 0,
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.assignment,
                          color: Colors.amber,
                          size: 40,
                        ),
                      ],
                    ),
                    title: const Text(
                      "Last Visit",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      DateFormat("dd-mm-yyyy").format(DateTime.now()),
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(right: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircularButtonIcon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.navigation,
                      color: Colors.white,
                    )),
                const SizedBox(
                  width: 16,
                ),
                CircularButtonIcon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    )),
                const SizedBox(
                  width: 16,
                ),
                CircularButtonIcon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.gps_fixed,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _row({required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              label,
              style: const TextStyle(
                  color: Colors.grey, fontWeight: FontWeight.bold),
            ),
          ),
          const Text(
            ":   ",
            style: TextStyle(color: Colors.grey),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
