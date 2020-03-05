import 'package:either_option/either_option.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_dinner/core/services/failures.dart';
import 'package:my_dinner/core/services/use_case.dart';
import 'package:my_dinner/features/companies/domain/models/company.dart';
import 'package:my_dinner/features/companies/domain/models/diet_offer.dart';
import 'package:my_dinner/features/companies/domain/usecases/get_companies.dart';

@injectable
class CompanySelector extends ChangeNotifier {
  final GetCompanies _getCompanies;
  final List<Company> _companies = [];
  bool isLoaded = false;
  Company selectedCompany;

  CompanySelector(this._getCompanies);

  UnmodifiableListView<Company> get companies =>
      UnmodifiableListView(_companies);

  UnmodifiableListView<DietOffer> get diets =>
      UnmodifiableListView(selectedCompany?.availDiets ?? []);

  void selectCompany(Company company) {
    selectedCompany = company;
  }

  void initialize() async {
    _companies.addAll(_eitherLoadedOrError(await _getCompanies(NoParams())));
    isLoaded = true;
    notifyListeners();
  }

  List<Company> _eitherLoadedOrError(Either<Failure, List<Company>> either) {
    return either.fold(
      (_) => [],
      (companies) => companies,
    );
  }
}
