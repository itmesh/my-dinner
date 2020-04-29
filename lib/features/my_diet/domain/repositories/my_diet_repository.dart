import 'package:either_option/either_option.dart';
import 'package:my_dinner/core/services/failures.dart';
import 'package:my_dinner/features/my_diet/domain/models/diet.dart';
import 'package:my_dinner/features/my_diet/domain/models/diet_order.dart';

abstract class MyDietRepository {
  Future<Either<Failure, List<Diet>>> getDiets(DateTime day);
  Future<Either<Failure, DietOrder>> orderDiet(DateTime day);
}
