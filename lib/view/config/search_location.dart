import 'package:beamer/beamer.dart';
import 'package:deezer_flutter/logic/logics.dart';
import 'package:deezer_flutter/utilities/utilities.dart';
import 'package:deezer_flutter/view/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        BeamPage(
          key: ValueKey('Search'),
          type: BeamPageType.sharedAxisTransion,
          child: SearchScreen(),
        ),
        if (state.pathParameters.containsValue('artistSearch'))
          BeamPage(
            type: BeamPageType.sharedAxisTransion,
            child: Builder(
              builder: (context) {
                final _searchState = context.read<SearchBloc>().state;
                final _index = context.watch<ItemsIndexCubit>().state.index;
                final _musicState = context.watch<MusicBloc>().state;

                if (_searchState is SearchIsLoaded) {
                  final tracks = ArtsitInfo.trackList(_searchState)[_index]!
                      .replaceAll('https://api.deezer.com/', '');
                  final trackList = tracks.replaceAll('?limit=50', '');

                  return ArtistInfoScreen(
                    index: _index,
                    artistName: ArtsitInfo.name(_searchState)[_index],
                    artistImageurl: ArtsitInfo.imageUrl(_searchState)[_index],
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
      ];

  @override
  List get pathBlueprints => [SearchScreen.path];
}
