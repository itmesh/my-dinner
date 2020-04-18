import 'package:my_dinner/features/address/data/dtos/address_dto.dart';
import 'package:my_dinner/features/address/domain/models/delivery_hours.dart';

class Address {
  final int id;
  final String street;
  final String homeFlatNumber;
  final String postalCode;
  final String city;
  final DeliveryHours deliveryHours;
  final String remarks;
  final DateTime fromHour;
  final DateTime toHour;

  Address({
    this.id,
    this.street,
    this.homeFlatNumber,
    this.postalCode,
    this.city,
    this.deliveryHours,
    this.remarks,
    this.fromHour,
    this.toHour,
  });

  factory Address.fromDto(AddressDto dto) {
    return Address(
      id: dto.id,
      street: dto.street,
      homeFlatNumber: dto.flatNumber,
      postalCode: dto.postalCode,
      city: dto.city,
      remarks: dto.remarks,
      fromHour: dto.deliveryTimeFrom,
      toHour: dto.deliveryTimeTo,
    );
  }

  AddressDto toDto() {
    return AddressDto(
      id: id,
      street: street,
      flatNumber: homeFlatNumber,
      postalCode: postalCode,
      city: city,
      remarks: remarks,
      deliveryTimeFrom: fromHour,
      deliveryTimeTo: toHour,
    );
  }
}
