import 'package:deezer_flutter/logic/logics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArtistInfoScreen extends StatelessWidget {
  const ArtistInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Builder(
      builder: (context) {
        final _artistState = context.read<ArtistsBloc>().state;
        final _index = context.watch<ForyouIndexCubit>().state.index;

        if (_artistState is ArtistIsLoaded) {
          return ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Stack(
                children: [
                  Image.network(
                    _artistState.getArtist.data![_index].pictureBig!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 400.0,
                  ),
                  Positioned(
                    bottom: 0.0,
                    right: 0.0,
                    left: 0.0,
                    child: Container(
                      height: 500.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            _theme.scaffoldBackgroundColor,
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 120.0,
                    left: 120,
                    child: Center(
                      child: Text(
                        _artistState.getArtist.data![_index].name!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 40.0,
                    left: 130,
                    child: Container(
                      height: 55.0,
                      width: 170.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45.0),
                        gradient: LinearGradient(
                          colors: [
                            _theme.accentColor,
                            const Color(0xff733E46),
                          ],
                        ),
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
                  ),
                ],
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
