import 'package:favoritemovies/movie/data/models/movie_model.dart';
import 'package:favoritemovies/movie/data/web_service/web_service.dart';

class RequsetFlimRepository {
  final RequsetFlimsWebServices requsetFlimsWebServices;

  RequsetFlimRepository(this.requsetFlimsWebServices);

  Future<RequsetFlim> geRequsetflim(String endpoint) async {
    // Get the response from the web service as a Map
    final response = await requsetFlimsWebServices.geRequsetflim(endpoint);

    // Convert the Map to a List of RequsetFlim objects
    final RequsetFlim films = RequsetFlim.fromJson(response);

    return films;
  }
}
