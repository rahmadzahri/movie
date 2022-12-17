class PopularMovies {
  String page;
  String totalResults;
  String totalPages;
  List<Results> results;

  PopularMovies({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory PopularMovies.fromJson(Map<String, dynamic> json) {
    return PopularMovies(
        page: json['page'],
        results: json['results'],
        totalPages: json['total_pages'],
        totalResults: json['total_results']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = this.page;
    data['total_results'] = this.totalResults;
    data['total_pages'] = this.totalPages;
    if (this.results != null) {
      data['results'] = this.results.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Results {
  double popularity;
  int voteCount;
  bool video;
  String posterPath;
  int id;
  bool adult;

  String backdropPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String title;
  double voteAverage;
  String overview;
  String releaseDate;

  Results(
      {required this.popularity,
      required this.voteCount,
      required this.video,
      required this.posterPath,
      required this.id,
      required this.adult,
      required this.backdropPath,
      required this.originalLanguage,
      required this.originalTitle,
      required this.genreIds,
      required this.title,
      required this.voteAverage,
      required this.overview,
      required this.releaseDate});

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
        popularity: json['popularity'],
        voteCount: json['vote_count'],
        video: json['video'],
        posterPath: json['poster_path'],
        id: json['id'],
        adult: json['adult'],
        backdropPath: json['backdrop_path'],
        originalLanguage: json['original_language'],
        originalTitle: json['original_title'],
        genreIds: json['genre_ids'].cast<int>(),
        title: json['title'],
        voteAverage: json['vote_average'].toDouble(),
        overview: json['overview'],
        releaseDate: json['release_date']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['popularity'] = this.popularity;
    data['vote_count'] = this.voteCount;
    data['video'] = this.video;
    data['poster_path'] = this.posterPath;
    data['id'] = this.id;
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['genre_ids'] = this.genreIds;
    data['title'] = this.title;
    data['vote_average'] = this.voteAverage;
    data['overview'] = this.overview;
    data['release_date'] = this.releaseDate;
    return data;
  }
}
