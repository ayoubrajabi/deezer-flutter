import 'package:deezer_flutter/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeScreenAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return AppBar(
      elevation: 0.0,
      backgroundColor: _theme.scaffoldBackgroundColor,
      title: SvgPicture.asset(
        IconsAsset.deezer,
        width: 130.0,
      ),
      flexibleSpace: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: _theme.scaffoldBackgroundColor,
              blurRadius: 50.0,
              offset: Offset(0, 10),
              spreadRadius: 10.0,
            ),
          ],
          border: Border(
            bottom: BorderSide(
              color: Colors.white10,
              width: 1.0,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 70.0);
}
