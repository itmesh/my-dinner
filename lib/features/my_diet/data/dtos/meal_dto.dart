import 'package:json_annotation/json_annotation.dart';
import 'package:my_dinner/features/my_diet/data/dtos/diet_dto.dart';

part 'meal_dto.g.dart';

@JsonSerializable()
class MealDto {
  final String name;
  final String description;
  final DateTime servingDate;
  final DietDto diet;

  MealDto({
    this.name,
    this.description,
    this.servingDate,
    this.diet,
  });

  factory MealDto.fromJson(Map<String, dynamic> json) =>
      _$MealDtoFromJson(json);
}
