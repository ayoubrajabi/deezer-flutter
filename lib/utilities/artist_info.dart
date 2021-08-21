import 'package:deezer_flutter/data/models/artist_model.dart';
import 'package:deezer_flutter/data/models/search_model.dart';
import 'package:deezer_flutter/logic/logics.dart';

class SearchArtsitInfo {
  static List<SearchArtist> _artistDtat(SearchIsLoaded searchState) {
    final data = searchState.getRadio.data;
    return data!.map((info) => info.artist!).toSet().toList();
  }

  static List<String?> name(SearchIsLoaded searchState) {
    return _artistDtat(searchState).map((info) => info.name).toSet().toList();
  }

  static List<String?> imageUrl(SearchIsLoaded searchState) {
    return _artistDtat(searchState)
        .map((info) => info.pictureBig!)
        .toSet()
        .toList();
  }

  static List<String?> trackList(SearchIsLoaded searchState) {
    return _artistDtat(searchState)
        .map((info) => info.tracklist!)
        .toSet()
        .toList();
  }

  static List<int?> id(SearchIsLoaded searchState) {
    return _artistDtat(searchState).map((info) => info.id!).toSet().toList();
  }

  static List<int?> artistId(SearchIsLoaded searchState) {
    return _artistDtat(searchState).map((info) => info.id!).toSet().toList();
  }
}

class ArtistInfo {
  static Artist artistDtat(ArtistIsLoaded artistState, int index) {
    final data = artistState.getArtist.data![index];
    return data;
  }

  static String trackListQuery(ArtistIsLoaded artistState, int index) {
    final String _query = artistDtat(artistState, index)
        .tracklist!
        .replaceAll('https://api.deezer.com/', '');
    final String _trackListQuery = _query.replaceAll('?limit=50', '');

    return _trackListQuery;
  }

  static int id(ArtistIsLoaded artistState, int index) {
    final int? id = artistDtat(artistState, index).id;
    return id!;
  }
}
