enum Labels {
  newSeason,
  newThing,
  newEpisode,
  comingSoon,
  none,
}

class Movie {
  final String title;
  final String posterUrl;
  final Labels label;
  Movie({
    required this.title,
    this.label = Labels.none,
    required this.posterUrl,
  });
}
