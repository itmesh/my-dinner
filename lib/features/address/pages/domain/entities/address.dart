import 'package:json_annotation/json_annotation.dart';

import 'package:my_dinner/features/address/pages/domain/entities/delivery_hours.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  final String street;
  final String homeFlatNumber;
  final String postalCode;
  final String city;
  final DeliveryHours deliveryHours;
  final String remarks;

  Address({
    this.street,
    this.homeFlatNumber,
    this.postalCode,
    this.city,
    this.deliveryHours,
    this.remarks,
  });

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
