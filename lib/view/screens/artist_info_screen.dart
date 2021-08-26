import 'package:deezer_flutter/logic/logics.dart';
import 'package:deezer_flutter/view/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArtistInfoScreen extends StatelessWidget {
  const ArtistInfoScreen({
    Key? key,
    required this.index,
    required this.hotMusicHeight,
    required this.hotMusicItemCount,
    required this.artistName,
    required this.artistImageurl,
    required this.hotMusicQuery,
  }) : super(key: key);

  final int? index;
  final double? hotMusicHeight;
  final int? hotMusicItemCount;
  final String? artistName;
  final String? artistImageurl;
  final String? hotMusicQuery;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).scaffoldBackgroundColor,
            Colors.black45,
          ],
        ),
      ),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            toolbarHeight: 0.0,
            bottom: PreferredSize(
              preferredSize: const Size(double.infinity, 300.0),
              child: ArtistHeaderWidget(
                index: index,
                artistName: artistName,
                imageUrl: artistImageurl,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 25.0, top: 20.0, bottom: 10.0),
              child: Text(
                'Top Tracks',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: hotMusicHeight,
              width: double.infinity,
              child: HotMusicsWidget(
                itemCount: hotMusicItemCount,
                query: hotMusicQuery,
                value: '',
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Align(
              child: Text(
                'Albums',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: ArtistAlbumsWidget(),
          ),
          SliverToBoxAdapter(
            child: BlocBuilder<MiniPlayerCubit, MiniPlayerState>(
              builder: (context, miniPlayerState) => Visibility(
                  visible: miniPlayerState.isShow!,
                  child: const SizedBox(
                    height: 80.0,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
