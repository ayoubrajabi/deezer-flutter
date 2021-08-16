import 'package:beamer/beamer.dart';
import 'package:deezer_flutter/view/config/config.dart';
import 'package:deezer_flutter/view/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
          appBar: HomeScreenAppBar(
            beamerKey: beamerKey,
          ),
          body: Beamer(
            key: beamerKey,
            routerDelegate: BeamerDelegate(
              locationBuilder: BeamerLocationBuilder(
                beamLocations: [
                  HomeLocation(),
                  SearchLocation(),
                ],
              ),
            ),
          ),
          bottomNavigationBar: CustomNavigationBar(
            beamerKey: beamerKey,
          ),
        ),
      ),
    );
  }
}
