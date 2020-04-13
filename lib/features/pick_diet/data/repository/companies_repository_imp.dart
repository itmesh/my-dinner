import 'package:either_option/either_option.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:my_dinner/core/services/failures.dart';
import 'package:my_dinner/features/pick_diet/data/datasource/companies_api.dart';
import 'package:my_dinner/features/pick_diet/data/dtos/company_dto.dart';
import 'package:my_dinner/features/pick_diet/domain/models/company.dart';
import 'package:my_dinner/features/pick_diet/domain/repositories/companies_repository.dart';

@RegisterAs(CompaniesRepository)
@singleton
class CompaniesRepositoryImp extends CompaniesRepository {
  final CompaniesApi companiesApi;

  CompaniesRepositoryImp(this.companiesApi);

  @override
  Future<Either<Failure, List<Company>>> getCompanies() async {
    try {
      List<CompanyDto> companies = await companiesApi.getCompanies();
      return Right(companies.map((e) => Company.fromDto(e)));
    } catch (e) {
      Logger().e(e);
      return Left(ApiFailure());
    }
  }
}
