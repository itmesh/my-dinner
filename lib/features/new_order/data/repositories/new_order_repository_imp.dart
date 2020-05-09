import 'package:either_option/either_option.dart';
import 'package:injectable/injectable.dart';
import 'package:my_dinner/core/services/failures.dart';
import 'package:my_dinner/core/services/log.dart';
import 'package:my_dinner/features/new_order/data/datasources/new_order_api.dart';
import 'package:my_dinner/features/new_order/domain/models/new_order.dart';
import 'package:my_dinner/features/new_order/domain/repositories/new_order_repository.dart';

@singleton
@RegisterAs(NewOrderRepository)
class NewOrderRepositoryImp extends NewOrderRepository {
  final _log = Log('NewOrderRepositoryImp');
  final NewOrderApi _newOrderApi;

  NewOrderRepositoryImp(this._newOrderApi);

  @override
  Future<Either<Failure, NewOrder>> createOrder(NewOrder newOrder) async {
    try {
      await _newOrderApi.createOrder(newOrder.toDto());
      return Right(newOrder);
    } catch (e) {
      _log.error('$e');
      return Left(ApiFailure());
    }
  }
}
