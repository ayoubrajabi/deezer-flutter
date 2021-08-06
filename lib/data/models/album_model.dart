import 'package:meta/meta.dart';

class AlbumModel {
  AlbumModel({
    @required this.album,
    @required this.total,
    @required this.next,
  });

  final List<Album>? album;
  final int? total;
  final String? next;

  factory AlbumModel.fromJson(Map<String, dynamic> json) => AlbumModel(
        album: List<Album>.from(json["data"].map((x) => Album.fromJson(x))),
        total: json["total"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(album!.map((x) => x.toJson())),
        "total": total,
        "next": next,
      };
}

class Album {
  Album({
    @required this.id,
    @required this.title,
    @required this.cover,
    @required this.coverSmall,
    @required this.coverMedium,
    @required this.coverBig,
    @required this.coverXl,
    @required this.tracklist,
  });

  final int? id;
  final String? title;
  final String? cover;
  final String? coverSmall;
  final String? coverMedium;
  final String? coverBig;
  final String? coverXl;
  final String? tracklist;

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        id: json["id"] ?? 0,
        title: json["title"] ?? '',
        cover: json["cover"] ?? '',
        coverSmall: json["cover_small"] ?? '',
        coverMedium: json["cover_medium"] ?? '',
        coverBig: json["cover_big"] ?? '',
        coverXl: json["cover_xl"] ?? '',
        tracklist: json["tracklist"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "cover": cover,
        "cover_small": coverSmall,
        "cover_medium": coverMedium,
        "cover_big": coverBig,
        "cover_xl": coverXl,
        "tracklist": tracklist,
      };
}
