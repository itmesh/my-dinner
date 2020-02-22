import 'package:either_option/either_option.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import 'package:my_dinner/core/services/failures.dart';
import 'package:my_dinner/core/services/use_case.dart';
import 'package:my_dinner/features/my_diet/data/models/diet.dart';
import 'package:my_dinner/features/my_diet/domain/repositories/my_diet_repository.dart';

@singleton
class GetDiet extends UseCase<Diet, GetDietParams> {
  final MyDietRepository myDietRepository;

  GetDiet(this.myDietRepository);

  @override
  Future<Either<Failure, Diet>> call(params) async {
    return await myDietRepository.getDiet(params.day);
  }
}

class GetDietParams extends Equatable {
  final DateTime day;

  GetDietParams(this.day);

  @override
  List<Object> get props => [day];
}
