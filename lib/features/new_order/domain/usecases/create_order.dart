import 'package:either_option/either_option.dart';
import 'package:injectable/injectable.dart';

import 'package:my_dinner/core/services/failures.dart';
import 'package:my_dinner/core/services/use_case.dart';
import 'package:my_dinner/features/address/domain/models/address.dart';
import 'package:my_dinner/features/new_order/domain/models/delivery.dart';
import 'package:my_dinner/features/new_order/domain/models/new_order.dart';
import 'package:my_dinner/features/new_order/domain/repositories/new_order_repository.dart';
import 'package:my_dinner/features/pick_diet/domain/models/diet_offer.dart';

@singleton
class CreateOrder extends UseCase<NewOrder, CreateOrderParams> {
  final NewOrderRepository _newOrderRepository;

  CreateOrder(this._newOrderRepository);

  @override
  Future<Either<Failure, NewOrder>> call(CreateOrderParams params) {
    NewOrder newOrder = NewOrder(
      remarks: params.remarks,
      deliveries: List.generate(params.dietCount, (_) {
        return Delivery(
          addressId: params.address.id,
          calorificId: params.calorie.id,
          deliveryHour: params.address.toHour,
        );
      }),
    );
    return _newOrderRepository.createOrder(newOrder);
  }
}

class CreateOrderParams {
  final Address address;
  final Calorie calorie;
  final int dietCount;
  final String remarks;

  CreateOrderParams({
    this.address,
    this.calorie,
    this.dietCount,
    this.remarks,
  });
}
