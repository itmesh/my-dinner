import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'delivery_hours.freezed.dart';

part 'delivery_hours.g.dart';

@freezed
abstract class DeliveryHours with _$DeliveryHours {
  static final DateFormat dateFormat = DateFormat('HH:mm');

  const factory DeliveryHours({
    DateTime fromHour,
    DateTime toHour,
  }) = _DeliveryHours;

  @override
  String toString() => '$fromHour - $toHour';

  factory DeliveryHours.fromJson(Map<String, dynamic> json) =>
      _$DeliveryHoursFromJson(json);
}
