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
      context.read<RadioBloc>().add(FeatchRadio('editorial/0/charts'));
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
                content: Text('Connection field!'),
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
                      borderRadius: BorderRadius.circular(12.0),
                      height: 300,
                      width: 330.0,
                      icon: Icons.settings_input_antenna,
                      shape: BoxShape.rectangle,
                    ));
          } else if (radioState is RadioIsLoaded) {
            return ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemExtent: 330.0,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: _theme.cardColor,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0),
                      ),
                      child: SizedBox(
                        height: 325.0,
                        width: double.infinity,
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: radioState.getRadio.data![index].pictureBig!,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.only(
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
                          filter: ImageFilter.blur(sigmaX: 40.0, sigmaY: 40.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(radioState.getRadio.data![index].title!),
                              Text(
                                  'tracks: ${radioState.getRadio.data![index].nbTracks}'),
                              Text(
                                  'tracks: ${radioState.getRadio.data![index].user!.name!}'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
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
