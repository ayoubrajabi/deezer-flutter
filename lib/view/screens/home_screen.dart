import 'dart:ui';

import 'package:deezer_flutter/logic/logics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        HomeScreenItemsTitle(
          title: 'Top Artists',
        ),
        SizedBox(
          height: 150.0,
          width: MediaQuery.of(context).size.width,
          child: TopArtistsWidget(),
        ),
        HomeScreenItemsTitle(
          title: 'For You',
        ),
        SizedBox(
          height: 450,
          width: MediaQuery.of(context).size.width,
          child: ForYouWidget(),
        ),
      ],
    );
  }
}

class HomeScreenItemsTitle extends StatelessWidget {
  const HomeScreenItemsTitle({Key? key, @required this.title})
      : super(key: key);
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Text(
        title!,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
        ),
      ),
    );
  }
}

class ForYouWidget extends StatelessWidget {
  const ForYouWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<RadioBloc>().add(FeatchRadio('editorial/0/charts'));
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
        builder: (context, radioState) {
          if (radioState is RadioIsLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
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
                          filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
                          child: Column(
                            children: [
                              Text(radioState.getRadio.data![index].title!),
                              Text(
                                  'tracks: ${radioState.getRadio.data![index].nbTracks}'),
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

class TopArtistsWidget extends StatelessWidget {
  const TopArtistsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<ArtistsBloc>().add(FeatchArtist('editorial/0/charts'));
    final _theme = Theme.of(context);
    return SizedBox(
      child: BlocConsumer<ArtistsBloc, ArtistState>(
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
        builder: (context, radioState) {
          if (radioState is ArtistIsLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (radioState is ArtistIsLoaded) {
            return ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => Container(
                height: 150.0,
                width: 130.0,
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: _theme.cardColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(200.0),
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: radioState.getArtist.data![index].pictureMedium!,
                    fit: BoxFit.cover,
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
