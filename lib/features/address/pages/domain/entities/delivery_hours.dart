import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'delivery_hours.g.dart';

@JsonSerializable()
class DeliveryHours {
  static final DateFormat dateFormat = DateFormat('HH:mm');
  final DateTime fromHour;
  final DateTime toHour;

  DeliveryHours(this.fromHour, this.toHour);

  @override
  String toString() => '$fromHour - $toHour';

  factory DeliveryHours.fromJson(Map<String, dynamic> json) =>
      _$DeliveryHoursFromJson(json);
}
