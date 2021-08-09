import 'package:animations/animations.dart';
import 'package:deezer_flutter/logic/logics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/widgets.dart';
import 'screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeScreenAppBar(),
      body: BlocBuilder<ScreenChangeCubit, ScreenChangeState>(
        builder: (context, state) => PageTransitionSwitcher(
          duration: const Duration(milliseconds: 400),
          reverse: state.index == 3 || state.index == 2,
          transitionBuilder: (child, animation, secondaryAnimation) {
            return SharedAxisTransition(
              fillColor: Colors.transparent,
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.horizontal,
              child: child,
            );
          },
          child: state.index == 2
              ? const ForYouMoreScreen(
                  key: PageStorageKey('ViewMore'),
                )
              : state.index == 3
                  ? const ArtistInfoScreen()
                  : const HomScreenWidget(),
        ),
      ),
    );
  }
}
