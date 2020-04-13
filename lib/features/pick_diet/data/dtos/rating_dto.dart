import 'package:json_annotation/json_annotation.dart';

part 'rating_dto.g.dart';

@JsonSerializable()
class RatingDto {
  final double rate;
  final int votesCount;

  RatingDto({
    this.rate,
    this.votesCount,
  });

  factory RatingDto.fromJson(Map<String, dynamic> json) =>
      _$RatingDtoFromJson(json);
}
