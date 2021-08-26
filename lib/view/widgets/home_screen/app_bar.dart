import 'package:beamer/beamer.dart';
import 'package:deezer_flutter/constants/constants.dart';
import 'package:deezer_flutter/logic/logics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeScreenAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      leading: null,
      title: Builder(builder: (context) {
        final _index = context.watch<ScreenChangeCubit>().state;
        final _tooltip = context.watch<NavbarTooltipCubit>().state;

        return Row(
          children: [
            Visibility(
              visible: _index == 2 || _index == 3,
              child: IconButton(
                onPressed: () {
                  if (_tooltip == 'Home') {
                    context.read<ScreenChangeCubit>().screenChanegeIndex(0);
                  }
                  if (_tooltip == 'Search') {
                    context.read<ScreenChangeCubit>().screenChanegeIndex(1);
                  }

                  context.beamBack();
                },
                icon: SvgPicture.asset(
                  IconsAsset.arrow,
                  color: Colors.white,
                ),
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              width: _index == 2 || _index == 3
                  ? MediaQuery.of(context).size.width - 130.0
                  : 130.0,
              child: SvgPicture.asset(
                IconsAsset.deezer,
                width: 130.0,
                cacheColorFilter: true,
              ),
            ),
          ],
        );
      }),
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

  @override
  Size get preferredSize => const Size(double.infinity, 60.0);
}
