class Flim {
  String? poster;
  String? imdbID;

  Flim({this.poster, this.imdbID}); // Constructor

  Flim.fromJson(Map<String, dynamic> json) {
    poster = json["Poster"];
    imdbID = json["imdbID"];
  }

  @override
  String toString() {
    return 'Flim{poster: $poster, imdbID: $imdbID}';
  }
}
