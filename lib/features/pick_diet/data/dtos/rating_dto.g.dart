// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingDto _$RatingDtoFromJson(Map<String, dynamic> json) {
  return RatingDto(
    rate: (json['rate'] as num)?.toDouble(),
    votesCount: json['votesCount'] as int,
  );
}

Map<String, dynamic> _$RatingDtoToJson(RatingDto instance) => <String, dynamic>{
      'rate': instance.rate,
      'votesCount': instance.votesCount,
    };
