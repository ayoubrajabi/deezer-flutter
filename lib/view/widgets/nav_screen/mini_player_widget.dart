import 'package:deezer_flutter/logic/logics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:animated_widgets/animated_widgets.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class MiniPlayerWidget extends StatefulWidget {
  const MiniPlayerWidget({Key? key}) : super(key: key);

  @override
  _MiniPlayerWidgetState createState() => _MiniPlayerWidgetState();
}

class _MiniPlayerWidgetState extends State<MiniPlayerWidget> {
  bool? _isPlay = false;

  AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();

  void openPlayer() async {
    final miniPlayerState = context.read<MiniPlayerCubit>().state;

    await _assetsAudioPlayer.open(
      Audio.network(
        miniPlayerState.preview!,
        metas: Metas(
          artist: miniPlayerState.name,
          image: MetasImage(
            path: miniPlayerState.imageUrl!,
            type: ImageType.network,
          ),
          title: miniPlayerState.title,
        ),
      ),
      showNotification: true,
    );
  }

  stopPlaying() async {
    return await _assetsAudioPlayer.playOrPause();
  }

  @override
  void dispose() {
    _assetsAudioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return BlocBuilder<MiniPlayerCubit, MiniPlayerState>(
      builder: (context, miniPlayerState) {
        return Offstage(
          offstage: !miniPlayerState.isShow!,
          child: TranslationAnimatedWidget.tween(
            enabled: miniPlayerState.isShow!,
            duration: const Duration(milliseconds: 200),
            translationDisabled: Offset(0, 80),
            translationEnabled: const Offset(0, 0),
            child: Miniplayer(
                minHeight: 75.0,
                maxHeight: 75.0,
                elevation: 30.0,
                builder: (hieght, precentage) {
                  return Container(
                    color: _theme.scaffoldBackgroundColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: Image.network(
                            miniPlayerState.imageUrl!,
                            height: 75.0,
                            width: 100.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 150.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                miniPlayerState.title!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                miniPlayerState.name!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50.0,
                          width: 50.0,
                          child: ClipOval(
                            child: Material(
                              color: _theme.accentColor, // Button color
                              child: InkWell(
                                splashColor: _theme
                                    .scaffoldBackgroundColor, // Splash color
                                onTap: () {
                                  if (_isPlay == false) {
                                    setState(() {
                                      _isPlay = true;

                                      openPlayer();
                                    });
                                  } else {
                                    setState(() {
                                      _isPlay = false;
                                    });
                                    stopPlaying();
                                  }
                                },
                                child: SizedBox(
                                  child: Icon(
                                    _isPlay! ? Icons.pause : Icons.play_arrow,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
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
                                      preview: '',
                                      title: '',
                                    ),
                                  ),
                          icon: RotatedBox(
                            quarterTurns: -1,
                            child: const Icon(
                              Icons.chevron_left,
                              color: Colors.white,
                              size: 20.0,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ),
        );
      },
    );
  }
}
