import 'dart:ui';

import 'package:deezer_flutter/logic/logics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transparent_image/transparent_image.dart';

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
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  context.read<ScreenChangeCubit>().screenChanegeIndex(2);
                  context.read<ForyouIndexCubit>().forYouChanegeIndex(index);
                },
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: _theme.cardColor,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12.0),
                          topRight: Radius.circular(12.0),
                        ),
                        child: SizedBox(
                          height: 290.0,
                          width: double.infinity,
                          child: FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: radioState.getRadio.data![index].pictureBig!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(12.0),
                          bottomRight: Radius.circular(12.0),
                        ),
                        child: Container(
                          height: 105.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                radioState.getRadio.data![index].pictureSmall!,
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: BackdropFilter(
                            filter:
                                ImageFilter.blur(sigmaX: 40.0, sigmaY: 40.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List<Padding>.generate(
                                3,
                                (itemsIndex) {
                                  final _itemsInfo = <String>[
                                    radioState.getRadio.data![index].title!,
                                    'tracks: ${radioState.getRadio.data![index].nbTracks}',
                                    'tracks: ${radioState.getRadio.data![index].user!.name!}',
                                  ];
                                  return Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      _itemsInfo[itemsIndex],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: itemsIndex == 0
                                              ? Colors.red.shade800
                                              : Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
