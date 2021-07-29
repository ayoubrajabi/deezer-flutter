import 'package:meta/meta.dart';
import 'dart:convert';

ArtistModel artistModelFromJson(String str) =>
    ArtistModel.fromJson(json.decode(str));

String artistModelToJson(ArtistModel data) => json.encode(data.toJson());

class ArtistModel {
  ArtistModel({
    @required this.data,
    @required this.total,
  });

  final List<Datum3>? data;
  final int? total;

  factory ArtistModel.fromJson(Map<String, dynamic> json) => ArtistModel(
        data: List<Datum3>.from(json["data"].map((x) => Datum3.fromJson(x))),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "total": total,
      };
}

class Datum3 {
  Datum3({
    @required this.id,
    @required this.name,
    @required this.link,
    @required this.picture,
    @required this.pictureSmall,
    @required this.pictureMedium,
    @required this.pictureBig,
    @required this.pictureXl,
    @required this.radio,
    @required this.tracklist,
    @required this.position,
  });

  final int? id;
  final String? name;
  final String? link;
  final String? picture;
  final String? pictureSmall;
  final String? pictureMedium;
  final String? pictureBig;
  final String? pictureXl;
  final bool? radio;
  final String? tracklist;
  final int? position;

  factory Datum3.fromJson(Map<String, dynamic> json) => Datum3(
        id: json["id"],
        name: json["name"],
        link: json["link"],
        picture: json["picture"],
        pictureSmall: json["picture_small"],
        pictureMedium: json["picture_medium"],
        pictureBig: json["picture_big"],
        pictureXl: json["picture_xl"],
        radio: json["radio"],
        tracklist: json["tracklist"],
        position: json["position"],
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
        "radio": radio,
        "tracklist": tracklist,
        "position": position,
      };
}
