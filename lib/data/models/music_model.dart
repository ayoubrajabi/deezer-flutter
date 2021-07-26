import 'package:meta/meta.dart';

import './models.dart';

class MusicModel {
  MusicModel({
    @required this.musicData,
  });

  final List<MusicData>? musicData;

  factory MusicModel.fromJson(Map<String, dynamic> json) => MusicModel(
        musicData: List<MusicData>.from(
            json["data"].map((x) => MusicData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(musicData!.map((x) => x.toJson())),
      };
}

class MusicData {
  MusicData({
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
    @required this.type,
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
  final Artist? artist;
  final Album? album;
  final String? type;

  factory MusicData.fromJson(Map<String, dynamic> json) => MusicData(
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
        artist: Artist.fromJson(json["artist"]),
        album: Album.fromJson(json["album"]),
        type: json["type"],
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
        "type": type,
      };
}
