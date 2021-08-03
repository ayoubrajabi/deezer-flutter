import 'package:deezer_flutter/logic/logics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavItems extends StatelessWidget {
  const BottomNavItems({
    Key? key,
    @required this.icon,
    @required this.title,
  }) : super(key: key);

  final String? icon;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return BlocBuilder<NavbarTooltipCubit, NavbarTooltipState>(
      builder: (context, navState) => Column(
        children: [
          SvgPicture.asset(
            icon!,
            color: navState.tooltip == title
                ? _theme.bottomNavigationBarTheme.selectedItemColor
                : _theme.bottomNavigationBarTheme.unselectedItemColor,
          ),
          const SizedBox(
            height: 5.0,
          ),
          Visibility(
            visible: navState.tooltip == title,
            child: Container(
              height: 4.0,
              width: 4.0,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.white54,
                    blurRadius: 30.0,
                    spreadRadius: 10.0,
                    offset: Offset(0, 5.0),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
