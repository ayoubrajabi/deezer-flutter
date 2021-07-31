import 'package:deezer_flutter/logic/logics.dart';
import 'package:deezer_flutter/view/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniplayer/miniplayer.dart';

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
              appBar: HomeScreenAppBar(),
              backgroundColor: _theme.scaffoldBackgroundColor,
              body: BlocBuilder<ScreenChangeCubit, ScreenChangeState>(
                builder: (context, screenChangeIndex) =>
                    _screens[screenChangeIndex.index],
              ),
              bottomNavigationBar: CustomNavigationBar(),
            ),
            Positioned(
              bottom: 60.0,
              left: 0.0,
              right: 0.0,
              child: Miniplayer(
                minHeight: 70,
                maxHeight: 800,
                elevation: 0.0,
                backgroundColor: _theme.cardColor,
                builder: (height, percentage) {
                  if (percentage > 0.2) {
                    return Container(
                      color: _theme.cardColor,
                    );
                  }
                  //return Text('!mini');
                  return Container(
                    color: _theme.cardColor,
                  );
                  //return Text('mini');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
