import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:my_dinner/core/services/json_converters.dart';
import 'package:my_dinner/features/address/data/dtos/address_dto.dart';
import 'package:my_dinner/features/pick_diet/data/dtos/vendor_offer_dto.dart';

part 'order_dto.g.dart';

@JsonSerializable()
class OrderDto {
  final String remarks;
  final List<DeliveryDto> deliveries;

  OrderDto({
    this.remarks,
    this.deliveries,
  });

  Map<String, dynamic> toJson() => _$OrderDtoToJson(this);
}

@HourDateTimeConverter()
@JsonSerializable(nullable: false)
class DeliveryDto {
  final CalorificDto calorific;
  final AddressDto deliveryAddress;
  final DateTime deliveryDate;

  DeliveryDto({
    this.calorific,
    this.deliveryAddress,
    this.deliveryDate,
  });

  factory DeliveryDto.fromJson(Map<String, dynamic> json) =>
      _$DeliveryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryDtoToJson(this);
}
