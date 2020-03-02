import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_dinner/features/address/pages/domain/entities/delivery_hours.dart';

part 'address.freezed.dart';

part 'address.g.dart';

@freezed
abstract class Address with _$Address {
  const factory Address({
    String street,
    String homeFlatNumber,
    String postalCode,
    String city,
    DeliveryHours deliveryHours,
    String remarks,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
