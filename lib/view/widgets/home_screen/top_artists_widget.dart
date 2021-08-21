import 'package:beamer/beamer.dart';
import 'package:deezer_flutter/logic/logics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      context
          .read<ArtistsBloc>()
          .add(FeatchArtist('editorial/0/charts', 'artists'));
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
                content: const Text('Internet Not Available!'),
              ),
            );
          }
        },
        buildWhen: (preState, state) => preState != state,
        builder: (context, artistState) {
          if (artistState is ArtistIsLoaded) {
            return ListView.builder(
              itemCount: artistState.getArtist.total,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => TopArtistItem(
                onTap: () {
                  context.currentBeamLocation.update(
                    (state) => state.copyWith(
                      pathBlueprintSegments: ['artistHome'],
                      pathParameters: {'key': 'artistHome'},
                    ),
                  );
                  context.read<ScreenChangeCubit>().screenChanegeIndex(3);
                  context.read<ItemsIndexCubit>().itemsIndex(index);
                },
                imgUrl: artistState.getArtist.data![index].pictureMedium,
                artistName: artistState.getArtist.data![index].name,
              ),
            );
          }
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => Column(
              children: [
                LoadingWidget(
                  height: 140.0,
                  width: 140.0,
                  icon: Icons.person,
                  clipper: LoadingPainter(),
                ),
                const SizedBox(
                  height: 2.0,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
