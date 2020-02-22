import 'package:json_annotation/json_annotation.dart';
import 'package:my_dinner/features/my_diet/data/models/diet.dart';

part 'meal.g.dart';

@JsonSerializable()
class Meal {
  final String name;
  final String description;
  final DateTime servingDate;
  final Diet diet;

  Meal({
    this.name,
    this.description,
    this.servingDate,
    this.diet,
  });

  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);
}
