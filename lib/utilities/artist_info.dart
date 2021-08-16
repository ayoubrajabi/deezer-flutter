import 'package:deezer_flutter/data/models/search_model.dart';
import 'package:deezer_flutter/logic/logics.dart';

class ArtsitInfo {
  static List<SearchArtist> _artistDtat(SearchIsLoaded searchState) {
    final data = searchState.getRadio.data;
    return data!.map((info) => info.artist!).toSet().toList();
  }

  static List<String?> name(SearchIsLoaded searchState) {
    return _artistDtat(searchState).map((info) => info.name).toSet().toList();
  }

  static List<String?> imageUrl(SearchIsLoaded searchState) {
    return _artistDtat(searchState)
        .map((info) => info.pictureMedium!)
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
