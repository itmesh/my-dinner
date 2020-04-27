import 'package:my_dinner/features/address/domain/models/address.dart';
import 'package:my_dinner/features/my_diet/data/dtos/diet_dto.dart';
import 'package:my_dinner/features/my_diet/domain/models/meal.dart';

class Diet {
  final String name;
  final int calories;
  final int dietCounts;
  final Address address;
  final String remarks;
  final List<Meal> meals;

  Diet({
    this.name,
    this.calories,
    this.dietCounts,
    this.address,
    this.remarks,
    this.meals,
  });

  factory Diet.fromDto(DietDto dto) {
    return Diet(
      name: dto.name,
      calories: dto.calories,
      dietCounts: dto.dietCounts,
      address: dto.address == null ? null : Address.fromDto(dto.address),
      remarks: dto.remarks,
      meals: dto.meals.map((e) => Meal.fromDto(e)).toList(),
    );
  }
}
