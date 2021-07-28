import 'package:deezer_flutter/data/repositores/music_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logics.dart';

class BlocProviderList {
  List<BlocProvider> _blocProviders = [
    BlocProvider<ScreenChangeCubit>(
      create: (_) => ScreenChangeCubit(),
    ),
    BlocProvider<NavbarTooltipCubit>(
      create: (_) => NavbarTooltipCubit(),
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
    BlocProvider<ArtistsBloc>(
      create: (_) => ArtistsBloc(
        musicRepo: MusicRepo(),
      ),
    ),
  ];

  List<BlocProvider> get blocProviders => _blocProviders;
}
