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
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: const HomeScreenItemsTitle(
                title: 'Top Artists',
              ),
            ),
            SizedBox(
              key: const PageStorageKey('TopArtists'),
              height: 110.0,
              width: MediaQuery.of(context).size.width,
              child: const TopArtistsWidget(),
            ),
            const HomeScreenItemsTitle(
              title: 'For You',
            ),
            SizedBox(
              key: const PageStorageKey('ForYou'),
              height: 415,
              width: MediaQuery.of(context).size.width,
              child: const ForYouWidget(),
            ),
            const HomeScreenItemsTitle(
              title: 'Hot Musics',
            ),
            SizedBox(
              key: const PageStorageKey('HotMusic'),
              height: 750.0,
              width: MediaQuery.of(context).size.width,
              child: const HotMusicsWidget(
                query: 'editorial/0/charts',
                value: 'tracks',
                itemCount: 5,
              ),
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
            ? const ViewMoreScreen(
                key: PageStorageKey('ViewMore'),
              )
            : state.index == 3
                ? const ArtistInfoScreen()
                : _homeWidget(),
      ),
    );
  }
}
