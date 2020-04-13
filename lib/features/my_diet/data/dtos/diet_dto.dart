import 'package:json_annotation/json_annotation.dart';
import 'package:my_dinner/features/address/data/dtos/address_dto.dart';
import 'package:my_dinner/features/my_diet/data/dtos/meal_dto.dart';

part 'diet_dto.g.dart';

@JsonSerializable()
class DietDto {
  final String name;
  final int calories;
  final int dietCounts;
  final AddressDto address;
  final String remarks;
  final List<MealDto> meals;

  DietDto({
    this.name,
    this.calories,
    this.dietCounts,
    this.address,
    this.remarks,
    this.meals,
  });

  factory DietDto.fromJson(Map<String, dynamic> json) =>
      _$DietDtoFromJson(json);
}
