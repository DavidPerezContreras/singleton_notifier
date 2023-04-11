class Movie {
  String imdbID;
  String title;
  String year;
  String poster;

  Movie(
      {required this.imdbID,
      required this.title,
      required this.year,
      required this.poster});

  Movie.fromJson(Map<String, dynamic> json)
      : imdbID = json["imdbID"],
        title = json["Title"],
        year = json["Year"],
        poster = json["Poster"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imdbID'] = imdbID;
    data['Title'] = title;
    data['Year'] = year;
    data['Poster'] = poster;
    return data;
  }
}
