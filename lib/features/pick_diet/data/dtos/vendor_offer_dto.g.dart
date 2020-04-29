// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_offer_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VendorOfferDto _$VendorOfferDtoFromJson(Map<String, dynamic> json) {
  return VendorOfferDto(
    json['diet'] == null
        ? null
        : OfferDto.fromJson(json['diet'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VendorOfferDtoToJson(VendorOfferDto instance) =>
    <String, dynamic>{
      'diet': instance.diet,
    };

OfferDto _$OfferDtoFromJson(Map<String, dynamic> json) {
  return OfferDto(
    json['id'] as int,
    json['name'] as String,
    json['description'] as String,
    (json['calorificList'] as List)
        ?.map((e) =>
            e == null ? null : CalorificDto.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$OfferDtoToJson(OfferDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'calorificList': instance.calorificList,
    };

CalorificDto _$CalorificDtoFromJson(Map<String, dynamic> json) {
  return CalorificDto(
    json['id'] as int,
    json['value'] as int,
    (json['pricing'] as List)
        ?.map((e) =>
            e == null ? null : PriceDto.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CalorificDtoToJson(CalorificDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'pricing': instance.pricing,
    };

PriceDto _$PriceDtoFromJson(Map<String, dynamic> json) {
  return PriceDto(
    (json['price'] as num)?.toDouble(),
    (json['appliesUpTo'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$PriceDtoToJson(PriceDto instance) => <String, dynamic>{
      'price': instance.price,
      'appliesUpTo': instance.appliesUpTo,
    };
