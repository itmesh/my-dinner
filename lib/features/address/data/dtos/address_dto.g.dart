// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressDto _$AddressDtoFromJson(Map<String, dynamic> json) {
  return AddressDto(
    id: json['id'] as int,
    street: json['street'] as String,
    flatNumber: json['flatNumber'] as String,
    postalCode: json['postalCode'] as String,
    city: json['city'] as String,
    remarks: json['remarks'] as String,
    deliveryTimeFrom: const HourDateTimeConverter()
        .fromJson(json['deliveryTimeFrom'] as String),
    deliveryTimeTo: const HourDateTimeConverter()
        .fromJson(json['deliveryTimeTo'] as String),
  );
}

Map<String, dynamic> _$AddressDtoToJson(AddressDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'street': instance.street,
      'flatNumber': instance.flatNumber,
      'postalCode': instance.postalCode,
      'city': instance.city,
      'remarks': instance.remarks,
      'deliveryTimeFrom':
          const HourDateTimeConverter().toJson(instance.deliveryTimeFrom),
      'deliveryTimeTo':
          const HourDateTimeConverter().toJson(instance.deliveryTimeTo),
    };
