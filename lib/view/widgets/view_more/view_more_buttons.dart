import 'package:flutter/material.dart';

class ViewMoreButtons extends StatelessWidget {
  ViewMoreButtons({Key? key}) : super(key: key);

  final _buttonsItems = <IconData, String>{
    Icons.play_arrow: 'play',
    Icons.share: 'share',
  };

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: _buttonsItems
          .map(
            (icon, title) => MapEntry(
              icon,
              Container(
                height: _height * 0.075,
                width: _width * 0.24,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45.0),
                  gradient: LinearGradient(
                    colors: title == 'play'
                        ? [
                            _theme.accentColor,
                            const Color(0xff733E46),
                          ]
                        : [
                            const Color(0xFFbeb9be),
                            const Color(0xFFbeb9be).withAlpha(160),
                          ],
                  ),
                ),
                child: MaterialButton(
                  onPressed: () {},
                  shape: const StadiumBorder(),
                  child: Row(
                    children: [
                      const Spacer(
                        flex: 3,
                      ),
                      Icon(
                        icon,
                        color: Colors.white,
                      ),
                      const Spacer(),
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                        ),
                      ),
                      const Spacer(
                        flex: 3,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
          .values
          .toList(),
    );
  }
}
