import 'package:deezer_flutter/logic/logics.dart';
import 'package:deezer_flutter/view/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './screens.dart';

class NavScreen extends StatelessWidget {
  static const String id = '/';

  final _screens = const <Widget>[
    HomeScreen(),
    SearchScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: _theme.cardColor,
        statusBarIconBrightness: _theme.brightness,
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: _theme.scaffoldBackgroundColor,
          body: Builder(
            builder: (context) {
              final _screenChangeIndex =
                  context.watch<ScreenChangeCubit>().state.index;
              return _screens[_screenChangeIndex];
            },
          ),
          bottomNavigationBar: CustomNavigationBar(),
        ),
      ),
    );
  }
}
