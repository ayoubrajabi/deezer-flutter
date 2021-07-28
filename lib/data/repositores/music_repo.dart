import 'package:deezer_flutter/data/models/models.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:deezer_flutter/data/repositores/api_services.dart';

class MusicRepo {
  final Dio dio = Dio();

  Future<dynamic> get({
    @required String? endpoint,
    @required String? getKey,
  }) async {
    Uri uri = Uri.https(APIService.baseUrl, endpoint!);
    print(uri);
    final response =
        await dio.get(uri.toString(), queryParameters: APIService.headers);
    if (response.statusCode != 200)
      throw Exception('Failed to load json data');
    else if (getKey! == 'music') return parsedMusicJson(response.data);

    return parsedRadioJson(response.data);

    // return {
    //   MusicModel: parsedMusicJson(response.data),
    //   RadioModel: parsedRadioJson(response.data),
    // };
  }

  MusicModel? parsedMusicJson(Map<String, dynamic> response) {
    print(response);
    return MusicModel.fromJson(response);
  }

  RadioModel? parsedRadioJson(Map<String, dynamic> response) {
    print(response);
    return RadioModel.fromJson(response);
  }
}
