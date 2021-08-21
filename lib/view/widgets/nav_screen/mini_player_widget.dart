import 'package:animated_widgets/animated_widgets.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:deezer_flutter/logic/logics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniplayer/miniplayer.dart';

class MiniPlayerWidget extends StatefulWidget {
  const MiniPlayerWidget({Key? key}) : super(key: key);

  @override
  _MiniPlayerWidgetState createState() => _MiniPlayerWidgetState();
}

class _MiniPlayerWidgetState extends State<MiniPlayerWidget> {
  bool? _isPlay = false;

  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> openPlayer() async {
    final miniPlayerState = context.read<MiniPlayerCubit>().state;

    await _audioPlayer.play(
      miniPlayerState.preview!,
    );

    _audioPlayer.onPlayerCompletion.listen((event) {
      setState(() {
        _isPlay = false;
      });
    });
  }

  Future<int> stopPlaying() async {
    return _audioPlayer.stop();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return BlocConsumer<MiniPlayerCubit, MiniPlayerState>(
      listener: (context, miniPlayerState) {
        openPlayer();
        setState(() {
          _isPlay = true;
        });
      },
      builder: (context, miniPlayerState) {
        return Offstage(
          offstage: !miniPlayerState.isShow!,
          child: TranslationAnimatedWidget.tween(
            enabled: miniPlayerState.isShow!,
            duration: const Duration(milliseconds: 200),
            translationDisabled: const Offset(0, 80),
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
                      Image.network(
                        miniPlayerState.imageUrl!,
                        height: 75.0,
                        width: 100.0,
                        fit: BoxFit.cover,
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
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              miniPlayerState.name!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
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
                                  const MiniPlayerState(
                                    isShow: false,
                                    imageUrl: '',
                                    name: '',
                                    preview: '',
                                    link: '',
                                    title: '',
                                  ),
                                ),
                        icon: const RotatedBox(
                          quarterTurns: -1,
                          child: Icon(
                            Icons.chevron_left,
                            color: Colors.white,
                            size: 20.0,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
