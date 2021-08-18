import 'package:flutter/material.dart';

class LoadingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();

    // Path number 1
    paint.color = Color(0xFF1C1420);
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
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
