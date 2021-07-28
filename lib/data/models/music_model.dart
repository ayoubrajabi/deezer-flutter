import 'package:meta/meta.dart';

import './models.dart';

class MusicModel {
  MusicModel({
    this.musicData,
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
    @required this.title,
    @required this.link,
    @required this.duration,
    @required this.rank,
    @required this.preview,
    @required this.artist,
    @required this.album,
    @required this.type,
  });

  final int? id;
  final String? title;
  final String? link;
  final int? duration;
  final int? rank;
  final String? preview;
  final ArtistModel? artist;
  final Album? album;
  final String? type;

  factory MusicData.fromJson(Map<String, dynamic> json) => MusicData(
        id: json["id"],
        title: json["title"],
        link: json["link"],
        duration: json["duration"],
        rank: json["rank"],
        preview: json["preview"],
        artist: ArtistModel.fromJson(json["artist"]),
        album: Album.fromJson(json["album"]),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "link": link,
        "duration": duration,
        "rank": rank,
        "preview": preview,
        "artist": artist!.toJson(),
        "album": album!.toJson(),
        "type": type,
      };
}
