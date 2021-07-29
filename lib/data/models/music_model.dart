import 'package:meta/meta.dart';

import 'models.dart';

class MusicModel {
  MusicModel({
    @required this.data,
    @required this.total,
  });

  final List<Tracks>? data;
  final int? total;

  factory MusicModel.fromJson(Map<String, dynamic> json) => MusicModel(
        data: List<Tracks>.from(json["data"].map((x) => Tracks.fromJson(x))),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "total": total,
      };
}

class Tracks {
  Tracks({
    @required this.id,
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
    @required this.position,
    @required this.artist,
    @required this.album,
  });

  final int? id;
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
  final int? position;
  final Artist? artist;
  final Album? album;

  factory Tracks.fromJson(Map<String, dynamic> json) => Tracks(
        id: json["id"],
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
        position: json["position"],
        artist: Artist.fromJson(json["artist"]),
        album: Album.fromJson(json["album"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
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
        "position": position,
        // "artist": artist!.toJson(),
        "album": album!.toJson(),
      };
}
