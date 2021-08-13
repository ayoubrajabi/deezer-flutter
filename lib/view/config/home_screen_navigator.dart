import 'package:deezer_flutter/logic/logics.dart';
import 'package:deezer_flutter/view/screens/screens.dart';
import 'package:deezer_flutter/view/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenNavigator extends StatefulWidget {
  const HomeScreenNavigator({Key? key}) : super(key: key);

  @override
  _HomeScreenNavigatorState createState() => _HomeScreenNavigatorState();
}

class _HomeScreenNavigatorState extends State<HomeScreenNavigator> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final index = context.watch<ScreenChangeCubit>().state;
        final tooltip = context.watch<NavbarTooltipCubit>().state;

        return Navigator(
          pages: [
            MyPage(child: HomeScreen()),
            if (tooltip == 'Search') MyPage(child: SearchScreen()),
            if (index == 2)
              MyPage(
                child: Builder(
                  builder: (context) {
                    final _radioState = context.watch<RadioBloc>().state;
                    final _index = context.watch<ItemsIndexCubit>().state.index;

                    if (_radioState is RadioIsLoading) {
                      return const SizedBox(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else if (_radioState is RadioIsLoaded) {
                      final _radioTracklist =
                          _radioState.getRadio.data![_index].tracklist;
                      final String _query = _radioTracklist!
                          .replaceAll('https://api.deezer.com/', '');

                      return ForYouMoreScreen(
                        index: _index,
                        radioState: _radioState,
                        hotMusicHeight:
                            _radioState.getRadio.data!.length * 71.0,
                        query: _query,
                        hotMusicItemCount: _radioState.getRadio.data!.length,
                      );
                    }

                    return const SizedBox();
                  },
                ),
              ),
            if (index == 3 && tooltip == 'Home')
              MyPage(
                child: Builder(
                  builder: (context) {
                    final _artistState = context.read<ArtistsBloc>().state;
                    final _index = context.watch<ItemsIndexCubit>().state.index;
                    final _musicState = context.watch<MusicBloc>().state;

                    if (_artistState is ArtistIsLoaded) {
                      final _artistStateData =
                          _artistState.getArtist.data![_index];
                      final String _query = _artistStateData.tracklist!
                          .replaceAll('https://api.deezer.com/', '');
                      final String _trackListQuery =
                          _query.replaceAll('?limit=50', '');

                      final int? id = _artistStateData.id;
                      context
                          .read<AlbumBloc>()
                          .add(FeatchAlbum('artist/$id/albums', ''));

                      return ArtistInfoScreen(
                        index: _index,
                        artistName: _artistStateData.name,
                        artistImageurl: _artistStateData.pictureMedium,
                        hotMusicQuery: _trackListQuery,
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
            if (index == 3 && tooltip == 'Search')
              MyPage(
                child: Builder(
                  builder: (context) {
                    final _searchState = context.read<SearchBloc>().state;
                    final _index = context.watch<ItemsIndexCubit>().state.index;
                    final _musicState = context.watch<MusicBloc>().state;

                    if (_searchState is SearchIsLoaded) {
                      final data = _searchState.getRadio.data![_index];
                      final tracks = ArtsitInfo.trackList(_searchState)[_index]!
                          .replaceAll('https://api.deezer.com/', '');
                      final trackList = tracks.replaceAll('?limit=50', '');

                      final int? id = data.artist!.id;
                      context.read<AlbumBloc>().add(FeatchAlbum(
                          'artist/${ArtsitInfo.artistId(_searchState)[_index]}/albums',
                          ''));

                      return ArtistInfoScreen(
                        index: _index,
                        artistName: ArtsitInfo.name(_searchState)[_index],
                        artistImageurl:
                            ArtsitInfo.imageUrl(_searchState)[_index],
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

  static List<String?> trackList(SearchIsLoaded searchState) {
    final data = searchState.getRadio.data;
    final artistData = data!.map((info) => info.artist!).toSet().toList();
    return artistData.map((info) => info.tracklist!).toSet().toList();
  }

  static List<int?> artistId(SearchIsLoaded searchState) {
    final data = searchState.getRadio.data;
    final artistData = data!.map((info) => info.artist!).toSet().toList();
    return artistData.map((info) => info.id!).toSet().toList();
  }
}
