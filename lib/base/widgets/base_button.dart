import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import '../themes/base_colors.dart';

// ignore: must_be_immutable
class BaseButton extends StatelessWidget {
  BaseButton({
    required this.onPressed,
    Key? key,
    this.height,
    this.width,
    this.color,
    this.label,
    this.child,
    this.icon,
    this.enabled = true,
    this.disabledColor,
    this.disabledTextColor,
  })  : assert(child != null || label != null),
        super(key: key);
  BaseButton.outline(
      {required this.onPressed,
      Key? key,
      this.height,
      this.width,
      this.color,
      this.label,
      this.child,
      this.icon,
      this.enabled = true,
      this.disabledColor,
      this.disabledTextColor})
      : assert(child != null || label != null),
        super(key: key) {
    _buttonType = GFButtonType.outline;
  }

  final double? height;
  final double? width;
  final Color? color;
  final String? label;
  final Widget? child;
  final void Function() onPressed;
  final Widget? icon;
  GFButtonType _buttonType = GFButtonType.solid;
  final bool enabled;
  final Color? disabledColor;
  final Color? disabledTextColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          maxWidth: width == null ? 275 : double.infinity,
          maxHeight: height == null ? 64 : double.infinity),
      height: height,
      width: width,
      child: FractionallySizedBox(
        heightFactor: 1,
        widthFactor: 1,
        child: GFButton(
          disabledColor: disabledColor ?? BaseColors.secondGrey,
          disabledTextColor: _getDisabledTextColor,
          onPressed: enabled
              ? () {
                  FocusScope.of(context).unfocus();
                  onPressed.call();
                }
              : null,
          color: color ?? BaseColors.secondBlue,
          shape: GFButtonShape.pills,
          type: _buttonType,
          icon: icon,
          child: child ??
              Text(
                label ?? "",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
        ),
      ),
    );
  }

  Color get _getDisabledTextColor {
    if (disabledColor == null) {
      if (_buttonType != GFButtonType.solid) {
        return BaseColors.secondGrey;
      } else {
        return BaseColors.primaryWhite;
      }
    } else {
      return disabledColor!;
    }
  }
}
