import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/logics.dart';
import 'view/config/config.dart';

void main() {
  runApp(DeezerApp(
    blocProviderList: BlocProviderList(),
    appRoute: AppRoute(),
    appTheme: AppTheme(),
  ));
}

class DeezerApp extends StatelessWidget {
  final BlocProviderList? blocProviderList;
  final AppRoute? appRoute;
  final AppTheme? appTheme;

  const DeezerApp({
    @required this.blocProviderList,
    @required this.appRoute,
    @required this.appTheme,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProviderList!.blocProviders,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRoute!.onGenerateRoute,
        theme: appTheme!.theme(),
      ),
    );
  }
}
