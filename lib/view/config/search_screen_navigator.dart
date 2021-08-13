import 'package:deezer_flutter/logic/logics.dart';
import 'package:deezer_flutter/view/screens/screens.dart';
import 'package:deezer_flutter/view/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreenNavigator extends StatefulWidget {
  const SearchScreenNavigator({Key? key}) : super(key: key);

  @override
  _SearchScreenNavigatorState createState() => _SearchScreenNavigatorState();
}

class _SearchScreenNavigatorState extends State<SearchScreenNavigator> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final index = context.watch<ScreenChangeCubit>().state;
        final tooltip = context.watch<NavbarTooltipCubit>().state;

        return Navigator(
          pages: [
            MyPage(child: SearchScreen()),
            if (index == 3 && tooltip == 'Search')
              MyPage(
                child: Builder(
                  builder: (context) {
                    final _searchState = context.read<SearchBloc>().state;
                    final _index = context.watch<ItemsIndexCubit>().state.index;
                    final _musicState = context.watch<MusicBloc>().state;

                    if (_searchState is SearchIsLoaded) {
                      final data = _searchState.getRadio.data![_index];
                      final tracks = data.artist!.tracklist!
                          .replaceAll('https://api.deezer.com/', '');
                      final trackList = tracks.replaceAll('?limit=50', '');

                      final int? id = data.artist!.id;
                      context
                          .read<AlbumBloc>()
                          .add(FeatchAlbum('artist/$id/albums', ''));

                      return ArtistInfoScreen(
                        index: _index,
                        artistName: data.artist!.name,
                        artistImageurl: data.artist!.pictureMedium,
                        hotMusicQuery: trackList,
                        hotMusicHeight: _musicState is MusicIsLoaded
                            ? _musicState.getMusic.data!.length * 80.0
                            : 400.0,
                        hotMusicItemCount: _musicState is MusicIsLoaded
                            ? _musicState.getMusic.data!.length
                            : 0,
                      );
                    }

                    return const SizedBox();
                  },
                ),
              ),
          ],
          onPopPage: (route, result) {
            return route.didPop(result);
          },
        );
      },
    );
  }
}
