import 'package:flutter/material.dart';
import 'package:pitjarus_test/base/base.dart';

class CircularButtonIcon extends StatelessWidget {
  const CircularButtonIcon(
      {required this.onPressed,
      required this.icon,
      this.radius = 40,
      super.key});
  final void Function()? onPressed;
  final Widget icon;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: radius,
      width: radius,
      child: Material(
          type: MaterialType
              .transparency, //Makes it usable on any background color, thanks @IanSmith
          child: Ink(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 1.0),
              color: BaseColors.thirdBlue,
              shape: BoxShape.circle,
            ),
            child: InkWell(
              //This keeps the splash effect within the circle
              borderRadius: BorderRadius.circular(
                  radius), //Something large to ensure a circle
              onTap: onPressed,
              child: icon,
            ),
          )),
    );
  }
}
