import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        HomeScreenItemsTitle(
          title: 'Top Artists',
        ),
        SizedBox(
          height: 150.0,
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
      ],
    );
  }
}
