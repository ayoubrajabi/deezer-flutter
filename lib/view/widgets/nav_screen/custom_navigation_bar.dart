import 'package:deezer_flutter/constants/constants.dart';
import 'package:deezer_flutter/logic/logics.dart';
import 'package:deezer_flutter/main.dart';
import 'package:deezer_flutter/view/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:beamer/beamer.dart';

import '../widgets.dart';

class CustomNavigationBar extends StatefulWidget {
  CustomNavigationBar({required this.beamerKey});

  final GlobalKey<BeamerState> beamerKey;

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  final Map<String, String> _navBarItems = {
    'Home': IconsAsset.home,
    'Search': IconsAsset.search,
  };

  late BeamerDelegate _beamerDelegate;
  int _currentIndex = 0;

  void _setStateListener() => setState(() {});

  @override
  void initState() {
    super.initState();
    _beamerDelegate = widget.beamerKey.currentState!.routerDelegate;
    _beamerDelegate.addListener(_setStateListener);
  }

  @override
  void dispose() {
    _beamerDelegate.removeListener(_setStateListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _currentIndex = _beamerDelegate.currentBeamLocation is HomeLocation ? 0 : 1;
    final _theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: _theme.cardColor,
        boxShadow: [
          BoxShadow(
            color: _theme.cardColor,
            blurRadius: 50.0,
            offset: const Offset(0, -10),
            spreadRadius: 20.0,
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: _currentIndex,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
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
          // context.read<ScreenChangeCubit>().screenChanegeIndex(index);
          _beamerDelegate.beamToNamed(
            index == 0 ? '/Home' : 'Search',
          );
          context
              .read<NavbarTooltipCubit>()
              .navBarTooltipChange(_navBarItems.keys.elementAt(index));
        },
      ),
    );
  }
}
