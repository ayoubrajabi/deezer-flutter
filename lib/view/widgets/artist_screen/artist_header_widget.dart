import 'package:deezer_flutter/logic/logics.dart';
import 'package:flutter/material.dart';

class ArtistHeaderWidget extends StatelessWidget {
  const ArtistHeaderWidget({
    Key? key,
    @required this.index,
    @required this.artistState,
  }) : super(key: key);

  final int? index;
  final ArtistIsLoaded? artistState;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Image.network(
          artistState!.getArtist.data![index!].pictureXl!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: 300,
        ),
        Positioned(
          bottom: 0.0,
          right: 0.0,
          left: 0.0,
          top: 0.0,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color(0xFF191018),
                  Color(0xFF191018),
                  Color(0xFF191018).withOpacity(0.9),
                  Color(0xFF191018).withOpacity(0.7),
                  Color(0xFF191018).withOpacity(0.5),
                  Color(0xFF191018).withOpacity(0.3),
                  Colors.transparent,
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 300,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                artistState!.getArtist.data![index!].name!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Container(
                height: _height * 0.085,
                width: _width * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45.0),
                  gradient: LinearGradient(
                    colors: [
                      _theme.accentColor,
                      const Color(0xff733E46),
                    ],
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xff733E46),
                      blurRadius: 5.0,
                    )
                  ],
                ),
                child: MaterialButton(
                  onPressed: () {},
                  shape: const StadiumBorder(),
                  child: const Text(
                    'play',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
