import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pitjarus_test/modules/list_store/controller/store_list_controller.dart';
import 'package:pitjarus_test/modules/list_store/view/list_store_page.dart';
import 'package:pitjarus_test/modules/login/view/login_page.dart';

import '../../../base/base.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with AfterLayoutMixin<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/splash_screen.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Splash screen nih",
              style: TextStyle(
                  fontSize: 32,
                  color: BaseColors.primaryBlue,
                  fontWeight: FontWeight.w600,
                  shadows: [
                    Shadow(
                        color: const Color(0xff363636).withOpacity(0.15),
                        offset: const Offset(0, 4))
                  ]),
            ),
            const SizedBox(
              height: 32,
            ),
            CircularProgressIndicator(
              color: BaseColors.secondWhite,
            )
          ],
        )),
      ),
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    //init base
    await Base.init();
    final ListStoreController listStoreController = Get.find();

    final stores = listStoreController.loadDataFromLocalStorage();
    if (stores.isEmpty) {
      Get.offAll(() => const LoginPage());
    } else {
      listStoreController.listOfStoreData.addAll(stores);
      Get.offAll(() => const ListStorePage());
    }
  }
}
