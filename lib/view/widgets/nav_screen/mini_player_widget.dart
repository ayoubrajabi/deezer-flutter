import 'package:deezer_flutter/logic/logics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniplayer/miniplayer.dart';

class MiniPlayerWidget extends StatelessWidget {
  const MiniPlayerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return BlocBuilder<MiniPlayerCubit, MiniPlayerState>(
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
    );
  }
}
