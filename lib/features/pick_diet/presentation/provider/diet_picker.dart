import 'dart:collection';

import 'package:either_option/either_option.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:my_dinner/core/services/failures.dart';
import 'package:my_dinner/core/services/use_case.dart';
import 'package:my_dinner/features/pick_diet/domain/models/company.dart';
import 'package:my_dinner/features/pick_diet/domain/models/diet_offer.dart';
import 'package:my_dinner/features/pick_diet/domain/models/picked_diet.dart';
import 'package:my_dinner/features/pick_diet/domain/usecases/get_companies.dart';
import 'package:my_dinner/features/pick_diet/domain/usecases/get_offers.dart';
import 'package:my_dinner/widgets/stepper.dart';

@injectable
class DietPicker extends ChangeNotifier {
  final GetCompanies _getCompanies;
  final GetOffers _getOffers;
  final List<Company> _companies = [];
  final List<StepStatus> _steps = [
    StepStatus(step: 0, active: true, state: StepState.editing),
    StepStatus(step: 1, active: false, state: StepState.disabled),
    StepStatus(step: 2, active: false, state: StepState.disabled),
  ];

  DietPicker(this._getCompanies, this._getOffers);

  bool loading = false;
  Company _selectedCompany;
  DietOffer _selectedDiet;
  Calorie _calorie;
  int _currentIndex = 0;
  bool _chooseDaysLater = true;
  String _remarks;
  int _setsCount;

  Calorie get calorie => _calorie;

  DietOffer get selectedDiet => _selectedDiet;

  Company get selectedCompany => _selectedCompany;

  StepStatus get currentStep => _steps[_currentIndex];

  String get remarks => _remarks;

  bool get chooseDaysLater => _chooseDaysLater;

  int get setsCount => _setsCount;

  UnmodifiableListView<Company> get companies =>
      UnmodifiableListView(_companies);

  UnmodifiableListView<StepStatus> get steps => UnmodifiableListView(_steps);

  UnmodifiableListView<DietOffer> get dietOffers =>
      UnmodifiableListView(_selectedCompany?.availDiets ?? []);

  void nextStep() {}

  void goToStep(int step) {
    _currentIndex = step;
    _steps.forEach((e) => e.active = false);
    _steps[step].active = true;
    _steps[step].state = StepState.editing;
    notifyListeners();
  }

  void prevStep() {}

  void selectCompany(Company company) async {
    _selectedCompany = company;
    _selectedDiet = null;
    _calorie = null;
    _currentIndex += 1;
    _steps[0].active = false;
    _steps[0].state = StepState.complete;
    _steps[1].active = true;
    _steps[1].state = StepState.editing;
    _steps[2].active = false;
    _steps[2].state = StepState.disabled;
    notifyListeners();
  }

  void selectCompanyWithDiet(
    Company company,
    DietOffer diet,
    Calorie calorie,
  ) {
    selectCompany(company);
    _selectedDiet = diet;
    _calorie = calorie;
  }

  void selectDiet(DietOffer dietOffer, int calorie) {
    _selectedDiet = dietOffer;
    _calorie = dietOffer.calories.firstWhere((e) => e.value == calorie);
    _currentIndex += 1;
    _steps[1].active = false;
    _steps[1].state = StepState.complete;
    _steps[2].active = true;
    _steps[2].state = StepState.editing;
    notifyListeners();
  }

  void setChooseDaysLater(bool value) {
    _chooseDaysLater = value;
    notifyListeners();
  }

  void setRemarks(String remarks) {
    _remarks = remarks;
    notifyListeners();
  }

  void setSetsCount(String setsCount) {
    _setsCount = int.parse(setsCount);
    notifyListeners();
  }

  PickedDiet complete() => PickedDiet(
        company: selectedCompany,
        dietOffer: selectedDiet,
        calorie: calorie,
        remarks: remarks,
        setsCount: setsCount,
      );

  void initialize() async {
    setLoading(true);
    _companies.addAll(_eitherLoadedOrError(await _getCompanies(NoParams())));
    setLoading(false);
  }

  List<Company> _eitherLoadedOrError(Either<Failure, List<Company>> either) =>
      either.fold(
        (_) => [],
        (companies) => companies,
      );

  bool get lastStep => _steps.last == currentStep;

  void setLoading(bool loading) {
    this.loading = loading;
    notifyListeners();
  }
}

class StepStatus {
  final int step;
  bool active;
  StepState state;

  StepStatus({
    this.step,
    this.active,
    this.state,
  });
}
