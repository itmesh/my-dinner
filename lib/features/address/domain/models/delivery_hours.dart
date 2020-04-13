import 'package:intl/intl.dart';
import 'package:my_dinner/features/address/data/dtos/delivery_hours_dto.dart';

class DeliveryHours {
  static final DateFormat dateFormat = DateFormat('HH:mm');

  final DateTime fromHour;
  final DateTime toHour;

  DeliveryHours({
    this.fromHour,
    this.toHour,
  });

  factory DeliveryHours.fromDto(DeliveryHoursDto dto) {
    return DeliveryHours(
      fromHour: dto.fromHour,
      toHour: dto.toHour,
    );
  }

  DeliveryHoursDto toDto() {
    return DeliveryHoursDto(
      fromHour: fromHour,
      toHour: toHour,
    );
  }
}
