import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:blur/blur.dart';

class ForYouItems extends StatelessWidget {
  const ForYouItems({
    Key? key,
    @required this.onTap,
    @required this.imgUrlXl,
    @required this.imgUrlSmall,
    @required this.itemInfo,
  }) : super(key: key);

  final void Function()? onTap;
  final String? imgUrlXl;
  final String? imgUrlSmall;
  final List<String>? itemInfo;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: _theme.cardColor,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
              ),
              child: SizedBox(
                height: 290.0,
                width: double.infinity,
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: imgUrlXl!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Stack(
              children: [
                Image.network(
                  imgUrlSmall!,
                  height: 105.0,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ).blurred(
                  blur: 40.0,
                  blurColor: Colors.transparent,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12.0),
                    bottomRight: Radius.circular(12.0),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List<Padding>.generate(
                    3,
                    (itemsIndex) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          itemInfo![itemsIndex],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: itemsIndex == 0
                                  ? Colors.red.shade800
                                  : Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
