// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_hours.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DeliveryHours _$_$_DeliveryHoursFromJson(Map<String, dynamic> json) {
  return _$_DeliveryHours(
    fromHour: json['fromHour'] == null
        ? null
        : DateTime.parse(json['fromHour'] as String),
    toHour: json['toHour'] == null
        ? null
        : DateTime.parse(json['toHour'] as String),
  );
}

Map<String, dynamic> _$_$_DeliveryHoursToJson(_$_DeliveryHours instance) =>
    <String, dynamic>{
      'fromHour': instance.fromHour?.toIso8601String(),
      'toHour': instance.toHour?.toIso8601String(),
    };
