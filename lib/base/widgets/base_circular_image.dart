import 'package:flutter/material.dart';

class BaseCircleImage extends StatelessWidget {
  const BaseCircleImage({required this.radius, required this.image, Key? key})
      : super(key: key);
  final double radius;
  final ImageProvider<Object> image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: image,
        ),
      ),
    );
  }
}
