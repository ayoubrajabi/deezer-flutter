import 'package:flutter/material.dart';

import '../widgets.dart';

class HeaderSliverAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      toolbarHeight: 60.0,
      pinned: true,
      floating: true,
      elevation: 0.0,
      title: const Text(
        'Search',
        style: TextStyle(
          color: Colors.white,
          fontSize: 26.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      bottom: HeaderBottom(),
    );
  }
}
