import 'package:meta/meta.dart';

class RadioModel {
  RadioModel({
    @required this.data,
  });

  final List<Datum2>? data;

  factory RadioModel.fromJson(Map<String, dynamic> json) => RadioModel(
        data: List<Datum2>.from(json["data"].map((x) => Datum2.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum2 {
  Datum2({
    @required this.id,
    @required this.title,
    @required this.picture,
    @required this.pictureSmall,
    @required this.pictureMedium,
    @required this.pictureBig,
    @required this.pictureXl,
    @required this.tracklist,
    @required this.md5Image,
    @required this.type,
  });

  final int? id;
  final String? title;
  final String? picture;
  final String? pictureSmall;
  final String? pictureMedium;
  final String? pictureBig;
  final String? pictureXl;
  final String? tracklist;
  final String? md5Image;
  final Type? type;

  factory Datum2.fromJson(Map<String, dynamic> json) => Datum2(
        id: json["id"],
        title: json["title"],
        picture: json["picture"],
        pictureSmall: json["picture_small"],
        pictureMedium: json["picture_medium"],
        pictureBig: json["picture_big"],
        pictureXl: json["picture_xl"],
        tracklist: json["tracklist"],
        md5Image: json["md5_image"],
        type: typeValues.map![json["type"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "picture": picture,
        "picture_small": pictureSmall,
        "picture_medium": pictureMedium,
        "picture_big": pictureBig,
        "picture_xl": pictureXl,
        "tracklist": tracklist,
        "md5_image": md5Image,
        "type": typeValues.reverse[type],
      };
}

enum Type { RADIO }

final typeValues = EnumValues({"radio": Type.RADIO});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
