import 'package:either_option/either_option.dart';
import 'package:injectable/injectable.dart';
import 'package:my_dinner/core/services/failures.dart';
import 'package:my_dinner/features/my_diet/data/datasources/my_diet_api.dart';
import 'package:my_dinner/features/my_diet/domain/models/diet.dart';
import 'package:my_dinner/features/my_diet/domain/repositories/my_diet_repository.dart';

@RegisterAs(MyDietRepository)
@singleton
class MyDietRepositoryImp implements MyDietRepository {
  final MyDietApi myDietApi;

  MyDietRepositoryImp(this.myDietApi);

  Future<Either<Failure, List<Diet>>> getDiets(DateTime day) async {
    try {
      return Right(await myDietApi.getDiets(day));
    } catch (e) {
      return Left(Failure());
    }
  }
}
