import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pitjarus_test/base/themes/base_colors.dart';
import 'package:pitjarus_test/base/themes/base_fonts.dart';
import 'package:cool_alert/cool_alert.dart';

class BaseDialog {
  BaseDialog._();
  static bool _isShowing = false;
  static Timer? _timerTimeout;
  static Future<T?> showSuccess<T>({
    T? Function()? onDismiss,
    String? title,
    String? message,
  }) async {
    return await CoolAlert.show(
      context: Get.context!,
      type: CoolAlertType.success,
      title: title,
      text: message,
      onConfirmBtnTap: onDismiss,
    );
  }

  static Future<T?> showError<T>({
    T? Function()? onDismiss,
    String? title,
    String? message,
  }) async {
    return await CoolAlert.show(
      context: Get.context!,
      type: CoolAlertType.error,
      title: title,
      text: message,
      onConfirmBtnTap: onDismiss,
    );
  }

  static Future<bool> showConfirm({
    String? title,
    String? message,
    String? buttonOKText,
    String? buttonCancelText,
  }) async {
    assert(title != null || message != null, "Title and Message cannot null");
    return await CoolAlert.show(
      context: Get.context!,
      type: CoolAlertType.confirm,
      title: title,
      text: message,
      confirmBtnText: buttonOKText ?? "OK",
      onConfirmBtnTap: () => Get.back(result: true),
      cancelBtnText: buttonCancelText ?? "Cancel",
      onCancelBtnTap: () => Get.back(result: false),
    );
    final res = await _show<bool?>(
        title: title,
        message: message,
        borderRadius: BorderRadius.circular(10),
        actions: [
          TextButton(
              onPressed: () {
                Get.back(result: true);
              },
              child: Text(
                buttonOKText ?? "OK".tr,
                style: BaseFonts.h4
                    .copyWith(color: BaseColors.thirdBlack.withOpacity(0.5)),
              )),
          TextButton(
              onPressed: () {
                Get.back(result: false);
              },
              child: Text(
                buttonCancelText ?? "Cancel".tr,
                style: BaseFonts.h4
                    .copyWith(color: BaseColors.thirdBlack.withOpacity(0.5)),
              )),
          const SizedBox(width: 8)
        ]);
    return res ?? false;
  }

  static void hide() {
    if (_isShowing) {
      _isShowing = false;
      _timerTimeout?.cancel();
      Get.back();
    }
  }

  static Future<void> showLoading({
    Duration? timeout = const Duration(seconds: 30),
    void Function()? onTimeout,
    String message = "Loading...",
  }) async {
    if (timeout != null) {
      _timerTimeout = Timer(timeout, () {
        hide();
        onTimeout?.call();
      });
    }
    await CoolAlert.show(
      context: Get.context!,
      type: CoolAlertType.loading,
      text: message,
    );
    // await _show(
    //   barrierDismissible: false,
    //   icon: const SizedBox(
    //     height: 30,
    //     child: Center(
    //       child: SizedBox(
    //         height: 30,
    //         width: 30,
    //         child: CircularProgressIndicator(),
    //       ),
    //     ),
    //   ),
    //   title: message,
    // );
    _timerTimeout?.cancel();
  }

  static Future<T?> _show<T>({
    T? Function()? onDismiss,
    bool barrierDismissible = true,
    Widget? icon,
    String? title,
    String? message,
    List<Widget>? actions,
    BorderRadiusGeometry? borderRadius,
  }) async {
    if (!_isShowing) {
      _isShowing = true;
      final res = await showDialog(
        barrierDismissible: barrierDismissible,
        context: Get.context!,
        barrierColor: const Color(0xffD9D9D9).withOpacity(0.5),
        builder: (context) => AlertDialog(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(40),
          ),
          icon: icon,
          title: title != null
              ? Text(
                  title,
                  style: BaseFonts.h3Bold,
                )
              : null,
          contentPadding: const EdgeInsets.all(30),
          content: message != null
              ? Text(
                  message,
                  textAlign: TextAlign.center,
                  style: BaseFonts.h4SemiBold,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                )
              : null,
          actions: actions,
          actionsPadding: EdgeInsets.zero,
        ),
      );
      _isShowing = false;
      return onDismiss?.call() ?? res;
    }
    return null;
  }
}
