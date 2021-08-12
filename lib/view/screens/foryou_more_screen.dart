import 'package:deezer_flutter/logic/logics.dart';
import 'package:deezer_flutter/view/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ForYouMoreScreen extends StatelessWidget {
  const ForYouMoreScreen({
    Key? key,
    required this.index,
    required this.radioState,
    required this.hotMusicHeight,
    required this.query,
    required this.hotMusicItemCount,
  }) : super(key: key);

  final int? index;
  final RadioIsLoaded? radioState;
  final double? hotMusicHeight;
  final String? query;
  final int? hotMusicItemCount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            ViewMoreHeader(
              radioIndex: index,
              radioState: radioState,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ViewMoreButtons(),
            ),
            SizedBox(
              height: hotMusicHeight,
              width: double.infinity,
              child: HotMusicsWidget(
                query: query,
                value: '',
                itemCount: hotMusicItemCount,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
