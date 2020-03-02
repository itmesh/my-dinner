// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'address.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) {
  return _Address.fromJson(json);
}

mixin _$Address {
  String get street;
  String get homeFlatNumber;
  String get postalCode;
  String get city;
  DeliveryHours get deliveryHours;
  String get remarks;

  Address copyWith(
      {String street,
      String homeFlatNumber,
      String postalCode,
      String city,
      DeliveryHours deliveryHours,
      String remarks});

  Map<String, dynamic> toJson();
}

class _$AddressTearOff {
  const _$AddressTearOff();

  _Address call(
      {String street,
      String homeFlatNumber,
      String postalCode,
      String city,
      DeliveryHours deliveryHours,
      String remarks}) {
    return _Address(
      street: street,
      homeFlatNumber: homeFlatNumber,
      postalCode: postalCode,
      city: city,
      deliveryHours: deliveryHours,
      remarks: remarks,
    );
  }
}

const $Address = _$AddressTearOff();

@JsonSerializable()
class _$_Address implements _Address {
  const _$_Address(
      {this.street,
      this.homeFlatNumber,
      this.postalCode,
      this.city,
      this.deliveryHours,
      this.remarks});

  factory _$_Address.fromJson(Map<String, dynamic> json) =>
      _$_$_AddressFromJson(json);

  @override
  final String street;
  @override
  final String homeFlatNumber;
  @override
  final String postalCode;
  @override
  final String city;
  @override
  final DeliveryHours deliveryHours;
  @override
  final String remarks;

  @override
  String toString() {
    return 'Address(street: $street, homeFlatNumber: $homeFlatNumber, postalCode: $postalCode, city: $city, deliveryHours: $deliveryHours, remarks: $remarks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Address &&
            (identical(other.street, street) ||
                const DeepCollectionEquality().equals(other.street, street)) &&
            (identical(other.homeFlatNumber, homeFlatNumber) ||
                const DeepCollectionEquality()
                    .equals(other.homeFlatNumber, homeFlatNumber)) &&
            (identical(other.postalCode, postalCode) ||
                const DeepCollectionEquality()
                    .equals(other.postalCode, postalCode)) &&
            (identical(other.city, city) ||
                const DeepCollectionEquality().equals(other.city, city)) &&
            (identical(other.deliveryHours, deliveryHours) ||
                const DeepCollectionEquality()
                    .equals(other.deliveryHours, deliveryHours)) &&
            (identical(other.remarks, remarks) ||
                const DeepCollectionEquality().equals(other.remarks, remarks)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(street) ^
      const DeepCollectionEquality().hash(homeFlatNumber) ^
      const DeepCollectionEquality().hash(postalCode) ^
      const DeepCollectionEquality().hash(city) ^
      const DeepCollectionEquality().hash(deliveryHours) ^
      const DeepCollectionEquality().hash(remarks);

  @override
  _$_Address copyWith({
    Object street = freezed,
    Object homeFlatNumber = freezed,
    Object postalCode = freezed,
    Object city = freezed,
    Object deliveryHours = freezed,
    Object remarks = freezed,
  }) {
    return _$_Address(
      street: street == freezed ? this.street : street as String,
      homeFlatNumber: homeFlatNumber == freezed
          ? this.homeFlatNumber
          : homeFlatNumber as String,
      postalCode:
          postalCode == freezed ? this.postalCode : postalCode as String,
      city: city == freezed ? this.city : city as String,
      deliveryHours: deliveryHours == freezed
          ? this.deliveryHours
          : deliveryHours as DeliveryHours,
      remarks: remarks == freezed ? this.remarks : remarks as String,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AddressToJson(this);
  }
}

abstract class _Address implements Address {
  const factory _Address(
      {String street,
      String homeFlatNumber,
      String postalCode,
      String city,
      DeliveryHours deliveryHours,
      String remarks}) = _$_Address;

  factory _Address.fromJson(Map<String, dynamic> json) = _$_Address.fromJson;

  @override
  String get street;
  @override
  String get homeFlatNumber;
  @override
  String get postalCode;
  @override
  String get city;
  @override
  DeliveryHours get deliveryHours;
  @override
  String get remarks;

  @override
  _Address copyWith(
      {String street,
      String homeFlatNumber,
      String postalCode,
      String city,
      DeliveryHours deliveryHours,
      String remarks});
}
