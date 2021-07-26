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
  ];

  List<BlocProvider> get blocProviders => _blocProviders;
}
