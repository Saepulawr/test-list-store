import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../themes/base_colors.dart';
import '../themes/base_fonts.dart';

AppBar baseAppbar({
  String? title,
  TextStyle? titleStyle,
  Alignment titleAligment = Alignment.centerLeft,
  String? subtitle,
  Widget? leading,
  double elevation = 0,
  List<Widget>? actions,
}) =>
    AppBar(
      elevation: elevation,
      backgroundColor: BaseColors.primaryWhite,
      foregroundColor: BaseColors.primaryBlack,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
      leading: leading ??
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: BaseColors.primaryBlack,
            ),
          ),
      actions: actions,
      bottom: title == null && subtitle == null
          ? null
          : PreferredSize(
              preferredSize:
                  Size.fromHeight((30 + (subtitle != null ? 20 : 0))),
              child: Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, bottom: 12),
                child: Align(
                  alignment: titleAligment,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (title != null)
                        Text(
                          title,
                          style: titleStyle ??
                              BaseFonts.h1
                                  .copyWith(color: BaseColors.primaryBlack),
                        ),
                      if (subtitle != null)
                        Text(
                          subtitle,
                          style: BaseFonts.h4,
                        )
                    ],
                  ),
                ),
              )),
    );
