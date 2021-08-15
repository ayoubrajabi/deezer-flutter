import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/logics.dart';
import 'view/config/config.dart';
import 'view/widgets/widgets.dart';

void main() {
  runApp(
    DeezerApp(
      blocProviderList: BlocProviderList(),
      // appRoute: AppRoute(),
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
    initialPath: '/Home',
    locationBuilder: SimpleLocationBuilder(
      routes: {
        '*': (context, state) {
          final beamerKey = GlobalKey<BeamerState>();

          return Scaffold(
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
          );
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
