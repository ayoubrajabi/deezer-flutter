import 'package:beamer/beamer.dart';
import 'package:deezer_flutter/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/logics.dart';
import 'view/config/config.dart';
import 'view/screens/screens.dart';

void main() {
  runApp(
    DeezerApp(
      blocProviderList: BlocProviderList(),
      appTheme: AppTheme(),
    ),
  );
}

class DeezerApp extends StatelessWidget {
  final BlocProviderList? blocProviderList;
  final AppTheme? appTheme;

  DeezerApp({
    @required this.blocProviderList,
    @required this.appTheme,
  });

  final routerDelegate = BeamerDelegate(
    initialPath: HomeScreen.path,
    locationBuilder: SimpleLocationBuilder(
      routes: {
        '*': (context, state) {
          final beamerKey = GlobalKey<BeamerState>();
          return NavScreen(beamerKey: beamerKey);
        }
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProviderList!.blocProviders,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: appTheme!.theme(),
        routerDelegate: routerDelegate,
        routeInformationParser: BeamerParser(),
      ),
    );
  }
}
