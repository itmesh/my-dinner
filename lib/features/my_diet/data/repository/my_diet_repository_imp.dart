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

  Future<Either<Failure, List<Diet>>> getDiets(DateTime day) async {
    try {
      List<DietDto> diets = await myDietApi.getDiets(day);
      return Right(diets.map((dto) => Diet.fromDto(dto)).toList());
    } catch (e) {
      _log.error(e.toString());
      return Left(ApiFailure());
    }
  }

  Future<Either<Failure, DietOrder>> orderDiet(DateTime day) async {
    try {
      DietOrderDto dto = await myDietApi.orderDiet(day);
      return Right(DietOrder.fromDto(dto));
    } catch (e) {
      _log.error(e.toString());
      return Left(ApiFailure());
    }
  }
}
