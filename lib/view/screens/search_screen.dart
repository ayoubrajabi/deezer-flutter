import 'package:deezer_flutter/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            _theme.scaffoldBackgroundColor,
            Colors.black45,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Search',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            TextField(
              decoration: InputDecoration(
                fillColor: Colors.white10,
                hintText: 'Search Artists, Albums, Tracks ...',
                hintStyle: TextStyle(
                  color: Colors.white54,
                  fontSize: 14.0,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(
                    color: Colors.white54,
                    width: 0.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                filled: true,
              ),
            ),
            const SizedBox(
              height: 200.0,
            ),
            Center(
              child: Opacity(
                opacity: 0.7,
                child: SvgPicture.asset(
                  IconsAsset.deezerIcon,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
