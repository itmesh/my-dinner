import 'package:json_annotation/json_annotation.dart';
import 'package:my_dinner/features/address/pages/domain/entities/address.dart';
import 'package:my_dinner/model/meal.dart';

part 'diet.g.dart';

@JsonSerializable()
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

  factory Diet.fromJson(Map<String, dynamic> json) => _$DietFromJson(json);
}
