// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_hours_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryHoursDto _$DeliveryHoursDtoFromJson(Map<String, dynamic> json) {
  return DeliveryHoursDto(
    fromHour: json['fromHour'] == null
        ? null
        : DateTime.parse(json['fromHour'] as String),
    toHour: json['toHour'] == null
        ? null
        : DateTime.parse(json['toHour'] as String),
  );
}

Map<String, dynamic> _$DeliveryHoursDtoToJson(DeliveryHoursDto instance) =>
    <String, dynamic>{
      'fromHour': instance.fromHour?.toIso8601String(),
      'toHour': instance.toHour?.toIso8601String(),
    };
