class RequsetFlim {
  String? title;
  String? year;
  String? imdbID;
  String? summary;
  String? rating;
  String? image;
  String? writer;
  String? actors;
  RequsetFlim.fromJson(Map<String, dynamic> json) {
    title = json["Title"];
    year = json["Year"];
    imdbID = json["imdbID"];
    summary = json["Plot"];
    rating = json["imdbRating"];
    image = json["Poster"];
    writer = json["Writer"];
    actors = json["Actors"];
  }

  @override
  String toString() {
    return 'Flim{poster: $title, imdbID: $image}';
  }
}
// class RequsetFlim {
//   String? title;
//   String? year;
//   String? imdbID;
//   String? summary;
//   String? rating;
//   String? image;
//   String? writer;

//   // Factory constructor to initialize object directly from JSON
//   RequsetFlim({
//     this.title,
//     this.year,
//     this.imdbID,
//     this.summary,
//     this.rating,
//     this.image,
//     this.writer,
//   });

//   // Method to create an object from JSON
//   factory RequsetFlim.fromJson(Map<String, dynamic> json) {
//     return RequsetFlim(
//       title: json["Title"],
//       year: json["Year"],
//       imdbID: json["imdbID"],
//       summary: json["Plot"],
//       rating: json["imdbRating"],
//       image: json["Poster"],
//       writer: json["Writer"],
//     );
//   }

//   // Custom toString method to print object details
//   @override
//   String toString() {
//     return 'RequsetFlim{title: $title, imdbID: $imdbID, image: $image}';
//   }
// }
