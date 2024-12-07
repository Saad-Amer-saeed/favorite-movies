import 'package:dio/dio.dart';
import 'package:favoritemovies/constants/strings.dart';

class RequsetFlimsWebServices {
  late Dio dio;

  RequsetFlimsWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrlForRequsetOneFilm,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20), // 20 seconds
      receiveTimeout: const Duration(seconds: 20), // 20 seconds
    );

    dio = Dio(options);
  }

  Future<Map<String, dynamic>> geRequsetflim(String endpoint) async {
    try {
      // Send GET request
      Response response = await dio.get(endpoint);

      // Access the 'Search' key from the response data
      Map<String, dynamic> rqusetfilm = response.data;

      return rqusetfilm;
    } catch (e) {
      print(e.toString());
      // Return an empty map on error
      return {}; // You can also throw an exception or return a default value
    }
  }
}
