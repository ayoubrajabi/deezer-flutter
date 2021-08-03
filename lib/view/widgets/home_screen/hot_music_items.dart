import 'package:deezer_flutter/logic/logics.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class HotMusicItems extends StatelessWidget {
  const HotMusicItems({Key? key, @required this.index, @required this.state})
      : super(key: key);
  final int? index;
  final MusicIsLoaded? state;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: double.infinity,
      margin: const EdgeInsets.all(10.0),
      child: MaterialButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
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
                      image:
                          state!.getMusic.data![index!].artist!.pictureSmall!,
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
                        textIndex == 0
                            ? state!.getMusic.data![index!].title!
                            : state!.getMusic.data![index!].artist!.name!,
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
              onPressed: () {},
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
