import 'package:deezer_flutter/logic/logics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transparent_image/transparent_image.dart';

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
    final _theme = Theme.of(context);
    return SizedBox(
      child: BlocBuilder<MusicBloc, MusicState>(
        builder: (context, state) {
          if (state is MusicIsLoading) {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) => LoadingWidget(
                      height: 130.0,
                      width: 110.0,
                      icon: Icons.person,
                      shape: BoxShape.circle,
                    ));
          } else if (state is MusicIsLoaded) {
            return ListView.builder(
                itemCount: state.getMusic.total,
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.all(10.0),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    height: 50.0,
                    width: double.infinity,
                    margin: const EdgeInsets.all(10.0),
                    child: MaterialButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 50.0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: FadeInImage.memoryNetwork(
                                    placeholder: kTransparentImage,
                                    image: state.getMusic.data![index].artist!
                                        .pictureSmall!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 15.0,
                              ),
                              SizedBox(
                                width: 150.0,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: List<Text>.generate(
                                    2,
                                    (textIndex) => Text(
                                      textIndex == 0
                                          ? state.getMusic.data![index].title!
                                          : state.getMusic.data![index].artist!
                                              .name!,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: textIndex == 0
                                            ? Colors.white
                                            : Colors.grey,
                                        fontWeight: textIndex == 0
                                            ? FontWeight.bold
                                            : FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.more_vert,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }
          return const SizedBox();
        },
      ),
    );
  }
}
