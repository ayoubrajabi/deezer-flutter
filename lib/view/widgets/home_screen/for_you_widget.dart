import 'package:beamer/beamer.dart';
import 'package:deezer_flutter/logic/logics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets.dart';

class ForYouWidget extends StatefulWidget {
  const ForYouWidget({Key? key}) : super(key: key);

  @override
  _ForYouWidgetState createState() => _ForYouWidgetState();
}

class _ForYouWidgetState extends State<ForYouWidget> {
  @override
  void initState() {
    super.initState();
    final state = context.read<RadioBloc>().state;
    if (state is! RadioIsLoaded) {
      context
          .read<RadioBloc>()
          .add(FeatchRadio('editorial/0/charts', 'playlists'));
    }
  }

  Widget forYouWidget(RadioIsLoaded radioState, int index) {
    final _radioStateData = radioState.getRadio.data![index];

    final _itemsInfo = <String>[
      _radioStateData.title!,
      'tracks: ${_radioStateData.nbTracks}',
      'tracks: ${_radioStateData.user!.name!}',
    ];

    return ForYouItems(
      onTap: () {
        context.currentBeamLocation.update(
          (state) => state.copyWith(
            pathBlueprintSegments: ['ForYou'],
            pathParameters: {'key': 'ForYou'},
          ),
        );
        context.read<ItemsIndexCubit>().itemsIndex(index);
      },
      imgUrlXl: _radioStateData.pictureXl,
      imgUrlSmall: _radioStateData.picture,
      itemInfo: _itemsInfo,
    );
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return BlocBuilder<RadioBloc, RadioState>(
      buildWhen: (preState, state) => preState != state,
      builder: (context, radioState) {
        if (radioState is RadioIsLoaded) {
          return ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            addRepaintBoundaries: true,
            itemExtent: 240.0,
            cacheExtent: 2400.0,
            itemBuilder: (context, index) => forYouWidget(radioState, index),
          );
        }
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => LoadingWidget(
            height: 260.0,
            width: 225.0,
            borderRadius: BorderRadius.circular(7.0),
            icon: Icons.settings_input_antenna,
            color: _theme.cardColor,
            shape: BoxShape.rectangle,
          ),
        );
      },
    );
  }
}
