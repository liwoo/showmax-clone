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
      final trendingMovies = await _movieRepository.getTrendingMovies();
      var labels = List.from(Labels.values);
      recentMovies.shuffle();
      randomMovies.shuffle();
      popularMovies.shuffle();
      //combine recentMovies with randomMovies
      var topPicks = recentMovies.sublist(0, 4)
        ..addAll(randomMovies.sublist(0, 4));
      var continueWatching = recentMovies.sublist(4, 6)
        ..addAll(randomMovies.sublist(4, 6));
      emit(MovieLandingLoadingSuccessful(
          promoted: popularMovies.first,
          topPicks: topPicks.map((movie) {
            labels.shuffle();
            return movie.copyWith(label: labels.first);
          }).toList(),
          popularMovies: popularMovies,
          continueWatching: continueWatching,
          exclusives: recentMovies.sublist(11),
          recommendedMovies: trendingMovies.sublist(11).map((movie) {
            labels.shuffle();
            return movie.copyWith(label: labels.first);
          }).toList(),
          trendingMovies: trendingMovies.sublist(0, 10),
          upcomingMovies: upcomingMovies
              .sublist(0, 10)
              .map((movie) => movie.copyWith(label: Labels.comingSoon))
              .toList(),
          liveMovies: upcomingMovies.sublist(10, 15),
          bestOf: popularMovies.sublist(1, 10),
          recentMovies: recentMovies
              .sublist(0, 10)
              .map((movie) => movie.copyWith(label: Labels.newThing))
              .toList(),
          randomMovies: randomMovies.sublist(0, 10)));
    } catch (e) {
      emit(MovieLandingLoadingFailed(message: e.toString()));
    }
  }
}
