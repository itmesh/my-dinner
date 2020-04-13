import 'package:json_annotation/json_annotation.dart';

part 'delivery_hours_dto.g.dart';

@JsonSerializable()
class DeliveryHoursDto {
  final DateTime fromHour;
  final DateTime toHour;

  DeliveryHoursDto({
    this.fromHour,
    this.toHour,
  });

  factory DeliveryHoursDto.fromJson(Map<String, dynamic> json) =>
      _$DeliveryHoursDtoFromJson(json);
}
