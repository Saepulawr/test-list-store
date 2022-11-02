import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class BaseAvatarImage extends StatelessWidget {
  const BaseAvatarImage(
      {Key? key,
      required this.radius,
      required this.image,
      this.shape = GFAvatarShape.circle})
      : super(key: key);
  final double radius;
  final ImageProvider<Object> image;
  final GFAvatarShape shape;
  @override
  Widget build(BuildContext context) {
    return GFAvatar(
      shape: shape,
      radius: radius,
      backgroundImage: image,
    );
  }
}
