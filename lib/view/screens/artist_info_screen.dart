import 'package:deezer_flutter/logic/logics.dart';
import 'package:deezer_flutter/view/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArtistInfoScreen extends StatelessWidget {
  const ArtistInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final _artistState = context.read<ArtistsBloc>().state;
        final _index = context.watch<ForyouIndexCubit>().state.index;

        if (_artistState is ArtistIsLoaded) {
          final _artistStateData = _artistState.getArtist.data![_index];
          final String _query = _artistStateData.tracklist!
              .replaceAll('https://api.deezer.com/', '');

          return ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              ArtistHeaderWidget(
                artistState: _artistState,
                index: _index,
              ),
              SizedBox(
                height: 400,
                width: double.infinity,
                child: HotMusicsWidget(
                  itemCount: 5,
                  value: '',
                  query: _query,
                ),
              ),
              const SizedBox(
                height: 600.0,
              ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}

class ArtistHeaderWidget extends StatelessWidget {
  const ArtistHeaderWidget({
    Key? key,
    @required this.index,
    @required this.artistState,
  }) : super(key: key);

  final int? index;
  final ArtistIsLoaded? artistState;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Image.network(
          artistState!.getArtist.data![index!].pictureBig!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: _height * 0.5,
        ),
        Positioned(
          bottom: 0.0,
          right: 0.0,
          left: 0.0,
          child: Container(
            height: _height * 0.5,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  _theme.scaffoldBackgroundColor,
                  _theme.scaffoldBackgroundColor,
                  _theme.scaffoldBackgroundColor.withAlpha(70),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 250.0,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                artistState!.getArtist.data![index!].name!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Container(
                height: _height * 0.085,
                width: _width * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45.0),
                  gradient: LinearGradient(
                    colors: [
                      _theme.accentColor,
                      const Color(0xff733E46),
                    ],
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xff733E46),
                      blurRadius: 5.0,
                    )
                  ],
                ),
                child: MaterialButton(
                  onPressed: () {},
                  shape: const StadiumBorder(),
                  child: const Text(
                    'play',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
