// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDto _$OrderDtoFromJson(Map<String, dynamic> json) {
  return OrderDto(
    remarks: json['remarks'] as String,
    deliveries: (json['deliveries'] as List)
        ?.map((e) =>
            e == null ? null : DeliveryDto.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$OrderDtoToJson(OrderDto instance) => <String, dynamic>{
      'remarks': instance.remarks,
      'deliveries': instance.deliveries,
    };

DeliveryDto _$DeliveryDtoFromJson(Map<String, dynamic> json) {
  return DeliveryDto(
    calorific: json['calorific'] as int,
    deliveryAddress: json['address'] as int,
    deliveryDate:
        const HourDateTimeConverter().fromJson(json['deliveryDate'] as String),
  );
}

Map<String, dynamic> _$DeliveryDtoToJson(DeliveryDto instance) =>
    <String, dynamic>{
      'calorific': instance.calorific,
      'deliveryAddress': instance.deliveryAddress,
      'deliveryDate':
          const HourDateTimeConverter().toJson(instance.deliveryDate),
    };
