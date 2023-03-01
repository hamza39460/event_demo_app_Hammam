import 'package:dio/dio.dart';

class APIManager {
  APIManager._internal();

  factory APIManager() => _selfInstance;

  static final APIManager _selfInstance = APIManager._internal();

  Dio _dio = Dio();

  static const _apiKey =
      "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzA4ODI1Mzg5LCJpYXQiOjE2NzcyODkzODksImp0aSI6ImM1MTM2MzMwZWJkZDQyYTRiOTZhMTU3OGZjNGI3ZTczIiwidXNlcl9pZCI6MjQ0OX0.uJgdWbbHdBWwVImt8XM8UKMEMkuUuGvGXF0Qkl0D0Tw";

  Future<Response> get(String url) async {
    try {
      return await _dio.get(
        url,
        options: Options(
          headers: {
            "Authorization": _apiKey,
          },
        ),
      );
    } catch (e) {
      rethrow;
    }
  }
}
