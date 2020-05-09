import 'package:my_dinner/features/new_order/data/dtos/order_dto.dart';
import 'package:my_dinner/features/new_order/domain/models/delivery.dart';

class NewOrder {
  final String remarks;
  final List<Delivery> deliveries;

  NewOrder({this.remarks, this.deliveries});

  OrderDto toDto() => OrderDto(
        remarks: remarks,
        deliveries: deliveries.map((e) => e.toDto()).toList(),
      );
}
