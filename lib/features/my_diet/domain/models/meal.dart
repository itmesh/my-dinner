import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_dinner/features/my_diet/domain/models/diet.dart';

part 'meal.freezed.dart';

part 'meal.g.dart';

@freezed
abstract class Meal with _$Meal {
  const factory Meal({
    String name,
    String description,
    DateTime servingDate,
    Diet diet,
  }) = _Meal;

  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);
}
