// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'delivery_hours.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

DeliveryHours _$DeliveryHoursFromJson(Map<String, dynamic> json) {
  return _DeliveryHours.fromJson(json);
}

mixin _$DeliveryHours {
  DateTime get fromHour;
  DateTime get toHour;

  DeliveryHours copyWith({DateTime fromHour, DateTime toHour});

  Map<String, dynamic> toJson();
}

class _$DeliveryHoursTearOff {
  const _$DeliveryHoursTearOff();

  _DeliveryHours call({DateTime fromHour, DateTime toHour}) {
    return _DeliveryHours(
      fromHour: fromHour,
      toHour: toHour,
    );
  }
}

const $DeliveryHours = _$DeliveryHoursTearOff();

@JsonSerializable()
class _$_DeliveryHours implements _DeliveryHours {
  const _$_DeliveryHours({this.fromHour, this.toHour});

  factory _$_DeliveryHours.fromJson(Map<String, dynamic> json) =>
      _$_$_DeliveryHoursFromJson(json);

  @override
  final DateTime fromHour;
  @override
  final DateTime toHour;

  @override
  String toString() {
    return 'DeliveryHours(fromHour: $fromHour, toHour: $toHour)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DeliveryHours &&
            (identical(other.fromHour, fromHour) ||
                const DeepCollectionEquality()
                    .equals(other.fromHour, fromHour)) &&
            (identical(other.toHour, toHour) ||
                const DeepCollectionEquality().equals(other.toHour, toHour)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(fromHour) ^
      const DeepCollectionEquality().hash(toHour);

  @override
  _$_DeliveryHours copyWith({
    Object fromHour = freezed,
    Object toHour = freezed,
  }) {
    return _$_DeliveryHours(
      fromHour: fromHour == freezed ? this.fromHour : fromHour as DateTime,
      toHour: toHour == freezed ? this.toHour : toHour as DateTime,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DeliveryHoursToJson(this);
  }
}

abstract class _DeliveryHours implements DeliveryHours {
  const factory _DeliveryHours({DateTime fromHour, DateTime toHour}) =
      _$_DeliveryHours;

  factory _DeliveryHours.fromJson(Map<String, dynamic> json) =
      _$_DeliveryHours.fromJson;

  @override
  DateTime get fromHour;
  @override
  DateTime get toHour;

  @override
  _DeliveryHours copyWith({DateTime fromHour, DateTime toHour});
}
