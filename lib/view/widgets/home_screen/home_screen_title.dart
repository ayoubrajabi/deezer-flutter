import 'package:flutter/material.dart';

class HomeScreenItemsTitle extends StatelessWidget {
  const HomeScreenItemsTitle({
    Key? key,
    @required this.title,
  }) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 35.0, bottom: 10.0),
      child: Text(
        title!,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
    );
  }
}
