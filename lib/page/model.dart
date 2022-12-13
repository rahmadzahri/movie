class Movie {
  final String title, trailers, released_date, description, genre;

  const Movie(
      {required this.title,
      required this.trailers,
      required this.released_date,
      required this.description,
      required this.genre});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'],
      trailers: json['trailers'],
      released_date: json['released date'],
      description: json['description'],
      genre: json['genre'],
    );
  }
}
