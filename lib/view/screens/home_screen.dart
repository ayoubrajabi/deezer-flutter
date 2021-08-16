import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String path = 'Home';

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [_theme.scaffoldBackgroundColor, Colors.black45],
          ),
        ),
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
              height: 180.0,
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
              title: 'Trending Musics',
            ),
            SizedBox(
              key: const PageStorageKey('HotMusic'),
              height: 5 * 80.0,
              width: MediaQuery.of(context).size.width,
              child: const HotMusicsWidget(
                query: 'editorial/0/charts',
                value: 'tracks',
                itemCount: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
