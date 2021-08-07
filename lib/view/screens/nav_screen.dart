import 'package:deezer_flutter/logic/logics.dart';
import 'package:deezer_flutter/view/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './screens.dart';

class NavScreen extends StatelessWidget {
  static const String id = '/';

  final _screens = const <Widget>[
    HomeScreen(
      key: PageStorageKey('HomeScreen'),
    ),
    SearchScreen(),
  ];

  Widget? _screenOfApp(int screenIndex) {
    if (screenIndex == 0 || screenIndex == 1) {
      return _screens[screenIndex];
    }
    return _screens[0];
  }

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
          appBar: const HomeScreenAppBar(),
          body: BlocBuilder<ScreenChangeCubit, ScreenChangeState>(
            builder: (context, screenChangeIndex) =>
                _screenOfApp(screenChangeIndex.index)!,
          ),
          bottomNavigationBar: CustomNavigationBar(),
        ),
      ),
    );
  }
}
