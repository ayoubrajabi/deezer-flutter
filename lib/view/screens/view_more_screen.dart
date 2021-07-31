import 'package:deezer_flutter/logic/logics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transparent_image/transparent_image.dart';

class ViewMoreScreen extends StatelessWidget {
  const ViewMoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: SizedBox(
                        height: 200.0,
                        width: 200.0,
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: _radioState
                              .getRadio.data![_radioIndex].pictureBig!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 1000.0,
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
