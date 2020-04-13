// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diet_offer_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DietOfferDto _$DietOfferDtoFromJson(Map<String, dynamic> json) {
  return DietOfferDto(
    name: json['name'] as String,
    description: json['description'] as String,
    variants: (json['variants'] as List)?.map((e) => e as String)?.toList(),
    calorific: (json['calorific'] as List)?.map((e) => e as int)?.toList(),
  );
}

Map<String, dynamic> _$DietOfferDtoToJson(DietOfferDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'variants': instance.variants,
      'calorific': instance.calorific,
    };
