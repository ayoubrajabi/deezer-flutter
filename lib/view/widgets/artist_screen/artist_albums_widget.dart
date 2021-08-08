import 'package:card_swiper/card_swiper.dart';
import 'package:deezer_flutter/logic/logics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets.dart';

class ArtistAlbumsWidget extends StatelessWidget {
  const ArtistAlbumsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.0,
      width: double.infinity,
      child: BlocBuilder<AlbumBloc, AlbumState>(
        builder: (context, albumState) {
          if (albumState is AlbumIsLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 3.0,
                color: Color(0xFFA15A66),
              ),
            );
          } else if (albumState is AlbumIsLoaded) {
            return Swiper(
              itemBuilder: (BuildContext context, int index) {
                return AlbumItemWidget(
                  imgUrl: albumState.album.album![index].coverBig!,
                );
              },
              itemHeight: 250.0,
              itemWidth: 250.0,
              loop: false,
              fade: 0.0,
              physics: const BouncingScrollPhysics(),
              viewportFraction: 0.55,
              scale: 0.7,
              curve: Curves.fastOutSlowIn,
              itemCount: albumState.album.album!.length,
              pagination: FractionPaginationBuilder(
                activeColor: Colors.white,
                color: Colors.white,
                fontSize: 14.0,
                activeFontSize: 14.0,
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
