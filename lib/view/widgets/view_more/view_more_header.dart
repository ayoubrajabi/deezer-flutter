import 'dart:ui';

import 'package:deezer_flutter/logic/logics.dart';
import 'package:flutter/material.dart';

class ViewMoreHeader extends StatelessWidget {
  const ViewMoreHeader(
      {Key? key, @required this.radioState, @required this.radioIndex})
      : super(key: key);
  final RadioIsLoaded? radioState;
  final int? radioIndex;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _radioData = radioState!.getRadio.data![radioIndex!];

    return ClipRRect(
      child: Container(
        height: 350.0,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              _radioData.pictureBig!,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 60.0, sigmaY: 60.0),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 5.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    // color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: _theme.scaffoldBackgroundColor,
                        blurRadius: 60.0,
                        spreadRadius: 100.0,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 180.0,
                    width: 180.0,
                    margin: const EdgeInsets.only(top: 30.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.0),
                        image: DecorationImage(
                          image: NetworkImage(
                            _radioData.pictureBig!,
                          ),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color:
                                _theme.scaffoldBackgroundColor.withAlpha(100),
                            blurRadius: 5.0,
                          )
                        ]),
                  ),
                  Text(
                    _radioData.title!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'by ${_radioData.user!.name!}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${_radioData.nbTracks!} TRACKS',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
