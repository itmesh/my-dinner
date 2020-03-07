import 'package:either_option/either_option.dart';
import 'package:my_dinner/core/services/failures.dart';
import 'package:my_dinner/features/pick_diet/domain/models/company.dart';

abstract class CompaniesRepository {
  Future<Either<Failure, List<Company>>> getCompanies();
}
