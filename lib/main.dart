import 'package:flutter/material.dart';

import 'view/config/config.dart';

void main() {
  runApp(DeezerApp(
    appRoute: AppRoute(),
    appTheme: AppTheme(),
  ));
}

class DeezerApp extends StatelessWidget {
  final AppRoute? appRoute;
  final AppTheme? appTheme;

  const DeezerApp({@required this.appRoute, @required this.appTheme});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: appRoute!.onGenerateRoute,
      theme: appTheme!.theme(),
    );
  }
}
