import 'package:deezer_flutter/logic/logics.dart';
import 'package:deezer_flutter/view/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

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
            child: SizedBox(
              height: 1000.0,
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, searchState) {
                  if (searchState is SearchIsLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (searchState is SearchIsLoaded) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: IconButton(
                              onPressed: () => context
                                  .read<SearchBloc>()
                                  .add(DisposeSearch()),
                              icon: Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 35.0,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SizedBox(
                            height: 200,
                            width: double.infinity,
                            child: ListView.builder(
                              itemCount:
                                  ArtsitInfo.imageUrl(searchState).length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => TopArtistItem(
                                artistName: ArtsitInfo.name(searchState)[index],
                                imgUrl: ArtsitInfo.imageUrl(searchState)[index],
                                onTap: () {
                                  context
                                      .read<ScreenChangeCubit>()
                                      .screenChanegeIndex(3);
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
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SizedBox(
                            height: 400.0,
                            child: ListView.builder(
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                final searchStateData =
                                    searchState.getRadio.data![index];

                                return HotMusicItems(
                                  artistName: searchStateData.artist!.name,
                                  imgUrl: searchStateData.album!.coverMedium,
                                  musicTitle: searchStateData.title,
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
          ),
        ],
      ),
    );
  }
}

class ArtsitInfo {
  static List<String?> name(SearchIsLoaded searchState) {
    final data = searchState.getRadio.data;
    final artistData = data!.map((info) => info.artist!).toSet().toList();
    return artistData.map((info) => info.name).toSet().toList();
  }

  static List<String?> imageUrl(SearchIsLoaded searchState) {
    final data = searchState.getRadio.data;
    final artistData = data!.map((info) => info.artist!).toSet().toList();
    return artistData.map((info) => info.pictureMedium!).toSet().toList();
  }
}
