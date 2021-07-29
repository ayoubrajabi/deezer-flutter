import 'package:deezer_flutter/logic/logics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transparent_image/transparent_image.dart';

import '../widgets.dart';

class TopArtistsWidget extends StatefulWidget {
  const TopArtistsWidget({Key? key}) : super(key: key);

  @override
  _TopArtistsWidgetState createState() => _TopArtistsWidgetState();
}

class _TopArtistsWidgetState extends State<TopArtistsWidget> {
  @override
  void initState() {
    super.initState();
    final state = context.read<ArtistsBloc>().state;
    if (state is! ArtistIsLoaded) {
      context.read<ArtistsBloc>().add(FeatchArtist('editorial/0/charts'));
    }
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return SizedBox(
      child: BlocConsumer<ArtistsBloc, ArtistState>(
        listener: (context, artistState) {
          if (artistState is ArtistError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: _theme.cardColor,
                content: Text('Connection field!'),
              ),
            );
          }
        },
        buildWhen: (preState, state) => preState != state,
        builder: (context, artistState) {
          if (artistState is ArtistIsLoading) {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) => LoadingWidget(
                      // height: 300,
                      width: 130.0,
                      icon: Icons.person,
                      shape: BoxShape.circle,
                    ));
          } else if (artistState is ArtistIsLoaded) {
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
                    image: artistState.getArtist.data![index].pictureMedium!,
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
