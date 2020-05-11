// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_offer_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VendorDto _$VendorDtoFromJson(Map<String, dynamic> json) {
  return VendorDto(
    logo: json['logo'] as String,
    name: json['name'] as String,
    payments: (json['payments'] as List)
        ?.map((e) => _$enumDecodeNullable(_$PaymentEnumMap, e))
        ?.toList(),
    diets: (json['diets'] as List)
        ?.map((e) =>
            e == null ? null : OfferDto.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$VendorDtoToJson(VendorDto instance) => <String, dynamic>{
      'logo': instance.logo,
      'name': instance.name,
      'payments': instance.payments?.map((e) => _$PaymentEnumMap[e])?.toList(),
      'diets': instance.diets,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$PaymentEnumMap = {
  Payment.CASH: 'CASH',
  Payment.TRANSFER: 'TRANSFER',
};

OfferDto _$OfferDtoFromJson(Map<String, dynamic> json) {
  return OfferDto(
    json['id'] as int,
    json['name'] as String,
    json['description'] as String,
    (json['calorificList'] as List)
        .map((e) => CalorificDto.fromJson(e as Map<String, dynamic>))
        .toList(),
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
    id: json['id'] as int,
    value: json['value'] as int,
    pricing: (json['pricing'] as List)
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
