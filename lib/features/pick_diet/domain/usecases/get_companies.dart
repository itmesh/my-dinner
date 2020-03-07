import 'package:either_option/either_option.dart';
import 'package:injectable/injectable.dart';

import 'package:my_dinner/core/services/failures.dart';
import 'package:my_dinner/core/services/use_case.dart';
import 'package:my_dinner/features/pick_diet/domain/models/company.dart';
import 'package:my_dinner/features/pick_diet/domain/repositories/companies_repository.dart';

@singleton
class GetCompanies extends UseCase<List<Company>, NoParams> {
  final CompaniesRepository companiesRepository;

  GetCompanies(this.companiesRepository);

  @override
  Future<Either<Failure, List<Company>>> call(NoParams params) async {
    return await companiesRepository.getCompanies();
  }
}
