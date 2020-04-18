import 'package:intl/intl.dart';

class DeliveryHours {
  static final List<DeliveryHours> availableHours = [
    DeliveryHours(fromHour: DateTime(0, 0, 0, 4), toHour: DateTime(0, 0, 0, 5)),
    DeliveryHours(fromHour: DateTime(0, 0, 0, 5), toHour: DateTime(0, 0, 0, 6)),
    DeliveryHours(fromHour: DateTime(0, 0, 0, 6), toHour: DateTime(0, 0, 0, 7)),
    DeliveryHours(fromHour: DateTime(0, 0, 0, 7), toHour: DateTime(0, 0, 0, 8)),
    DeliveryHours(fromHour: DateTime(0, 0, 0, 8), toHour: DateTime(0, 0, 0, 9)),
  ];
  static final DateFormat dateFormat = DateFormat('HH:mm');

  final DateTime fromHour;
  final DateTime toHour;

  DeliveryHours({
    this.fromHour,
    this.toHour,
  });
}
