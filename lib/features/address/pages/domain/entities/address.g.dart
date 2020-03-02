// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Address _$_$_AddressFromJson(Map<String, dynamic> json) {
  return _$_Address(
    street: json['street'] as String,
    homeFlatNumber: json['homeFlatNumber'] as String,
    postalCode: json['postalCode'] as String,
    city: json['city'] as String,
    deliveryHours: json['deliveryHours'] == null
        ? null
        : DeliveryHours.fromJson(json['deliveryHours'] as Map<String, dynamic>),
    remarks: json['remarks'] as String,
  );
}

Map<String, dynamic> _$_$_AddressToJson(_$_Address instance) =>
    <String, dynamic>{
      'street': instance.street,
      'homeFlatNumber': instance.homeFlatNumber,
      'postalCode': instance.postalCode,
      'city': instance.city,
      'deliveryHours': instance.deliveryHours,
      'remarks': instance.remarks,
    };
