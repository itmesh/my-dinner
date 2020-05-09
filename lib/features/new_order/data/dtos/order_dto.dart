import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:my_dinner/core/services/json_converters.dart';

part 'order_dto.g.dart';

@JsonSerializable()
class OrderDto {
  final String remarks;
  final List<DeliveryDto> deliveries;

  OrderDto({
    this.remarks,
    this.deliveries,
  });

  String toJson() => json.encode(_$OrderDtoToJson(this));
}

@HourDateTimeConverter()
@JsonSerializable()
class DeliveryDto {
  final int calorific;
  final int deliveryAddress;
  final DateTime deliveryDate;

  DeliveryDto({
    this.calorific,
    this.deliveryAddress,
    this.deliveryDate,
  });

  factory DeliveryDto.fromJson(Map<String, dynamic> json) =>
      _$DeliveryDtoFromJson(json);

  String toJson() => json.encode(_$DeliveryDtoToJson(this));
}
