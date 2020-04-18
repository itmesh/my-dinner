import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'address_dto.g.dart';

@JsonSerializable()
class AddressDto {
  final int id;
  final String street;
  final String flatNumber;
  final String postalCode;
  final String city;
  final String remarks;
  final DateTime deliveryTimeFrom;
  final DateTime deliveryTimeTo;

  AddressDto({
    this.id,
    this.street,
    this.flatNumber,
    this.postalCode,
    this.city,
    this.remarks,
    this.deliveryTimeFrom,
    this.deliveryTimeTo,
  });

  factory AddressDto.fromJson(Map<String, dynamic> json) =>
      _$AddressDtoFromJson(json);

  String toJson() => json.encode(_$AddressDtoToJson(this));
}
