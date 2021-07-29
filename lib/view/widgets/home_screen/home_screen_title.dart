import 'package:flutter/material.dart';

class HomeScreenItemsTitle extends StatelessWidget {
  const HomeScreenItemsTitle({Key? key, @required this.title})
      : super(key: key);
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Text(
        title!,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
        ),
      ),
    );
  }
}
