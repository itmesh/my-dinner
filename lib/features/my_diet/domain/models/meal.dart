import 'package:my_dinner/features/my_diet/data/dtos/meal_dto.dart';
import 'package:my_dinner/features/my_diet/domain/models/diet.dart';

class Meal {
  final String name;
  final String description;
  final DateTime servingDate;
  final DietSet diet;

  Meal({
    this.name,
    this.description,
    this.servingDate,
    this.diet,
  });

  factory Meal.fromDto(MealDto dto) {
    return Meal(
      name: dto.name,
      description: dto.description,
    );
  }
}
