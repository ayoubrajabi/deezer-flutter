import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeScreenItemsTitle(
            title: 'Top Artists',
          ),
          SizedBox(
            height: 130.0,
            width: MediaQuery.of(context).size.width,
            child: TopArtistsWidget(),
          ),
          HomeScreenItemsTitle(
            title: 'For You',
          ),
          SizedBox(
            height: 450,
            width: MediaQuery.of(context).size.width,
            child: ForYouWidget(),
          ),
          HomeScreenItemsTitle(
            title: 'Hot Musics',
          ),
          SizedBox(
            height: 750.0,
            width: MediaQuery.of(context).size.width,
            child: HotMusicsWidget(),
          ),
        ],
      ),
    );
  }
}


