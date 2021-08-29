import 'package:deezer_flutter/data/repositores/music_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logics.dart';

class BlocProviderList {
  final List<BlocProvider> _blocProviders = [
    BlocProvider<ItemsIndexCubit>(
      create: (_) => ItemsIndexCubit(),
    ),
    BlocProvider<NavbarTooltipCubit>(
      create: (_) => NavbarTooltipCubit(),
    ),
    BlocProvider<MiniPlayerCubit>(
      create: (_) => MiniPlayerCubit(),
    ),
    BlocProvider<RadioBloc>(
      create: (_) => RadioBloc(
        musicRepo: MusicRepo(),
      ),
    ),
    BlocProvider<MusicBloc>(
      create: (_) => MusicBloc(
        musicRepo: MusicRepo(),
      ),
    ),
    BlocProvider<TreandMusicBloc>(
      create: (_) => TreandMusicBloc(
        musicRepo: MusicRepo(),
      ),
    ),
    BlocProvider<ArtistsBloc>(
      create: (_) => ArtistsBloc(
        musicRepo: MusicRepo(),
      ),
    ),
    BlocProvider<AlbumBloc>(
      create: (_) => AlbumBloc(
        musicRepo: MusicRepo(),
      ),
    ),
    BlocProvider<SearchBloc>(
      create: (_) => SearchBloc(
        musicRepo: MusicRepo(),
      ),
    ),
  ];

  List<BlocProvider> get blocProviders => _blocProviders;
}
