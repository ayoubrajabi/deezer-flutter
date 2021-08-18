import 'package:flutter/material.dart';

import '../widgets.dart';

class HomScreenWidget extends StatelessWidget {
  const HomScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: HomeScreenItemsTitle(
              title: 'Top Artists',
            ),
          ),
          SizedBox(
            key: PageStorageKey('TopArtists'),
            height: 180.0,
            child: TopArtistsWidget(),
          ),
          HomeScreenItemsTitle(
            title: 'For You',
          ),
          SizedBox(
            key: PageStorageKey('ForYou'),
            height: 415.0,
            child: ForYouWidget(),
          ),
          HomeScreenItemsTitle(
            title: 'Trending Musics',
          ),
          SizedBox(
            key: PageStorageKey('HotMusic'),
            height: 400.0,
            child: HotMusicsWidget(
              query: 'editorial/0/charts',
              value: 'tracks',
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
