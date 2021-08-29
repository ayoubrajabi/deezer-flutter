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
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RepaintBoundary(
              child: ClipPath(
                clipper: TopArtistClipper(),
                clipBehavior: Clip.antiAlias,
                child: Container(
                  width: 100.0,
                  color: _theme.cardColor,
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
                fontSize: 10.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
