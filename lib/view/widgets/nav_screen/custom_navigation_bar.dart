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
        return Container(
          decoration: BoxDecoration(
            color: _theme.cardColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
            ),
            boxShadow: [
              BoxShadow(
                color: _theme.scaffoldBackgroundColor,
                blurRadius: 50.0,
                offset: Offset(0, -10),
                spreadRadius: 20.0,
              ),
            ],
          ),
          child: BottomNavigationBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
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
          ),
        );
      },
    );
  }
}
