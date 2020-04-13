// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diet_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DietDto _$DietDtoFromJson(Map<String, dynamic> json) {
  return DietDto(
    name: json['name'] as String,
    calories: json['calories'] as int,
    dietCounts: json['dietCounts'] as int,
    address: json['address'] == null
        ? null
        : AddressDto.fromJson(json['address'] as Map<String, dynamic>),
    remarks: json['remarks'] as String,
    meals: (json['meals'] as List)
        ?.map((e) =>
            e == null ? null : MealDto.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DietDtoToJson(DietDto instance) => <String, dynamic>{
      'name': instance.name,
      'calories': instance.calories,
      'dietCounts': instance.dietCounts,
      'address': instance.address,
      'remarks': instance.remarks,
      'meals': instance.meals,
    };
