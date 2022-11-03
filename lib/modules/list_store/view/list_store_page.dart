import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pitjarus_test/base/base.dart';
import 'package:pitjarus_test/base/widgets/third_party/button.dart';
import 'package:pitjarus_test/modules/list_store/view/layout/list_store_layout.dart';
import 'package:pitjarus_test/modules/login/controller/login_controller.dart';

class ListStorePage extends StatefulWidget {
  const ListStorePage({super.key});

  @override
  State<ListStorePage> createState() => _ListStorePageState();
}

class _ListStorePageState extends State<ListStorePage> {
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
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            color: Colors.blue,
          ),
          const Expanded(child: ListStoreLayout())
        ],
      ),
    );
  }
}
