import 'package:deezer_flutter/constants/constants.dart';
import 'package:flutter/material.dart';

import './screens.dart';

class NavScreen extends StatelessWidget {
  static const String id = '/';

  final _screens = <String, Widget>{
    IconsAsset.home: HomeScreen(),
    IconsAsset.search: SearchScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(),
    );
  }
}
