import 'package:deezer_flutter/view/screens/screens.dart';
import 'package:flutter/material.dart';

class AppRoute {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case NavScreen.id:
        return MaterialPageRoute(builder: (_) => NavScreen());
    }
  }
}
