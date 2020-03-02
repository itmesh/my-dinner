import 'package:either_option/either_option.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:my_dinner/core/services/failures.dart';
import 'package:my_dinner/features/companies/data/datasource/companies_api.dart';
import 'package:my_dinner/features/companies/domain/models/company.dart';
import 'package:my_dinner/features/companies/domain/repositories/companies_repository.dart';

@RegisterAs(CompaniesRepository)
@singleton
class CompaniesRepositoryImp extends CompaniesRepository {
  final CompaniesApi companiesApi;

  CompaniesRepositoryImp(this.companiesApi);

  @override
  Future<Either<Failure, List<Company>>> getCompanies() async {
    try {
      return Right(await companiesApi.getCompanies());
    } catch (e) {
      Logger().e(e);
      return Left(ApiFailure());
    }
  }
}
