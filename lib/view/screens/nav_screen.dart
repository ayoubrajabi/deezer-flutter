import 'package:beamer/beamer.dart';
import 'package:deezer_flutter/logic/cubits/miniplayer_cubit/miniplayer_cubit.dart';
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
              BlocBuilder<MiniPlayerCubit, MiniPlayerState>(
                builder: (context, miniPlayerState) {
                  return Offstage(
                    offstage: !miniPlayerState.isShow!,
                    child: Miniplayer(
                        minHeight: 75.0,
                        maxHeight: 75.0,
                        elevation: 30.0,
                        builder: (hieght, precentage) {
                          return Container(
                            color: _theme.scaffoldBackgroundColor,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: Image.network(
                                    miniPlayerState.imageUrl!,
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
                                      Text(miniPlayerState.title!),
                                      Text(miniPlayerState.name!),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 50.0,
                                  width: 50.0,
                                  child: ElevatedButton(
                                    onPressed: () {},
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
                                    child: const Center(
                                      child: Icon(Icons.pause),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () =>
                                      context.read<MiniPlayerCubit>().musicInfo(
                                            MiniPlayerState(
                                              isShow: false,
                                              imageUrl: '',
                                              name: '',
                                              title: '',
                                            ),
                                          ),
                                  icon: const Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                  );
                },
              ),
            ],
          ),
          bottomNavigationBar: CustomNavigationBar(
            beamerKey: beamerKey,
          ),
        ),
      ),
    );
  }
}
