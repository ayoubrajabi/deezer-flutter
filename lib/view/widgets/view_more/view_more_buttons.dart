import 'package:flutter/material.dart';

class ViewMoreButtons extends StatelessWidget {
  ViewMoreButtons({Key? key}) : super(key: key);

  final _buttonsItems = <IconData, String>{
    Icons.play_arrow: 'play',
    Icons.share: 'share',
  };

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    final double _height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: 80.0,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List<ElevatedButton>.generate(
          2,
          (index) => ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                index == 0 ? Colors.white : Colors.grey.shade700,
              ),
              padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(
                    vertical: _height * 0.023, horizontal: _width * 0.12),
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0),
                ),
              ),
            ),
            onPressed: () {},
            child: Row(
              children: [
                Icon(
                  _buttonsItems.keys.elementAt(index),
                  color: index == 0 ? Colors.black : Colors.white,
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Text(
                  _buttonsItems.values.elementAt(index),
                  style: TextStyle(
                    color: index == 0 ? Colors.black : Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
