import 'package:deezer_flutter/logic/logics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            'For You',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ),
        SizedBox(
          height: 400,
          width: MediaQuery.of(context).size.width,
          child: ForYouWidget(),
        ),
      ],
    );
  }
}

class ForYouWidget extends StatelessWidget {
  const ForYouWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<RadioBloc>().add(FeatchRadio('radio'));
    final _theme = Theme.of(context);
    return SizedBox(
      child: BlocConsumer<RadioBloc, RadioState>(
        listener: (context, radioState) {
          if (radioState is RadioError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: _theme.cardColor,
                content: Text('Connection field!'),
              ),
            );
          }
        },
        builder: (context, radioState) {
          if (radioState is RadioIsLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (radioState is RadioIsLoaded) {
            return ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => Container(
                height: 250.0,
                width: 300.0,
                margin: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: _theme.cardColor,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: radioState.getRadio.data![index].pictureBig!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
