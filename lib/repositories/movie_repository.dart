import 'package:dio/dio.dart';
import 'package:showmax_clone/models/movie.dart';

class MovieRepository {
  final Dio _client =
      Dio(BaseOptions(baseUrl: "http://movie-proxy.azurewebsites.net"));

  Future<List<Movie>> getPopularMovies() async {
    var response = await _client.get("/api/popular-movies");
    return response.data.map<Movie>((movie) => Movie.fromJson(movie)).toList();
  }

  Future<List<Movie>> getRecentMovies() async {
    var response = await _client.get("/api/recent-movies");
    return response.data.map<Movie>((movie) => Movie.fromJson(movie)).toList();
  }

  Future<List<Movie>> getRandomMovies() async {
    var response = await _client.get("/api/random-movies");
    return response.data.map<Movie>((movie) => Movie.fromJson(movie)).toList();
  }

  Future<List<Movie>> getTrendingMovies() async {
    var response = await _client.get("/api/trending-movies");
    return response.data.map<Movie>((movie) => Movie.fromJson(movie)).toList();
  }

  Future<List<Movie>> getUpcomingMovies() async {
    var response = await _client.get("/api/upcoming-movies");
    return response.data.map<Movie>((movie) => Movie.fromJson(movie)).toList();
  }
}
