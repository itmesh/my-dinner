import 'package:either_option/either_option.dart';
import 'package:injectable/injectable.dart';

import 'package:my_dinner/core/services/failures.dart';
import 'package:my_dinner/core/services/use_case.dart';
import 'package:my_dinner/features/pick_diet/domain/models/company.dart';

@singleton
class GetCompanies extends UseCase<List<Company>, NoParams> {
  @override
  Future<Either<Failure, List<Company>>> call(NoParams params) async {
    return Right([
      Company(
        name: 'test',
        logoURL:
            'https://catering-logo-images.s3.eu-central-1.amazonaws.com/catering-ohmyfood.png',
      )
    ]);
  }
}
