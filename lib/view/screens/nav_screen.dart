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

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: _theme.cardColor,
        statusBarIconBrightness: _theme.brightness,
      ),
      child: SafeArea(
        child: Stack(
          children: [
            Scaffold(
              appBar: const HomeScreenAppBar(),
              body: BlocBuilder<ScreenChangeCubit, ScreenChangeState>(
                builder: (context, screenChangeIndex) {
                  switch (screenChangeIndex.index) {
                    case 0:
                      return _screens[0];
                    case 1:
                      return _screens[1];
                    default:
                      return _screens[0];
                  }
                },
              ),
              bottomNavigationBar: CustomNavigationBar(),
            ),
          ],
        ),
      ),
    );
  }
}
