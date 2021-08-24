import 'package:beamer/beamer.dart';
import 'package:deezer_flutter/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../config/config.dart';
import '../widgets/widgets.dart';

class NavScreen extends StatelessWidget {
  const NavScreen({Key? key, @required this.beamerKey}) : super(key: key);

  static const String path = '/';

  final GlobalKey<BeamerState>? beamerKey;

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
          body: Stack(
            children: [
              Offstage(
                offstage: false,
                child: Beamer(
                  key: beamerKey,
                  routerDelegate: BeamerDelegate(
                    initialPath: HomeScreen.path,
                    locationBuilder: BeamerLocationBuilder(
                      beamLocations: [
                        HomeLocation(),
                        SearchLocation(),
                      ],
                    ),
                  ),
                ),
              ),
              const MiniPlayerWidget(),
            ],
          ),
          bottomNavigationBar: CustomNavigationBar(
            beamerKey: beamerKey,
          ),
        ),
      ),
    );
  }
}
