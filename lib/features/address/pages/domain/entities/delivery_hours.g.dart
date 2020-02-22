// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_hours.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryHours _$DeliveryHoursFromJson(Map<String, dynamic> json) {
  return DeliveryHours(
    json['fromHour'] == null
        ? null
        : DateTime.parse(json['fromHour'] as String),
    json['toHour'] == null ? null : DateTime.parse(json['toHour'] as String),
  );
}

Map<String, dynamic> _$DeliveryHoursToJson(DeliveryHours instance) =>
    <String, dynamic>{
      'fromHour': instance.fromHour?.toIso8601String(),
      'toHour': instance.toHour?.toIso8601String(),
    };
