import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

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
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
              ),
              clipBehavior: Clip.antiAlias,
              child: Container(
                height: 270.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: _theme.cardColor,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: imgUrlXl!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Stack(
              children: [
                FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: imgUrlXl!,
                  fit: BoxFit.cover,
                  height: 105.0,
                  width: double.infinity,
                ).blurred(
                  blur: 30.0,
                  blurColor: Colors.transparent,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12.0),
                    bottomRight: Radius.circular(12.0),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: itemInfo!
                      .map(
                        (item) => Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            item,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: itemInfo![0] == item
                                  ? Colors.red.shade800
                                  : Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
