import 'package:flutter/material.dart';

class CustomClip extends CustomClipper<Path> {
  double value;
  CustomClip(this.value);
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height / 3 + value);
    path.lineTo(size.width, size.height / 4 + value);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return oldClipper is CustomClip && value != oldClipper.value;
  }
}
