library base;

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'tools/base_storage.dart';
//apis
export 'apis/base_api.dart';
export 'apis/models/api_result.dart';
export 'apis/models/api_error.dart';

//controllers
export 'controllers/base_controller.dart';

//themes
export 'themes/base_colors.dart';
export 'themes/base_fonts.dart';
export 'themes/base_shadows.dart';
export 'themes/base_themes.dart';

//tools
export 'tools/base_storage.dart';
export 'tools/base_string_tools.dart';

//widgets
export 'widgets/base_app_bar.dart';
export 'widgets/base_avatar_image.dart';
export 'widgets/base_button.dart';
export 'widgets/base_checkbox.dart';
export 'widgets/base_circular_image.dart';
export 'widgets/base_dialog.dart';
export 'widgets/base_text_field.dart';

//widgets third party
export 'package:getwidget/getwidget.dart';
export 'widgets/third_party/autoscale_tabbarview-1.0.2/lib/autoscale_tabbarview.dart';

class Base {
  Base._();

  static Future<void> init() async {
    //init language
    final lang = jsonDecode(await DefaultAssetBundle.of(Get.context!)
        .loadString("assets/language/language.json")) as Map<String, dynamic>;
    if (Get.deviceLocale != null) {
      for (String key in lang.keys) {
        Map<String, dynamic> rawData = lang[key];
        Get.addTranslations({
          key: rawData.map((key, value) => MapEntry(key, value.toString()))
        });
      }
      Get.updateLocale(Get.deviceLocale!);
    }
    await BaseStorage().init();
  }
}
