import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_dinner/features/address/domain/models/delivery_hours.dart';

part 'address.freezed.dart';

part 'address.g.dart';

@freezed
abstract class Address with _$Address {
  const factory Address({
    String id,
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
