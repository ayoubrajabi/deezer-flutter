import 'package:beamer/beamer.dart';
import 'package:deezer_flutter/logic/logics.dart';
import 'package:deezer_flutter/utilities/utilities.dart';
import 'package:deezer_flutter/view/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        BeamPage(
          key: const ValueKey('Home'),
          type: BeamPageType.sharedAxisTransion,
          child: const HomeScreen(),
        ),
        if (state.uri.pathSegments.contains('artistHome'))
          BeamPage(
            key: const ValueKey('artistHome'),
            type: BeamPageType.sharedAxisTransion,
            child: Builder(
              builder: (context) {
                final _artistState = context.read<ArtistsBloc>().state;
                final _index = context.watch<ItemsIndexCubit>().state.index;
                final _musicState = context.watch<MusicBloc>().state;

                if (_artistState is ArtistIsLoaded) {
                  final _artistData =
                      ArtistInfo.artistDtat(_artistState, _index);
                  final int _artistId = ArtistInfo.id(_artistState, _index);

                  context
                      .read<AlbumBloc>()
                      .add(FeatchAlbum('artist/$_artistId/albums', ''));

                  return ArtistInfoScreen(
                    index: _index,
                    artistName: _artistData.name,
                    artistImageurl: _artistData.pictureBig,
                    hotMusicQuery:
                        ArtistInfo.trackListQuery(_artistState, _index),
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
          )
        else if (state.uri.pathSegments.contains('ForYou'))
          BeamPage(
              key: const ValueKey('ForYou'),
              type: BeamPageType.sharedAxisTransion,
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
                    final String? _radioTracklist =
                        _radioState.getRadio.data![_index].tracklist;
                    final String _query = _radioTracklist!
                        .replaceAll('https://api.deezer.com/', '');

                    return ForYouMoreScreen(
                      index: _index,
                      radioState: _radioState,
                      hotMusicHeight: _radioState.getRadio.data!.length * 71.0,
                      query: _query,
                      hotMusicItemCount: _radioState.getRadio.data!.length,
                    );
                  }

                  return const SizedBox();
                },
              ))
      ];

  @override
  List get pathBlueprints => [HomeScreen.path];
}
