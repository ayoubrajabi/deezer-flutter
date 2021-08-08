import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

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
      child: Column(
        children: [
          Container(
            width: 130.0,
            margin: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: _theme.cardColor,
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(200.0),
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: imgUrl!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            artistName!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontSize: 11.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
