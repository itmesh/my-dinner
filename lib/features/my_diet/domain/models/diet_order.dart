import 'package:my_dinner/features/my_diet/data/dtos/diet_order_dto.dart';

class DietOrder {
  final String name;

  DietOrder({
    this.name,
  });

  factory DietOrder.fromDto(DietOrderDto dto) {
    return DietOrder(
      name: dto.name,
    );
  }
}
