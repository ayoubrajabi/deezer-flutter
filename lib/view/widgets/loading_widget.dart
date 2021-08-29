import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
    this.height,
    this.width,
    this.shape,
    this.icon,
    this.borderRadius,
    this.clipper,
    this.color,
  }) : super(key: key);

  final double? height;
  final double? width;
  final IconData? icon;
  final BoxShape? shape;
  final BorderRadius? borderRadius;
  final CustomPainter? clipper;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
      ),
      child: CustomPaint(
        painter: clipper,
        child: Center(
            child: Icon(
          icon,
          color: Colors.grey,
          size: 30.0,
        )),
      ),
    );
  }
}
