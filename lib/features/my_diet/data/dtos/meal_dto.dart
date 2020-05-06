import 'package:json_annotation/json_annotation.dart';

part 'meal_dto.g.dart';

@JsonSerializable()
class MealDto {
  final String name;
  final String description;
  final DateTime servingDate;

  MealDto({
    this.name,
    this.description,
    this.servingDate,
  });

  factory MealDto.fromJson(Map<String, dynamic> json) =>
      _$MealDtoFromJson(json);
}
