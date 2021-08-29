import 'package:deezer_flutter/logic/logics.dart';
import 'package:deezer_flutter/view/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            toolbarHeight: 0.0,
            bottom: PreferredSize(
              preferredSize: Size(double.infinity, 300),
              child: ViewMoreHeader(
                radioIndex: index,
                radioState: radioState,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ViewMoreButtons(),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: hotMusicHeight,
              width: double.infinity,
              child: HotMusicsWidget(
                query: query,
                value: '',
                itemCount: hotMusicItemCount,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: BlocBuilder<MiniPlayerCubit, MiniPlayerState>(
              builder: (context, miniPlayerState) => Visibility(
                visible: miniPlayerState.isShow!,
                child: const SizedBox(
                  height: 80.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
