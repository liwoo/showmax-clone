import 'package:freezed_annotation/freezed_annotation.dart';
part 'movie.freezed.dart';
part 'movie.g.dart';

enum Labels {
  newSeason,
  newThing,
  newEpisode,
  comingSoon,
  none,
}

@Freezed()
class Movie with _$Movie {
  const factory Movie({
    required String title,
    required String imdbId,
    required String posterUrl,
    @Default(Labels.none) Labels label,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
