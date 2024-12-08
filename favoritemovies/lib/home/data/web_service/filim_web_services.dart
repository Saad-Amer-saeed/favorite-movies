import 'package:dio/dio.dart';
import 'package:favoritemovies/constants/strings.dart';

class FlimsWebServices {
  late Dio dio;

  FlimsWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrlForFeachAllFilm,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20), // 20 seconds
      receiveTimeout: const Duration(seconds: 20), // 20 seconds
    );

    dio = Dio(options);
  }

  Future<List<dynamic>> getAllFlims(String endpoint) async {
    try {
      Response response = await dio.get(endpoint);

      List<dynamic> searchResults = response.data['Search'] ?? [];

      return searchResults;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
