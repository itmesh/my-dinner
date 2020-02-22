// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meal _$MealFromJson(Map<String, dynamic> json) {
  return Meal(
    name: json['name'] as String,
    description: json['description'] as String,
    servingDate: json['servingDate'] == null
        ? null
        : DateTime.parse(json['servingDate'] as String),
    diet: json['diet'] == null
        ? null
        : Diet.fromJson(json['diet'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MealToJson(Meal instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'servingDate': instance.servingDate?.toIso8601String(),
      'diet': instance.diet,
    };
