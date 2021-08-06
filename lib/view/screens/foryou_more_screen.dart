import 'package:deezer_flutter/logic/logics.dart';
import 'package:deezer_flutter/view/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForYouMoreScreen extends StatelessWidget {
  const ForYouMoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final _radioState = context.watch<RadioBloc>().state;
        final _index = context.watch<ItemsIndexCubit>().state.index;

        if (_radioState is RadioIsLoading) {
          return const SizedBox(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (_radioState is RadioIsLoaded) {
          final _radioTracklist = _radioState.getRadio.data![_index].tracklist;
          final String _query =
              _radioTracklist!.replaceAll('https://api.deezer.com/', '');

          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                ViewMoreHeader(
                  radioIndex: _index,
                  radioState: _radioState,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: ViewMoreButtons(),
                ),
                SizedBox(
                  height: _radioState.getRadio.data!.length * 71.0,
                  width: double.infinity,
                  child: HotMusicsWidget(
                    query: _query,
                    value: '',
                    itemCount: _radioState.getRadio.data!.length,
                  ),
                ),
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
