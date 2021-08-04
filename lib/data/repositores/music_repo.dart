import 'package:deezer_flutter/data/models/models.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:deezer_flutter/data/repositores/api_services.dart';

class MusicRepo {
  final Dio dio = Dio();

  Future<T> get<T>(
      {@required String? endpoint, @required String? value}) async {
    final Uri uri = Uri.https(APIService.baseUrl, endpoint!);
    final response =
        await dio.get(uri.toString(), queryParameters: APIService.headers);

    if (response.statusCode != 200) throw Exception('Failed to load json data');

    return fromJson<T>(response.data, value!);
  }

  fromJson<T>(Map<String, dynamic> response, String value) {
    if (T == RadioModel) {
      return RadioModel.fromJson(response[value]);
    } else if (T == ArtistModel) {
      return ArtistModel.fromJson(response[value]);
    } else if (T == MusicModel && value == 'tracks') {
      return MusicModel.fromJson(response[value]);
    } else if (T == MusicModel && value == '') {
      return MusicModel.fromJson(response);
    } else {
      return null;
    }
  }
}
