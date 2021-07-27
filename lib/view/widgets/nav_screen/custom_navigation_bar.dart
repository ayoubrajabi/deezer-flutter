import 'package:deezer_flutter/constants/constants.dart';
import 'package:deezer_flutter/logic/logics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets.dart';

class CustomNavigationBar extends StatelessWidget {
  final Map<String, String> _navBarItems = {
    'Home': IconsAsset.home,
    'Search': IconsAsset.search,
  };

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return BlocBuilder<ScreenChangeCubit, ScreenChangeState>(
      builder: (context, screenChangeState) {
        return BottomNavigationBar(
          elevation: 0.0,
          backgroundColor: _theme.scaffoldBackgroundColor,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          currentIndex: screenChangeState.index,
          selectedFontSize: 11.0,
          unselectedFontSize: 11.0,
          showUnselectedLabels: false,
          items: _navBarItems
              .map(
                (title, icon) => MapEntry(
                  title,
                  BottomNavigationBarItem(
                    icon: BottomNavItems(
                      icon: icon,
                      title: title,
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
