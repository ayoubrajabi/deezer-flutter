import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: const [0.2, 0.3, 0.6, 0.7, 1.0],
          colors: [
            _theme.scaffoldBackgroundColor,
            _theme.scaffoldBackgroundColor.withAlpha(150),
            Colors.black45,
            Colors.black45,
            Colors.black45,
          ],
        ),
      ),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            toolbarHeight: 80.0,
            pinned: true,
            floating: true,
            elevation: 0.0,
            title: Text(
              'Search',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size(double.infinity, 86.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 15.0),
                child: TextField(
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
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 1000.0,
            ),
          ),
        ],
      ),
    );
  }
}
