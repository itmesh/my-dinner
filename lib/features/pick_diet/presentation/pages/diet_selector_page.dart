import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:my_dinner/widgets/stepper.dart' as stepper;
import 'package:my_dinner/features/pick_diet/domain/models/picked_diet.dart';
import 'package:my_dinner/features/pick_diet/presentation/provider/diet_picker.dart';
import 'package:my_dinner/features/pick_diet/presentation/widgets/company_card.dart';
import 'package:my_dinner/features/pick_diet/presentation/widgets/days_selector.dart';
import 'package:my_dinner/features/pick_diet/presentation/widgets/diet_offer_card.dart';
import 'package:my_dinner/core/services/injection.dart';
import 'package:my_dinner/widgets/navigation_drawer.dart';

class DietSelectorPage extends StatefulWidget {
  static ModalRoute<dynamic> get route {
    return MaterialPageRoute(
      builder: (_) => DietSelectorPage(),
    );
  }

  @override
  _DietSelectorPageState createState() => _DietSelectorPageState();
}

class _DietSelectorPageState extends State<DietSelectorPage> {
  DietPicker _dietPicker;

  @override
  void didChangeDependencies() {
    if (_dietPicker == null) {
      _dietPicker = locator.get();
      _dietPicker.initialize();
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wybierz catering'),
        leading: CloseButton(),
      ),
      body: ChangeNotifierProvider.value(
        value: _dietPicker,
        child: Consumer<DietPicker>(
          builder: (_, dietPicker, child) {
            return Column(
              children: <Widget>[
                Expanded(
                  child: stepper.HorizontalStepper(
                    currentStep: _dietPicker.currentStep.step,
                    onStepTapped: _dietPicker.goToStep,
                    steps: [
                      _buildCompanyStep(),
                      _buildDietStep(),
                      _buildFinishStep(),
                    ],
                  ),
                ),
                if (_dietPicker.lastStep) _buildFinishAction()
              ],
            );
          },
        ),
      ),
      drawer: NavigationDrawer(),
    );
  }

  stepper.Step _buildCompanyStep() {
    return stepper.Step(
      isActive: _dietPicker.steps[0].active,
      state: _dietPicker.steps[0].state,
      title: Text(
        'Wybierz\ncatering',
        textAlign: TextAlign.center,
      ),
      content: Column(
        children: <Widget>[
          if (_dietPicker.loading) LinearProgressIndicator(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              children: _dietPicker.companies
                  .map((e) => CompanyCard(
                        selected: e == _dietPicker.selectedCompany,
                        company: e,
                        onSelect: _dietPicker.selectCompany,
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  stepper.Step _buildDietStep() {
    return stepper.Step(
      isActive: _dietPicker.steps[1].active,
      state: _dietPicker.steps[1].state,
      title: Text(
        'Wybierz\ndiete',
        textAlign: TextAlign.center,
      ),
      content: ListView(
        padding: const EdgeInsets.all(4.0),
        children: [
          if (_dietPicker.selectedCompany != null)
            ..._dietPicker.selectedCompany.availDiets
                .map((diet) => DietOfferCard(
                      dietOffer: diet,
                      onSelect: _dietPicker.selectDiet,
                    ))
                .toList(),
        ],
      ),
    );
  }

  stepper.Step _buildFinishStep() {
    return stepper.Step(
      isActive: _dietPicker.steps[2].active,
      state: _dietPicker.steps[2].state,
      title: Text(
        'Wybierz\ndni',
        textAlign: TextAlign.center,
      ),
      content: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[DateSelector()],
      ),
    );
  }

  Widget _buildFinishAction() {
    return Container(
      height: 56.0,
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              '0,00 zł',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: RaisedButton.icon(
              textColor: Colors.white,
              color: Theme.of(context).primaryColor,
              onPressed: () {
                PickedDiet pickedDiet = _dietPicker.finish();
                Navigator.of(context).pop(pickedDiet);
              },
              icon: Icon(Icons.save),
              label: Text('Zapisz'),
            ),
          )
        ],
      ),
    );
  }
}
