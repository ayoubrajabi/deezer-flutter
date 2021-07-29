import 'package:meta/meta.dart';

class RadioModel {
  RadioModel({
    @required this.data,
    @required this.total,
  });

  final List<Datum2>? data;
  final int? total;

  factory RadioModel.fromJson(Map<String, dynamic> json) => RadioModel(
        data: List<Datum2>.from(json["data"].map((x) => Datum2.fromJson(x))),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "total": total,
      };
}

class Datum2 {
  Datum2({
    @required this.id,
    @required this.title,
    @required this.public,
    @required this.nbTracks,
    @required this.link,
    @required this.picture,
    @required this.pictureSmall,
    @required this.pictureMedium,
    @required this.pictureBig,
    @required this.pictureXl,
    @required this.checksum,
    @required this.tracklist,
    @required this.creationDate,
    @required this.md5Image,
    @required this.pictureType,
    @required this.user,
  });

  final int? id;
  final String? title;
  final bool? public;
  final int? nbTracks;
  final String? link;
  final String? picture;
  final String? pictureSmall;
  final String? pictureMedium;
  final String? pictureBig;
  final String? pictureXl;
  final String? checksum;
  final String? tracklist;
  final DateTime? creationDate;
  final String? md5Image;
  final String? pictureType;
  final User? user;

  factory Datum2.fromJson(Map<String, dynamic> json) => Datum2(
        id: json["id"],
        title: json["title"],
        public: json["public"],
        nbTracks: json["nb_tracks"],
        link: json["link"],
        picture: json["picture"],
        pictureSmall: json["picture_small"],
        pictureMedium: json["picture_medium"],
        pictureBig: json["picture_big"],
        pictureXl: json["picture_xl"],
        checksum: json["checksum"],
        tracklist: json["tracklist"],
        creationDate: DateTime.parse(json["creation_date"]),
        md5Image: json["md5_image"],
        pictureType: json["picture_type"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "public": public,
        "nb_tracks": nbTracks,
        "link": link,
        "picture": picture,
        "picture_small": pictureSmall,
        "picture_medium": pictureMedium,
        "picture_big": pictureBig,
        "picture_xl": pictureXl,
        "checksum": checksum,
        "tracklist": tracklist,
        "creation_date": creationDate!.toIso8601String(),
        "md5_image": md5Image,
        "picture_type": pictureType,
        "user": user!.toJson(),
      };
}

class User {
  User({
    @required this.id,
    @required this.name,
    @required this.tracklist,
  });

  final int? id;
  final String? name;
  final String? tracklist;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        tracklist: json["tracklist"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "tracklist": tracklist,
      };
}
