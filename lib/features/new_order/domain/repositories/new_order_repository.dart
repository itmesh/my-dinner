import 'package:either_option/either_option.dart';
import 'package:my_dinner/core/services/failures.dart';
import 'package:my_dinner/features/new_order/domain/models/new_order.dart';

abstract class NewOrderRepository {
  Future<Either<Failure, NewOrder>> createOrder(NewOrder newOrder);
}
