import 'package:flutter/material.dart';

class TopArtistClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Paint paint = Paint();
    Path path = Path();

    // Path number 1

    paint.color = const Color(0xffC4C4C4);
    path = Path();
    path.lineTo(0, size.height / 2);
    path.cubicTo(
        0, size.height * 0.09, size.width * 0.09, 0, size.width / 2, 0);
    path.cubicTo(size.width * 0.91, 0, size.width, size.height * 0.09,
        size.width, size.height / 2);
    path.cubicTo(size.width, size.height * 0.91, size.width * 0.91, size.height,
        size.width / 2, size.height);
    path.cubicTo(size.width * 0.09, size.height, 0, size.height * 0.91, 0,
        size.height / 2);
    path.cubicTo(0, size.height / 2, 0, size.height / 2, 0, size.height / 2);

    return Path()..addPath(path, Offset.zero);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
