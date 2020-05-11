import 'package:my_dinner/features/address/data/dtos/address_dto.dart';
import 'package:my_dinner/features/new_order/data/dtos/order_dto.dart';
import 'package:my_dinner/features/pick_diet/data/dtos/vendor_offer_dto.dart';

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
        calorific: CalorificDto(id: calorificId),
        deliveryAddress: AddressDto(id: addressId),
        deliveryDate: deliveryHour,
      );
}
