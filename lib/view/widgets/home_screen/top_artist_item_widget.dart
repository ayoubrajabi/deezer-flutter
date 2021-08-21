import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../widgets.dart';

class TopArtistItem extends StatelessWidget {
  const TopArtistItem({
    Key? key,
    @required this.onTap,
    @required this.imgUrl,
    @required this.artistName,
  }) : super(key: key);
  final void Function()? onTap;
  final String? imgUrl;
  final String? artistName;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipPath(
              clipper: TopArtistClipper(),
              child: Container(
                width: 120.0,
                color: _theme.cardColor,
                child: ClipPath(
                  clipper: TopArtistClipper(),
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: imgUrl!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Text(
              artistName!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
