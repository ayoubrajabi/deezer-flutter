import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
    this.height,
    this.width,
    this.shape,
    this.icon,
    this.borderRadius,
  }) : super(key: key);
  final double? height;
  final double? width;
  final IconData? icon;
  final BoxShape? shape;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Container(
      height: height,
      width: width,
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: _theme.cardColor,
        shape: shape!,
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Center(
          child: Icon(
        icon,
        color: Colors.grey,
        size: 70.0,
      )),
    );
  }
}
