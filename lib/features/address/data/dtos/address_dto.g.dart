// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressDto _$AddressDtoFromJson(Map<String, dynamic> json) {
  return AddressDto(
    id: json['id'] as String,
    street: json['street'] as String,
    homeFlatNumber: json['homeFlatNumber'] as String,
    postalCode: json['postalCode'] as String,
    city: json['city'] as String,
    deliveryHours: json['deliveryHours'] == null
        ? null
        : DeliveryHoursDto.fromJson(
            json['deliveryHours'] as Map<String, dynamic>),
    remarks: json['remarks'] as String,
  );
}

Map<String, dynamic> _$AddressDtoToJson(AddressDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'street': instance.street,
      'homeFlatNumber': instance.homeFlatNumber,
      'postalCode': instance.postalCode,
      'city': instance.city,
      'deliveryHours': instance.deliveryHours,
      'remarks': instance.remarks,
    };
