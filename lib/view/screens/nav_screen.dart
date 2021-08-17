import 'package:beamer/beamer.dart';
import 'package:deezer_flutter/logic/logics.dart';
import 'package:deezer_flutter/view/config/config.dart';
import 'package:deezer_flutter/view/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniplayer/miniplayer.dart';

class NavScreen extends StatelessWidget {
  const NavScreen({Key? key, @required this.beamerKey}) : super(key: key);
  static const String path = '/';

  final GlobalKey<BeamerState>? beamerKey;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: _theme.cardColor,
        statusBarIconBrightness: _theme.brightness,
      ),
      child: SafeArea(
        child: Scaffold(
          appBar: HomeScreenAppBar(
            beamerKey: beamerKey,
          ),
          body: Stack(
            children: [
              Offstage(
                offstage: false,
                child: Beamer(
                  key: beamerKey,
                  routerDelegate: BeamerDelegate(
                    locationBuilder: BeamerLocationBuilder(
                      beamLocations: [
                        HomeLocation(),
                        SearchLocation(),
                      ],
                    ),
                  ),
                ),
              ),
            ]..add(
                Builder(
                  builder: (context) {
                    final _musicState = context.watch<MusicBloc>().state;
                    final _musicIndex =
                        context.watch<MusicItemIndexCubit>().state;

                    if (_musicState is MusicIsLoaded) {
                      final _musicData =
                          _musicState.getMusic.data![_musicIndex];

                      return Offstage(
                        offstage: false,
                        child: Miniplayer(
                            minHeight: 75.0,
                            maxHeight: 75.0,
                            elevation: 30.0,
                            builder: (hieght, precentage) {
                              return Container(
                                color: _theme.scaffoldBackgroundColor,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12.0),
                                      child: Image.network(
                                        _musicData.album!.coverMedium!,
                                        height: 65.0,
                                        width: 85.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 150.0,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(_musicData.title!),
                                          Text(_musicData.artist!.name!),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 50.0,
                                      width: 50.0,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: Center(
                                          child: Icon(Icons.pause),
                                        ),
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                            _theme.accentColor,
                                          ),
                                          shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(200.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.close,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              );
                            }),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ),
          ),
          bottomNavigationBar: CustomNavigationBar(
            beamerKey: beamerKey,
          ),
        ),
      ),
    );
  }
}
