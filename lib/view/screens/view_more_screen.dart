import 'package:deezer_flutter/logic/logics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewMoreScreen extends StatelessWidget {
  const ViewMoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final _radioState = context.watch<RadioBloc>().state;

        if (_radioState is RadioIsLoading) {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (_radioState is RadioIsLoaded) {
          return Column(
            children: [
              AppBar(
                title: Text(_radioState.getRadio.data![2].title!),
              ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}
