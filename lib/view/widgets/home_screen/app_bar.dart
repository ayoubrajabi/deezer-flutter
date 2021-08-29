import 'package:beamer/beamer.dart';
import 'package:deezer_flutter/constants/constants.dart';
import 'package:deezer_flutter/view/screens/home_screen.dart';
import 'package:deezer_flutter/view/screens/screens.dart';
import 'package:deezer_flutter/view/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreenAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeScreenAppBar({
    Key? key,
    @required this.beamerKey,
  }) : super(key: key);

  final GlobalKey<BeamerState>? beamerKey;

  @override
  _HomeScreenAppBarState createState() => _HomeScreenAppBarState();

  @override
  Size get preferredSize => const Size(double.infinity, 60.0);
}

class _HomeScreenAppBarState extends State<HomeScreenAppBar> {
  late BeamerDelegate _beamerDelegate;

  void _setStateListener() => setState(() {});

  @override
  void initState() {
    super.initState();
    _beamerDelegate = widget.beamerKey!.currentState!.routerDelegate;
    _beamerDelegate.addListener(_setStateListener);
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final String _path = _beamerDelegate.state.uri.pathSegments.first;

    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      leading: null,
      title: Row(
        children: [
          Visibility(
            visible: _path == 'artistHome' ||
                _path == 'artistSearch' ||
                _path == 'ForYou',
            child: IconButton(
              onPressed: () {
                if (_path == 'artistHome' || _path == 'ForYou') {
                  return _beamerDelegate.beamToNamed(HomeScreen.path);
                }

                return _beamerDelegate.beamToNamed(SearchScreen.path);
              },
              icon: SvgPicture.asset(
                IconsAsset.arrow,
                color: Colors.white,
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: _path == 'artistHome' ||
                    _path == 'artistSearch' ||
                    _path == 'ForYou'
                ? MediaQuery.of(context).size.width - 130.0
                : 130.0,
            child: SvgPicture.asset(
              IconsAsset.deezer,
              width: 130.0,
              cacheColorFilter: true,
            ),
          ),
        ],
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: _theme.scaffoldBackgroundColor,
              blurRadius: 50.0,
              offset: const Offset(0, -10),
              spreadRadius: 20.0,
            ),
          ],
          border: const Border(
            bottom: BorderSide(
              color: Colors.white10,
            ),
          ),
        ),
      ),
    );
  }
}
