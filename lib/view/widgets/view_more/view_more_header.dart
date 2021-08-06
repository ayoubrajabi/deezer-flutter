import 'package:deezer_flutter/logic/logics.dart';
import 'package:flutter/material.dart';
import 'package:blur/blur.dart';

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
          _radioData.pictureBig!,
          fit: BoxFit.cover,
          height: 300,
          width: double.infinity,
        ).blurred(
          blur: 30.0,
          blurColor: Colors.transparent,
        ),
        Positioned(
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          child: Container(
            height: 5.0,
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFF2C1B2A),
                  blurRadius: 60.0,
                  spreadRadius: 100.0,
                ),
              ],
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
                        _radioData.pictureBig!,
                      ),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5.0,
                      )
                    ]),
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
