import 'package:deezer_flutter/data/models/models.dart';
import 'package:deezer_flutter/data/repositores/api_services.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

class MusicRepo {
  final Dio _dio = Dio();
  final APIService _apiService = APIService();

  Future<T> get<T>({
    @required String? endpoint,
    @required String? value,
    Map<String, dynamic>? query,
  }) async {
    final Uri uri = Uri.https(_apiService.baseUrl, endpoint!, query ?? null);
    final response =
        await _dio.get(uri.toString(), queryParameters: _apiService.headers);

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
    } else if (T == AlbumModel) {
      return AlbumModel.fromJson(response);
    } else if (T == SearchModel) {
      return SearchModel.fromJson(response);
    } else {
      return null;
    }
  }
}
