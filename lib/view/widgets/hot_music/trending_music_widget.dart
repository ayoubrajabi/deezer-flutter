import 'package:deezer_flutter/logic/logics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets.dart';

class TreandingMusicsWidget extends StatefulWidget {
  const TreandingMusicsWidget({
    Key? key,
    @required this.query,
    @required this.value,
    @required this.itemCount,
  }) : super(key: key);

  final String? query;
  final String? value;
  final int? itemCount;

  @override
  _TreandingMusicsWidgetState createState() => _TreandingMusicsWidgetState();
}

class _TreandingMusicsWidgetState extends State<TreandingMusicsWidget> {
  @override
  void initState() {
    super.initState();
    final state = context.read<TreandMusicBloc>().state;
    if (state is! MusicIsLoaded) {
      context
          .read<TreandMusicBloc>()
          .add(FeatchMusic(widget.query!, widget.value!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: BlocBuilder<TreandMusicBloc, MusicState>(
        buildWhen: (preState, state) => preState != state,
        builder: (context, state) {
          if (state is MusicIsLoaded) {
            return ListView.builder(
              itemCount: widget.itemCount,
              padding: const EdgeInsets.all(10.0),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final _musicData = state.getMusic.data![index];

                return HotMusicItems(
                  imgUrl: _musicData.album!.coverMedium,
                  artistName: _musicData.artist!.name,
                  musicTitle: _musicData.title,
                  url: _musicData.link,
                  onTap: () => context.read<MiniPlayerCubit>().musicInfo(
                        MiniPlayerState(
                          imageUrl: _musicData.album!.coverMedium,
                          name: _musicData.artist!.name,
                          title: _musicData.title,
                          preview: _musicData.preview,
                          link: _musicData.link,
                          isShow: true,
                        ),
                      ),
                );
              },
            );
          }
          return ListView.builder(
            itemCount: 10,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => LoadingWidget(
              height: 60.0,
              width: 300.0,
              icon: Icons.music_note,
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12.0),
              shape: BoxShape.rectangle,
            ),
          );
        },
      ),
    );
  }
}
