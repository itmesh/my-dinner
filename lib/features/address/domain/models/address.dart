import 'package:my_dinner/features/address/data/dtos/address_dto.dart';
import 'package:my_dinner/features/address/domain/models/delivery_hours.dart';

class Address {
  final String id;
  final String street;
  final String homeFlatNumber;
  final String postalCode;
  final String city;
  final DeliveryHours deliveryHours;
  final String remarks;

  Address({
    this.id,
    this.street,
    this.homeFlatNumber,
    this.postalCode,
    this.city,
    this.deliveryHours,
    this.remarks,
  });

  factory Address.fromDto(AddressDto dto) {
    return Address(
      id: dto.id,
      street: dto.street,
      homeFlatNumber: dto.homeFlatNumber,
      postalCode: dto.postalCode,
      city: dto.city,
      deliveryHours: DeliveryHours.fromDto(dto.deliveryHours),
      remarks: dto.remarks,
    );
  }

  AddressDto toDto() {
    return AddressDto(
      id: id,
      street: street,
      homeFlatNumber: homeFlatNumber,
      postalCode: postalCode,
      city: city,
      deliveryHours: deliveryHours.toDto(),
      remarks: remarks,
    );
  }
}
