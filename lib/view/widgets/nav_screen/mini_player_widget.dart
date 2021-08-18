import 'package:deezer_flutter/logic/logics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:animated_widgets/animated_widgets.dart';

class MiniPlayerWidget extends StatelessWidget {
  const MiniPlayerWidget({Key? key}) : super(key: key);

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
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                _theme.accentColor,
                              ),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(200.0),
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
                          icon: RotatedBox(
                            quarterTurns: -1,
                            child: Center(
                              child: const Icon(
                                Icons.chevron_left,
                                color: Colors.white,
                                size: 20.0,
                              ),
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
