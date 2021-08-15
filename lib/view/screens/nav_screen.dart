// import 'package:deezer_flutter/logic/logics.dart';
// import 'package:deezer_flutter/view/config/config.dart';
// import 'package:deezer_flutter/view/config/search_screen_navigator.dart';
// import 'package:deezer_flutter/view/widgets/widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class NavScreen extends StatelessWidget {
//   const NavScreen({Key? key}) : super(key: key);
//   static const String id = '/';

//   final _screens = const <Widget>[
//     HomeScreenNavigator(),
//     SearchScreenNavigator(),
//   ];

//   Widget? _screenOfApp(int screenIndex) {
//     if (screenIndex == 0 || screenIndex == 1) {
//       return _screens[screenIndex];
//     }
//     return _screens[0];
//   }

//   @override
//   Widget build(BuildContext context) {
//     final _theme = Theme.of(context);
//     return AnnotatedRegion<SystemUiOverlayStyle>(
//       value: SystemUiOverlayStyle(
//         statusBarColor: _theme.cardColor,
//         statusBarIconBrightness: _theme.brightness,
//       ),
//       child: SafeArea(
//         child: Scaffold(
//           appBar: const HomeScreenAppBar(),
//           body: BlocBuilder<ScreenChangeCubit, int>(
//             builder: (context, index) => _screenOfApp(index)!,
//           ),
//           bottomNavigationBar: CustomNavigationBar(),
//         ),
//       ),
//     );
//   }
// }
