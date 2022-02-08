part of 'movie_cubit.dart';

class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

// movie states for landing screen
class MovieLandingInitial extends MovieState {}

class MovieLandingLoading extends MovieState {}

class MovieLandingLoadingSuccessful extends MovieState {
  final List<Movie> recentMovies;
  final List<Movie> randomMovies;
  final List<Movie> trendingMovies;
  final List<Movie> bestOf;
  final List<Movie> upcomingMovies;
  final List<Movie> topPicks;
  final List<Movie> continueWatching;
  final List<Movie> popularMovies;
  final List<Movie> recommendedMovies;
  final List<Movie> liveMovies;
  final List<Movie> exclusives;
  final Movie promoted;

  const MovieLandingLoadingSuccessful(
      {required this.recentMovies,
      required this.randomMovies,
      required this.recommendedMovies,
      required this.trendingMovies,
      required this.upcomingMovies,
      required this.bestOf,
      required this.popularMovies,
      required this.topPicks,
      required this.promoted,
      required this.liveMovies,
      required this.exclusives,
      required this.continueWatching});

  @override
  List<Object> get props => [
        recentMovies,
        liveMovies,
        randomMovies,
        exclusives,
        recommendedMovies,
        upcomingMovies,
        continueWatching,
        popularMovies,
        topPicks,
        trendingMovies,
        bestOf,
        promoted
      ];
}

class MovieLandingLoadingFailed extends MovieState {
  final String message;

  const MovieLandingLoadingFailed({required this.message});

  @override
  List<Object> get props => [message];
}
