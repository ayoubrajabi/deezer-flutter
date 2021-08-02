import 'package:deezer_flutter/logic/logics.dart';
import 'package:deezer_flutter/view/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewMoreScreen extends StatelessWidget {
  const ViewMoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final _theme = Theme.of(context);
    return Builder(
      builder: (context) {
        final _radioState = context.watch<RadioBloc>().state;
        final _radioIndex = context.watch<ForyouIndexCubit>().state.index;

        if (_radioState is RadioIsLoading) {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (_radioState is RadioIsLoaded) {
          final _radioStateData = _radioState.getRadio.data![_radioIndex];
          final String? _query = _radioStateData.tracklist!
              .replaceAll('https://api.deezer.com/', '');
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                ViewMoreHeader(
                  radioIndex: _radioIndex,
                  radioState: _radioState,
                ),
                ViewMoreButtons(),
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
