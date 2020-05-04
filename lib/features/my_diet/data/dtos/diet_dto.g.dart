// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diet_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DietSetDto _$DietSetDtoFromJson(Map<String, dynamic> json) {
  return DietSetDto(
    id: json['id'] as int,
    name: json['name'] as String,
    calories: json['calories'] as int,
    vendorName: json['vendorName'] as String,
    address: json['address'] == null
        ? null
        : AddressDto.fromJson(json['address'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DietSetDtoToJson(DietSetDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'calories': instance.calories,
      'vendorName': instance.vendorName,
      'address': instance.address,
    };

DietDayDto _$DietDayDtoFromJson(Map<String, dynamic> json) {
  return DietDayDto(
    scheduledSets: (json['scheduledSets'] as List)
        ?.map((e) =>
            e == null ? null : DietSetDto.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    availableSets: (json['availableSets'] as List)
        ?.map((e) =>
            e == null ? null : DietSetDto.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DietDayDtoToJson(DietDayDto instance) =>
    <String, dynamic>{
      'scheduledSets': instance.scheduledSets,
      'availableSets': instance.availableSets,
    };
