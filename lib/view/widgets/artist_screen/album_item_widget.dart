import 'package:flutter/material.dart';

class AlbumItemWidget extends StatelessWidget {
  const AlbumItemWidget({Key? key, @required this.imgUrl}) : super(key: key);
  final String? imgUrl;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Image.network(
          imgUrl!,
          fit: BoxFit.cover,
          width: 250.0,
          height: 250.0,
        ),
      ),
    );
  }
}
