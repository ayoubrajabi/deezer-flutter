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

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return SizedBox(
      child: BlocConsumer<RadioBloc, RadioState>(
        listener: (context, radioState) {
          if (radioState is RadioError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: _theme.cardColor,
                content: const Text('Connection field!'),
              ),
            );
          }
        },
        buildWhen: (preState, state) => preState != state,
        builder: (context, radioState) {
          if (radioState is RadioIsLoading) {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) => LoadingWidget(
                      height: 290.0,
                      width: 260.0,
                      borderRadius: BorderRadius.circular(12.0),
                      icon: Icons.settings_input_antenna,
                      shape: BoxShape.rectangle,
                    ));
          } else if (radioState is RadioIsLoaded) {
            return ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemExtent: 280.0,
              itemBuilder: (context, index) {
                final _radioStateData = radioState.getRadio.data![index];

                final _itemsInfo = <String>[
                  _radioStateData.title!,
                  'tracks: ${_radioStateData.nbTracks}',
                  'tracks: ${_radioStateData.user!.name!}',
                ];

                return ForYouItems(
                  onTap: () {
                    context.read<ScreenChangeCubit>().screenChanegeIndex(2);
                    context.read<ForyouIndexCubit>().forYouChanegeIndex(index);
                  },
                  imgUrlXl: _radioStateData.pictureXl!,
                  imgUrlSmall: _radioStateData.pictureSmall!,
                  itemInfo: _itemsInfo,
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
