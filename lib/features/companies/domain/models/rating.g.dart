// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Rating _$_$_RatingFromJson(Map<String, dynamic> json) {
  return _$_Rating(
    (json['rate'] as num)?.toDouble(),
    json['votesCount'] as int,
  );
}

Map<String, dynamic> _$_$_RatingToJson(_$_Rating instance) => <String, dynamic>{
      'rate': instance.rate,
      'votesCount': instance.votesCount,
    };
