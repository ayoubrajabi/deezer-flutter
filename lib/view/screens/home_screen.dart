import 'package:deezer_flutter/logic/logics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String path = '/Home';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).scaffoldBackgroundColor,
            Colors.black45,
          ],
        ),
      ),
      child: ListView(
        cacheExtent: 1500.0,
        physics: const BouncingScrollPhysics(),
        children: [
          const HomeScreenItemsTitle(
            title: 'Top Artists',
          ),
          const SizedBox(
            key: PageStorageKey('TopArtists'),
            height: 145.0,
            child: TopArtistsWidget(),
          ),
          const HomeScreenItemsTitle(
            title: 'For You',
          ),
          const SizedBox(
            key: PageStorageKey('ForYou'),
            height: 355.0,
            child: ForYouWidget(),
          ),
          const HomeScreenItemsTitle(
            title: 'Trending Musics',
          ),
          const TreandingMusicsWidget(
            query: 'editorial/0/charts',
            value: 'tracks',
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
    );
  }
}
