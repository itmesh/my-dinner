import 'package:my_dinner/features/address/pages/domain/entities/delivery_hours.dart';

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
}
