import 'package:meta/meta.dart';

class SearchModel {
  SearchModel({
    @required this.data,
    @required this.total,
    @required this.next,
  });

  final List<Search>? data;
  final int? total;
  final String? next;

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        data: List<Search>.from(json["data"].map((x) => Search.fromJson(x))),
        total: json["total"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "total": total,
        "next": next,
      };
}

class Search {
  Search({
    @required this.id,
    @required this.readable,
    @required this.title,
    @required this.titleShort,
    @required this.link,
    @required this.duration,
    @required this.rank,
    @required this.explicitLyrics,
    @required this.explicitContentLyrics,
    @required this.explicitContentCover,
    @required this.preview,
    @required this.md5Image,
    @required this.artist,
    @required this.album,
  });

  final int? id;
  final bool? readable;
  final String? title;
  final String? titleShort;
  final String? link;
  final int? duration;
  final int? rank;
  final bool? explicitLyrics;
  final int? explicitContentLyrics;
  final int? explicitContentCover;
  final String? preview;
  final String? md5Image;
  final SearchArtist? artist;
  final SearchAlbum? album;

  factory Search.fromJson(Map<String, dynamic> json) => Search(
        id: json["id"],
        readable: json["readable"],
        title: json["title"],
        titleShort: json["title_short"],
        link: json["link"],
        duration: json["duration"],
        rank: json["rank"],
        explicitLyrics: json["explicit_lyrics"],
        explicitContentLyrics: json["explicit_content_lyrics"],
        explicitContentCover: json["explicit_content_cover"],
        preview: json["preview"],
        md5Image: json["md5_image"],
        artist: SearchArtist.fromJson(json["artist"]),
        album: SearchAlbum.fromJson(json["album"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "readable": readable,
        "title": title,
        "title_short": titleShort,
        "link": link,
        "duration": duration,
        "rank": rank,
        "explicit_lyrics": explicitLyrics,
        "explicit_content_lyrics": explicitContentLyrics,
        "explicit_content_cover": explicitContentCover,
        "preview": preview,
        "md5_image": md5Image,
        "artist": artist!.toJson(),
        "album": album!.toJson(),
      };
}

class SearchAlbum {
  SearchAlbum({
    @required this.id,
    @required this.title,
    @required this.cover,
    @required this.coverSmall,
    @required this.coverMedium,
    @required this.coverBig,
    @required this.coverXl,
    @required this.md5Image,
    @required this.tracklist,
  });

  final int? id;
  final String? title;
  final String? cover;
  final String? coverSmall;
  final String? coverMedium;
  final String? coverBig;
  final String? coverXl;
  final String? md5Image;
  final String? tracklist;

  factory SearchAlbum.fromJson(Map<String, dynamic> json) => SearchAlbum(
        id: json["id"],
        title: json["title"],
        cover: json["cover"],
        coverSmall: json["cover_small"] == null ? null : json["cover_small"],
        coverMedium: json["cover_medium"] == null ? null : json["cover_medium"],
        coverBig: json["cover_big"] == null ? null : json["cover_big"],
        coverXl: json["cover_xl"] == null ? null : json["cover_xl"],
        md5Image: json["md5_image"],
        tracklist: json["tracklist"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "cover": cover,
        "cover_small": coverSmall == null ? null : coverSmall,
        "cover_medium": coverMedium == null ? null : coverMedium,
        "cover_big": coverBig == null ? null : coverBig,
        "cover_xl": coverXl == null ? null : coverXl,
        "md5_image": md5Image,
        "tracklist": tracklist,
      };
}

class SearchArtist {
  SearchArtist({
    @required this.id,
    @required this.name,
    @required this.link,
    @required this.picture,
    @required this.pictureSmall,
    @required this.pictureMedium,
    @required this.pictureBig,
    @required this.pictureXl,
    @required this.tracklist,
  });

  final int? id;
  final String? name;
  final String? link;
  final String? picture;
  final String? pictureSmall;
  final String? pictureMedium;
  final String? pictureBig;
  final String? pictureXl;
  final String? tracklist;

  factory SearchArtist.fromJson(Map<String, dynamic> json) => SearchArtist(
        id: json["id"],
        name: json["name"],
        link: json["link"],
        picture: json["picture"],
        pictureSmall: json["picture_small"],
        pictureMedium: json["picture_medium"],
        pictureBig: json["picture_big"],
        pictureXl: json["picture_xl"],
        tracklist: json["tracklist"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "link": link,
        "picture": picture,
        "picture_small": pictureSmall,
        "picture_medium": pictureMedium,
        "picture_big": pictureBig,
        "picture_xl": pictureXl,
        "tracklist": tracklist,
      };
}
