import 'package:deezer_flutter/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: _theme.scaffoldBackgroundColor,
        toolbarHeight: 80.0,
        title: SvgPicture.asset(
          IconsAsset.deezer,
          width: 150.0,
        ),
      ),
      body: Container(),
    );
  }
}
