import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../widgets.dart';

class HotMusicItems extends StatelessWidget {
  const HotMusicItems({
    Key? key,
    @required this.imgUrl,
    @required this.artistName,
    @required this.musicTitle,
    @required this.url,
    @required this.onTap,
  }) : super(key: key);
  final void Function()? onTap;
  final String? imgUrl;
  final String? musicTitle;
  final String? artistName;
  final String? url;

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
                    return CustomModalSheet(
                      url: url,
                    );
                  },
                );
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
