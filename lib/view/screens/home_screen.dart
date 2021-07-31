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
    final _theme = Theme.of(context);
    Widget _homeWidget() {
      return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeScreenItemsTitle(
              title: 'Top Artists',
            ),
            SizedBox(
              key: PageStorageKey('TopArtists'),
              height: 110.0,
              width: MediaQuery.of(context).size.width,
              child: TopArtistsWidget(),
            ),
            HomeScreenItemsTitle(
              title: 'For You',
            ),
            SizedBox(
              key: PageStorageKey('ForYou'),
              height: 415,
              width: MediaQuery.of(context).size.width,
              child: ForYouWidget(),
            ),
            HomeScreenItemsTitle(
              title: 'Hot Musics',
            ),
            SizedBox(
              key: PageStorageKey('HotMusic'),
              height: 750.0,
              width: MediaQuery.of(context).size.width,
              child: HotMusicsWidget(),
            ),
          ],
        ),
      );
    }

    return BlocBuilder<ScreenChangeCubit, ScreenChangeState>(
      builder: (context, state) => PageTransitionSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (child, animation, secondaryAnimation) {
          return SharedAxisTransition(
            fillColor: _theme.scaffoldBackgroundColor,
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.horizontal,
            child: child,
          );
        },
        child: state.index == 2
            ? ViewMoreScreen(
                key: PageStorageKey('ViewMore'),
              )
            : _homeWidget(),
      ),
    );
  }
}
