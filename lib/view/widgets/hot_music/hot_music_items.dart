import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../widgets.dart';

class HotMusicItems extends StatelessWidget {
  HotMusicItems({
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
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: 45.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: imgUrl!,
                      fit: BoxFit.cover,
                      width: 50.0,
                    ),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  SizedBox(
                    width: 200.0,
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
                            fontSize: 12.0,
                            fontWeight: textIndex == 0
                                ? FontWeight.w600
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
      ),
    );
  }
}
