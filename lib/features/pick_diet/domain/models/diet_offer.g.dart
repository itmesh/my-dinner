// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diet_offer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DietOffer _$_$_DietOfferFromJson(Map<String, dynamic> json) {
  return _$_DietOffer(
    json['name'] as String,
    json['description'] as String,
    (json['variants'] as List)?.map((e) => e as String)?.toList(),
    (json['calorific'] as List)?.map((e) => e as int)?.toList(),
  );
}

Map<String, dynamic> _$_$_DietOfferToJson(_$_DietOffer instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'variants': instance.variants,
      'calorific': instance.calorific,
    };
