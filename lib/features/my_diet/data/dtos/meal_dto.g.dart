// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealDto _$MealDtoFromJson(Map<String, dynamic> json) {
  return MealDto(
    name: json['name'] as String,
    description: json['description'] as String,
    servingDate: json['servingDate'] == null
        ? null
        : DateTime.parse(json['servingDate'] as String),
  );
}

Map<String, dynamic> _$MealDtoToJson(MealDto instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'servingDate': instance.servingDate?.toIso8601String(),
    };
