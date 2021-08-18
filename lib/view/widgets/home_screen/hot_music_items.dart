import 'package:deezer_flutter/logic/logics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transparent_image/transparent_image.dart';

class HotMusicItems extends StatelessWidget {
  const HotMusicItems({
    Key? key,
    @required this.imgUrl,
    @required this.artistName,
    @required this.musicTitle,
    @required this.onTap,
  }) : super(key: key);
  final void Function()? onTap;
  final String? imgUrl;
  final String? musicTitle;
  final String? artistName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.0,
        width: double.infinity,
        margin: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 50.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: imgUrl!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15.0,
                ),
                SizedBox(
                  width: 150.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List<Text>.generate(
                      2,
                      (textIndex) => Text(
                        textIndex == 0 ? musicTitle! : artistName!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: textIndex == 0 ? Colors.white : Colors.grey,
                          fontWeight: textIndex == 0
                              ? FontWeight.bold
                              : FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (widget) {
                      return CustomModalSheet();
                    });
              },
              icon: const Icon(
                Icons.more_vert,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomModalSheet extends StatelessWidget {
  CustomModalSheet({Key? key}) : super(key: key);

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
                        Row(
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
