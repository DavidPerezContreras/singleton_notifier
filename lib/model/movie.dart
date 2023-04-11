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
        title = json["title"],
        year = json["year"],
        poster = json["poster"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imdbID'] = this.imdbID;
    data['Title'] = this.title;
    data['Year'] = this.year;
    data['Poster'] = this.poster;
    return data;
  }
}
