import 'package:deezer_flutter/logic/logics.dart';
import 'package:deezer_flutter/view/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:card_swiper/card_swiper.dart';

class ArtistInfoScreen extends StatelessWidget {
  const ArtistInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final _artistState = context.read<ArtistsBloc>().state;
        final _index = context.watch<ItemsIndexCubit>().state.index;
        final _musicState = context.watch<MusicBloc>().state;

        if (_artistState is ArtistIsLoaded) {
          final _artistStateData = _artistState.getArtist.data![_index];
          final String _query = _artistStateData.tracklist!
              .replaceAll('https://api.deezer.com/', '');
          final String _trackListQuery = _query.replaceAll('?limit=50', '');

          final int? id = _artistStateData.id;
          context.read<AlbumBloc>().add(FeatchAlbum('artist/$id/albums', ''));

          final _theme = Theme.of(context);

          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  _theme.scaffoldBackgroundColor,
                  Colors.black45,
                ],
              ),
            ),
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  bottom: PreferredSize(
                    preferredSize: const Size(double.infinity, 244.0),
                    child: ArtistHeaderWidget(
                      index: _index,
                      artistState: _artistState,
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 25.0, top: 20.0, bottom: 10.0),
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
                  child: Container(
                    height: _musicState is MusicIsLoaded
                        ? _musicState.getMusic.data!.length * 80.0
                        : 400.0,
                    width: double.infinity,
                    child: HotMusicsWidget(
                      itemCount: _musicState is MusicIsLoaded
                          ? _musicState.getMusic.data!.length
                          : 0,
                      query: _trackListQuery,
                      value: '',
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Align(
                    alignment: Alignment.center,
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
                SliverToBoxAdapter(
                  child: ArtistAlbumsWidget(),
                ),
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
