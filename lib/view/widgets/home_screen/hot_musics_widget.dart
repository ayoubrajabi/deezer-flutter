import 'package:deezer_flutter/logic/logics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets.dart';

class HotMusicsWidget extends StatefulWidget {
  const HotMusicsWidget({Key? key}) : super(key: key);

  @override
  _HotMusicsWidgetState createState() => _HotMusicsWidgetState();
}

class _HotMusicsWidgetState extends State<HotMusicsWidget> {
  @override
  void initState() {
    super.initState();
    final state = context.read<MusicBloc>().state;
    if (state is! MusicIsLoaded) {
      context.read<MusicBloc>().add(FeatchMusic('editorial/0/charts'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: BlocBuilder<MusicBloc, MusicState>(
        buildWhen: (preState, state) => preState != state,
        builder: (context, state) {
          if (state is MusicIsLoading) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 10,
              itemBuilder: (context, index) => LoadingWidget(
                height: 60.0,
                width: 300.0,
                icon: Icons.music_note,
                borderRadius: BorderRadius.circular(12.0),
                shape: BoxShape.rectangle,
              ),
            );
          } else if (state is MusicIsLoaded) {
            return ListView.builder(
              itemCount: state.getMusic.total,
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(10.0),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => HotMusicItems(
                index: index,
                state: state,
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
