import 'package:my_dinner/features/new_order/data/dtos/order_dto.dart';

class Delivery {
  final int calorificId;
  final int addressId;
  final DateTime deliveryHour;

  Delivery({
    this.calorificId,
    this.addressId,
    this.deliveryHour,
  });

  DeliveryDto toDto() => DeliveryDto(
        calorific: calorificId,
    deliveryAddress: addressId,
        deliveryDate: deliveryHour,
      );
}
