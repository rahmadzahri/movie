import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_drawer/page/popular_movie.dart';

class Repository {
  final _baseUrl =
      'https://api.themoviedb.org/3/movie/550?api_key=09ba0ab2e655efe8fdef97a093c53a57';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        print(response.body);
        Iterable it = jsonDecode(response.body);
        List<PopularMovies> movie =
            it.map((e) => PopularMovies.fromJson(e)).toList();
        return movie;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
