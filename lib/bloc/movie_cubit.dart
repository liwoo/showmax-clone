import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showmax_clone/models/movie.dart';
import 'package:showmax_clone/repositories/movie_repository.dart';
part 'movie_states.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit() : super(MovieLandingInitial());

  final MovieRepository _movieRepository = MovieRepository();

  Future<void> getMovieLading() async {
    emit(MovieLandingLoading());
    try {
      final popularMovies = await _movieRepository.getPopularMovies();
      final recentMovies = await _movieRepository.getRecentMovies();
      final upcomingMovies = await _movieRepository.getUpcomingMovies();
      final randomMovies = await _movieRepository.getRandomMovies();

      recentMovies.shuffle();
      randomMovies.shuffle();
      //combine recentMovies with randomMovies
      var topPicks = recentMovies.sublist(0, 4)
        ..addAll(randomMovies.sublist(0, 4));
      var continueWatching = recentMovies.sublist(4, 6)
        ..addAll(randomMovies.sublist(4, 6));
      emit(MovieLandingLoadingSuccessful(
          promoted: popularMovies.first,
          topPicks: topPicks,
          continueWatching: continueWatching,
          trendingMovies: popularMovies.toList(),
          upcomingMovies: upcomingMovies.toList(),
          bestOf: popularMovies.sublist(1, 11),
          recentMovies: recentMovies.sublist(0, 10),
          randomMovies: popularMovies.toList()));
    } catch (e) {
      emit(MovieLandingLoadingFailed(message: e.toString()));
    }
  }
}
