import 'package:deezer_flutter/constants/constants.dart';
import 'package:deezer_flutter/logic/logics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNavigationBar extends StatelessWidget {
  final Map<String, String> _navBarItems = {
    'Home': IconsAsset.home,
    'Search': IconsAsset.search,
  };

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Builder(
      builder: (context) {
        final _navState = context.watch<NavbarTooltipCubit>().state;
        final _screenChangeState = context.watch<ScreenChangeCubit>().state;

        return BottomNavigationBar(
          elevation: 0.0,
          backgroundColor: _theme.scaffoldBackgroundColor,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          currentIndex: _screenChangeState.index,
          selectedFontSize: 11.0,
          unselectedFontSize: 11.0,
          showUnselectedLabels: false,
          items: _navBarItems
              .map(
                (title, icon) => MapEntry(
                  title,
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: SvgPicture.asset(
                        icon,
                        color: _navState.tooltip == title
                            ? _theme.accentColor
                            : _theme.cardColor,
                      ),
                    ),
                    label: title,
                  ),
                ),
              )
              .values
              .toList(),
          onTap: (index) {
            context.read<ScreenChangeCubit>().screenChanegeIndex(index);
            context
                .read<NavbarTooltipCubit>()
                .navBarTooltipChange(_navBarItems.keys.elementAt(index));
          },
        );
      },
    );
  }
}
