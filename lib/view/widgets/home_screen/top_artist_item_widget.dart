import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class TopArtistItem extends StatelessWidget {
  const TopArtistItem({
    Key? key,
    @required this.onTap,
    @required this.imgUrl,
  }) : super(key: key);
  final void Function()? onTap;
  final String? imgUrl;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90.0,
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: _theme.cardColor,
          shape: BoxShape.circle,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
            ),
          ],
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
    );
  }
}
