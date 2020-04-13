import 'package:json_annotation/json_annotation.dart';
import 'package:my_dinner/features/address/data/dtos/delivery_hours_dto.dart';

part 'address_dto.g.dart';

@JsonSerializable()
class AddressDto {
  final String id;
  final String street;
  final String homeFlatNumber;
  final String postalCode;
  final String city;
  final DeliveryHoursDto deliveryHours;
  final String remarks;

  AddressDto({
    this.id,
    this.street,
    this.homeFlatNumber,
    this.postalCode,
    this.city,
    this.deliveryHours,
    this.remarks,
  });

  factory AddressDto.fromJson(Map<String, dynamic> json) =>
      _$AddressDtoFromJson(json);
}
