import 'package:flutter/material.dart';

import './screens.dart';

class NavScreen extends StatelessWidget {
  static const String id = '/';

  final List<Widget> _screens = const [
    HomeScreen(),
    SearchScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(),
    );
  }
}
