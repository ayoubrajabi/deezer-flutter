import 'package:flutter/material.dart';

class ArtistHeaderWidget extends StatelessWidget {
  const ArtistHeaderWidget({
    Key? key,
    @required this.index,
    @required this.imageUrl,
    @required this.artistName,
  }) : super(key: key);

  final int? index;
  final String? imageUrl;
  final String? artistName;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Image.network(
          imageUrl!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: 300.0,
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
        SizedBox(
          height: 300,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                artistName!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Container(
                height: _height * 0.08,
                width: _width * 0.38,
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
                      fontSize: 14.0,
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
