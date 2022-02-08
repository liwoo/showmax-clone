// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Movie _$$_MovieFromJson(Map<String, dynamic> json) => _$_Movie(
      title: json['title'] as String,
      imdbId: json['imdbId'] as String,
      posterUrl: json['posterUrl'] as String,
      label: $enumDecodeNullable(_$LabelsEnumMap, json['label']) ?? Labels.none,
      playbackLength: (json['playbackLength'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$_MovieToJson(_$_Movie instance) => <String, dynamic>{
      'title': instance.title,
      'imdbId': instance.imdbId,
      'posterUrl': instance.posterUrl,
      'label': _$LabelsEnumMap[instance.label],
      'playbackLength': instance.playbackLength,
    };

const _$LabelsEnumMap = {
  Labels.newSeason: 'newSeason',
  Labels.newThing: 'newThing',
  Labels.newEpisode: 'newEpisode',
  Labels.comingSoon: 'comingSoon',
  Labels.none: 'none',
};
