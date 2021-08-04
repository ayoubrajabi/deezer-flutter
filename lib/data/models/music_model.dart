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
    @required this.link,
    @required this.duration,
    @required this.rank,
    @required this.preview,
    @required this.position,
    @required this.artist,
    @required this.album,
  });

  final int? id;
  final String? title;
  final String? link;
  final int? duration;
  final int? rank;
  final String? preview;
  final int? position;
  final Artist? artist;
  final Album? album;

  factory Tracks.fromJson(Map<String, dynamic> json) => Tracks(
        id: json["id"],
        title: json["title"],
        link: json["link"],
        duration: json["duration"],
        rank: json["rank"],
        preview: json["preview"],
        position: json["position"],
        artist: Artist.fromJson(json["artist"]),
        album: Album.fromJson(json["album"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "link": link,
        "duration": duration,
        "rank": rank,
        "preview": preview,
        "position": position,
        // "artist": artist!.toJson(),
        "album": album!.toJson(),
      };
}
