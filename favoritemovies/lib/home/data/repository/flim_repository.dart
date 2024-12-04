import 'package:favoritemovies/home/data/models/flim.dart';
import 'package:favoritemovies/home/data/web_service/filim_web_services.dart';

class FlimsRepository {
  final FlimsWebServices flimsWebServices;

  FlimsRepository(this.flimsWebServices);

  Future<List<Flim>> getAllFlims() async {
    final characters = await flimsWebServices.getAllFlims();
    return characters.map((flim) => Flim.fromJson(flim)).toList();
  }

  // Future<List<Quote>> getCharacterQuotes(String charName) async {
  //   final quotes = await charactersWebServices.getCharacterQuotes(charName);
  //   return quotes.map((charQuotes) => Quote.fromJson(charQuotes)).toList();
  // }
}
