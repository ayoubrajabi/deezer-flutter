import 'package:blur/blur.dart';
import 'package:deezer_flutter/logic/logics.dart';
import 'package:flutter/material.dart';

class ViewMoreHeader extends StatelessWidget {
  const ViewMoreHeader({
    Key? key,
    @required this.radioState,
    @required this.radioIndex,
  }) : super(key: key);

  final RadioIsLoaded? radioState;
  final int? radioIndex;

  @override
  Widget build(BuildContext context) {
    final _radioData = radioState!.getRadio.data![radioIndex!];

    return Stack(
      children: [
        Image.network(
          _radioData.pictureMedium!,
          fit: BoxFit.cover,
          height: 300,
          width: double.infinity,
        ).blurred(
          blur: 30.0,
          blurColor: Colors.transparent,
        ),
        Positioned.fill(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  const Color(0xFF1C111B),
                  const Color(0xFF1C111B),
                  const Color(0xFF1C111B).withAlpha(220),
                  const Color(0xFF1C111B).withAlpha(150),
                  const Color(0xFF1C111B).withAlpha(100),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 150.0,
                width: 150.0,
                margin: const EdgeInsets.only(top: 30.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  image: DecorationImage(
                    image: NetworkImage(
                      _radioData.pictureMedium!,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                _radioData.title!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'by ${_radioData.user!.name!}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${_radioData.nbTracks!} TRACKS',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 10.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
