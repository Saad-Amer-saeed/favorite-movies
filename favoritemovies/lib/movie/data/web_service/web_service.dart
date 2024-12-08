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
      Response response = await dio.get(endpoint);

      Map<String, dynamic> rqusetfilm = response.data;

      return rqusetfilm;
    } catch (e) {
      return {};
    }
  }
}
