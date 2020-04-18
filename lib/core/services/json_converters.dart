import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_dinner/features/address/domain/models/delivery_hours.dart';

class HourDateTimeConverter implements JsonConverter<DateTime, String> {
  const HourDateTimeConverter();

  @override
  DateTime fromJson(String json) =>
      json != null ? DeliveryHours.dateFormat.parse(json) : null;

  @override
  String toJson(DateTime object) =>
      object != null ? DeliveryHours.dateFormat.format(object) : null;
}
