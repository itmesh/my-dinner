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
import 'package:my_dinner/widgets/stepper.dart';

@injectable
class DietPicker extends ChangeNotifier {
  final GetCompanies _getCompanies;
  final List<Company> _companies = [];
  final List<StepStatus> _steps = [
    StepStatus(step: 0, active: true, state: StepState.editing),
    StepStatus(step: 1, active: false, state: StepState.disabled),
    StepStatus(step: 2, active: false, state: StepState.disabled),
  ];
  bool loading = false;
  Company _selectedCompany;
  DietOffer _selectedDiet;
  int _calories;
  int _currentIndex = 0;

  int get calories => _calories;

  DietOffer get selectedDiet => _selectedDiet;

  Company get selectedCompany => _selectedCompany;

  StepStatus get currentStep => _steps[_currentIndex];

  DietPicker(this._getCompanies);

  UnmodifiableListView<Company> get companies =>
      UnmodifiableListView(_companies);

  UnmodifiableListView<StepStatus> get steps => UnmodifiableListView(_steps);

  UnmodifiableListView<DietOffer> get diets =>
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

  void selectCompany(Company company) {
    _selectedCompany = company;
    _selectedDiet = null;
    _calories = null;
    _currentIndex += 1;
    _steps[0].active = false;
    _steps[0].state = StepState.complete;
    _steps[1].active = true;
    _steps[1].state = StepState.editing;
    _steps[2].active = false;
    _steps[2].state = StepState.disabled;

    notifyListeners();
  }

  void selectCompanyWithDiet(Company company, DietOffer diet, int calories) {
    selectCompany(company);
    _selectedDiet = diet;
    _calories = calories;
  }

  void selectDiet(DietOffer dietOffer, int calories) {
    _selectedDiet = dietOffer;
    _calories = calories;
    _currentIndex += 1;
    _steps[1].active = false;
    _steps[1].state = StepState.complete;
    _steps[2].active = true;
    _steps[2].state = StepState.editing;
    notifyListeners();
  }

  PickedDiet finish() {
    return PickedDiet();
  }

  void initialize() async {
    setLoading(true);
    _companies.addAll(_eitherLoadedOrError(await _getCompanies(NoParams())));
    setLoading(false);
  }

  List<Company> _eitherLoadedOrError(Either<Failure, List<Company>> either) {
    return either.fold(
      (_) => [],
      (companies) => companies,
    );
  }

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
