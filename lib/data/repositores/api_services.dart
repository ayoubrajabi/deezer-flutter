class APIService {
  static const String baseUrl = 'api.deezer.com';

  static const Map<String, String> headers = {
    "content-type": "application/json",
    'x-rapidapi-host': baseUrl,
  };
}
