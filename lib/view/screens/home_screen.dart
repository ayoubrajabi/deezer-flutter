import 'package:deezer_flutter/logic/logics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String path = 'Home';

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              _theme.scaffoldBackgroundColor,
              Colors.black45,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeScreenItemsTitle(
              title: 'Top Artists',
            ),
            const SizedBox(
              key: const PageStorageKey('TopArtists'),
              height: 195.0,
              child: TopArtistsWidget(),
            ),
            const HomeScreenItemsTitle(
              title: 'For You',
            ),
            const SizedBox(
              key: const PageStorageKey('ForYou'),
              height: 415.0,
              child: ForYouWidget(),
            ),
            const HomeScreenItemsTitle(
              title: 'Trending Musics',
            ),
            const SizedBox(
              key: const PageStorageKey('HotMusic'),
              height: 400.0,
              child: HotMusicsWidget(
                query: 'editorial/0/charts',
                value: 'tracks',
                itemCount: 5,
              ),
            ),
            BlocBuilder<MiniPlayerCubit, MiniPlayerState>(
              builder: (context, miniPlayerState) => Visibility(
                visible: miniPlayerState.isShow!,
                child: const SizedBox(
                  height: 80.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
