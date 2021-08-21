import 'package:deezer_flutter/logic/logics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share/share.dart';

class CustomModalSheet extends StatelessWidget {
  CustomModalSheet({Key? key, @required this.url}) : super(key: key);

  final String? url;

  final bottomSheetItems = <String, IconData>{
    'Share': CupertinoIcons.share,
    'Go To Artist': CupertinoIcons.person,
    'Go To Album': CupertinoIcons.music_albums,
  };

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return BlocBuilder<MiniPlayerCubit, MiniPlayerState>(
      builder: (context, miniPlayerState) => AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: !miniPlayerState.isShow! ? 130.0 : 210.0,
        color: _theme.scaffoldBackgroundColor,
        child: Column(
          children: [
            SizedBox(
              height: 130.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: bottomSheetItems
                    .map(
                      (title, icon) => MapEntry(
                        title,
                        GestureDetector(
                          onTap: () {
                            if (title == 'Share') {
                              Share.share(url!);
                            }
                          },
                          child: Row(
                            children: [
                              const SizedBox(width: 20.0),
                              Icon(icon, color: _theme.accentColor),
                              const SizedBox(width: 30.0),
                              Text(
                                title,
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    .values
                    .toList(),
              ),
            ),
            Visibility(
              visible: miniPlayerState.isShow!,
              child: const SizedBox(
                height: 80.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
