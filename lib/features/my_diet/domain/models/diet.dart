import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_dinner/features/address/pages/domain/entities/address.dart';
import 'package:my_dinner/features/my_diet/domain/models/meal.dart';

part 'diet.freezed.dart';

part 'diet.g.dart';

@freezed
abstract class Diet with _$Diet {
  const factory Diet({
    String name,
    int calories,
    int dietCounts,
    Address address,
    String remarks,
    List<Meal> meals,
  }) = _Diet;


  factory Diet.fromJson(Map<String, dynamic> json) => _$DietFromJson(json);
}
