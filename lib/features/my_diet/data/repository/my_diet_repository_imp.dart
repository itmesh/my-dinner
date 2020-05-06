import 'package:either_option/either_option.dart';
import 'package:injectable/injectable.dart';
import 'package:my_dinner/core/services/failures.dart';
import 'package:my_dinner/core/services/log.dart';
import 'package:my_dinner/features/my_diet/data/datasources/my_diet_api.dart';
import 'package:my_dinner/features/my_diet/data/dtos/diet_dto.dart';
import 'package:my_dinner/features/my_diet/data/dtos/diet_order_dto.dart';
import 'package:my_dinner/features/my_diet/domain/models/diet.dart';
import 'package:my_dinner/features/my_diet/domain/models/diet_order.dart';
import 'package:my_dinner/features/my_diet/domain/repositories/my_diet_repository.dart';

@RegisterAs(MyDietRepository)
@singleton
class MyDietRepositoryImp implements MyDietRepository {
  final _log = Log('MyDietRepositoryImp');
  final MyDietApi myDietApi;

  MyDietRepositoryImp(this.myDietApi);

  Future<Either<Failure, DietDay>> getDiets(DateTime day) async {
    try {
      DietDayDto dietDayDto = await myDietApi.getDiets(day);
      return Right(DietDay.fromDto(dietDayDto));
    } catch (e) {
      _log.error(e.toString());
      return Left(ApiFailure());
    }
  }

  Future<Either<Failure, DietSetOrder>> orderDiet(DietSet dietSet, DateTime day) async {
    try {
      DietSetOrderDto dto = await myDietApi.orderDiet(dietSet.id, day);
      return Right(DietSetOrder.fromDto(dto));
    } catch (e) {
      _log.error(e.toString());
      return Left(ApiFailure());
    }
  }
}
