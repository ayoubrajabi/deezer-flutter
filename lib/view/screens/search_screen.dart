import 'package:beamer/beamer.dart';
import 'package:deezer_flutter/logic/logics.dart';
import 'package:deezer_flutter/utilities/utilities.dart';
import 'package:deezer_flutter/view/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static const String path = 'Search';

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: const [0.2, 0.3, 0.6, 0.7, 1.0],
          colors: [
            _theme.scaffoldBackgroundColor,
            _theme.scaffoldBackgroundColor.withAlpha(150),
            Colors.black45,
            Colors.black45,
            Colors.black45,
          ],
        ),
      ),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          HeaderSliverAppBar(),
          SliverToBoxAdapter(
            child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, searchState) {
                if (searchState is SearchIsLoading) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    child: const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 3.0,
                        color: Color(0xFFA15A66),
                      ),
                    ),
                  );
                } else if (searchState is SearchIsLoaded) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 20.0, bottom: 10.0),
                        child: Text(
                          'Artists',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                      const Divider(
                        color: Color(0xFF423240),
                        indent: 20.0,
                        endIndent: 20.0,
                        height: 30.0,
                      ),
                      SizedBox(
                        height: 170,
                        child: ListView.builder(
                          itemCount:
                              SearchArtsitInfo.imageUrl(searchState).length,
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: TopArtistItem(
                              artistName:
                                  SearchArtsitInfo.name(searchState)[index],
                              imgUrl:
                                  SearchArtsitInfo.imageUrl(searchState)[index],
                              onTap: () {
                                context.currentBeamLocation.update(
                                  (state) => state.copyWith(
                                    pathBlueprintSegments: ['artistSearch'],
                                    pathParameters: {'key': 'artistSearch'},
                                  ),
                                );

                                context
                                    .read<ItemsIndexCubit>()
                                    .itemsIndex(index);
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20.0, bottom: 10.0),
                        child: Text(
                          'Tracks',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                      const Divider(
                        color: Color(0xFF423240),
                        indent: 20.0,
                        endIndent: 20.0,
                        height: 30.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SizedBox(
                          height: searchState.getRadio.data!.length * 70.0,
                          child: ListView.builder(
                            itemCount: searchState.getRadio.data!.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final searchStateData =
                                  searchState.getRadio.data![index];

                              return HotMusicItems(
                                artistName: searchStateData.artist!.name,
                                imgUrl: searchStateData.album!.coverMedium,
                                musicTitle: searchStateData.title,
                                url: searchStateData.link,
                                onTap: () =>
                                    context.read<MiniPlayerCubit>().musicInfo(
                                          MiniPlayerState(
                                            imageUrl: searchStateData
                                                .album!.coverMedium,
                                            name: searchStateData.artist!.name,
                                            title: searchStateData.title,
                                            preview: searchStateData.preview,
                                            link: searchStateData.link,
                                            isShow: true,
                                          ),
                                        ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                }

                return const SizedBox();
              },
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
