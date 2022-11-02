import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pitjarus_test/base/base.dart';

// class CustomButtonController {
//   final void Function(bool isLoading) onStateChange;
//   CustomButtonController({requiredwidget.onStateChange});
//   bool isLoading = false;
//   void startLoading() {
//     isLoading = true;
//     onStateChange(isLoading);
//   }

//   void stopLoading() {
//     isLoading = false;
//     onStateChange(isLoading);
//   }
// }

// ignore: must_be_immutable
class PrimaryButton extends StatefulWidget {
  final String text;
  // final CustomButtonController? controller;
  final FutureOr<void> Function() onPressed;
  final TextStyle? textStyle;
  final EdgeInsets? padding;
  final double elevation;
  final double? heightFactor;
  final double? widthFactor;
  late String loadingText;
  final double loadingIconSize;
  final EdgeInsets? margin;
  // final bool preventPressedOnLoading;
  final BorderRadius? borderRadius;
  final BorderSide? borderSide;
  final Widget? icon;
  final Color? backgroundColor;
  final bool showLoadingOnPressed;
  PrimaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
    //this.controller,
    this.padding,
    this.heightFactor,
    this.widthFactor,
    this.textStyle,
    this.elevation = 3.0,
    this.showLoadingOnPressed = true,
    String? loadingText,
    this.loadingIconSize = 14.0,
    this.margin,
    //this.preventPressedOnLoading = true,
    this.borderRadius,
    this.borderSide,
    this.icon,
    this.backgroundColor,
  }) : super(key: key) {
    this.loadingText = loadingText ?? "Please wait...";
  }
  static TextStyle defaultTextStyle() => BaseFonts.primaryFont.copyWith(
      fontSize: 14.0, fontWeight: FontWeight.w700, color: Colors.white);
  @override
  PrimaryButtonState createState() => PrimaryButtonState();
}

class PrimaryButtonState extends State<PrimaryButton> {
  final ValueNotifier<bool> _isloading = ValueNotifier(false);

  // late CustomButtonController _buttonController;
  // @override
  // void initState() {
  //   super.initState();
  // _buttonController = CustomButtonController(onStateChange: (state) {
  //   _isloading.value = state;
  // });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: FractionallySizedBox(
        heightFactor: widget.heightFactor,
        widthFactor: widget.widthFactor,
        child: ElevatedButton(
          onPressed: () async {
            // if (_buttonController.isLoading &&widget.preventPressedOnLoading)
            //   return;
            //widget.onPressed(_buttonController);
            try {
              await press();
            } catch (e) {
              _isloading.value = false;
              rethrow;
            }
          },
          style: ElevatedButton.styleFrom(
            elevation: widget.elevation,
            backgroundColor: widget.backgroundColor ?? BaseColors.primaryBlue,
            shape: RoundedRectangleBorder(
              side: widget.borderSide ?? BorderSide.none,
              borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
            ),
          ),
          child: ValueListenableBuilder<bool>(
            valueListenable: _isloading,
            builder: (context, value, child) => Padding(
              padding: widget.padding ?? EdgeInsets.zero,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  value
                      ? Container(
                          margin: const EdgeInsets.only(right: 8.0),
                          height: widget.loadingIconSize,
                          width: widget.loadingIconSize,
                          child: const CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : Container(
                          child: widget.icon,
                        ),
                  if (widget.icon != null)
                    const SizedBox(
                      width: 10,
                    ),
                  Flexible(
                    child: Text(
                      value ? widget.loadingText : widget.text,
                      style:
                          widget.textStyle ?? PrimaryButton.defaultTextStyle(),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> press() async {
    if (widget.showLoadingOnPressed) _isloading.value = true;
    await widget.onPressed();
    _isloading.value = false;
  }
}
