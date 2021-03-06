import 'package:beamer/beamer.dart';
import 'package:deezer_flutter/constants/constants.dart';
import 'package:deezer_flutter/logic/logics.dart';
import 'package:deezer_flutter/view/config/home_location.dart';
import 'package:deezer_flutter/view/screens/home_screen.dart';
import 'package:deezer_flutter/view/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({required this.beamerKey});

  final GlobalKey<BeamerState>? beamerKey;

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
    _beamerDelegate = widget.beamerKey!.currentState!.routerDelegate;
    _beamerDelegate.addListener(_setStateListener);
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    _currentIndex = _beamerDelegate.currentBeamLocation is HomeLocation ? 0 : 1;

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
          _beamerDelegate.beamToNamed(
            index == 0 ? HomeScreen.path : SearchScreen.path,
          );
          context
              .read<NavbarTooltipCubit>()
              .navBarTooltipChange(_navBarItems.keys.elementAt(index));
        },
      ),
    );
  }

  @override
  void dispose() {
    _beamerDelegate.removeListener(_setStateListener);
    super.dispose();
  }
}
