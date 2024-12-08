import 'package:favoritemovies/home/data/models/flim.dart';
import 'package:favoritemovies/home/data/web_service/filim_web_services.dart';

class FlimsRepository {
  final FlimsWebServices flimsWebServices;

  FlimsRepository(this.flimsWebServices);

  Future<List<Flim>> getAllFlims(String endpoint) async {
    final characters = await flimsWebServices.getAllFlims(endpoint);
    return characters.map((flim) => Flim.fromJson(flim)).toList();
  }
}
