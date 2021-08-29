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
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 260.0,
              width: 235.0,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(7.0),
                  topRight: Radius.circular(7.0),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(7.0),
                  topRight: Radius.circular(7.0),
                ),
                clipBehavior: Clip.antiAlias,
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: imgUrlXl!,
                  fit: BoxFit.cover,
                  height: 260.0,
                  width: 235.0,
                ),
              ),
            ),
            FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: imgUrlXl!,
              fit: BoxFit.cover,
              width: 235.0,
              height: 78.0,
            ).blurred(
              blur: 30.0,
              overlay: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                            fontSize: 11.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              blurColor: Colors.transparent,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(7.0),
                bottomRight: Radius.circular(7.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
