import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_dinner/features/new_order/presentation/pages/new_order_page.dart';
import 'package:my_dinner/features/pick_diet/presentation/widgets/dialogs.dart';
import 'package:provider/provider.dart';

import 'package:my_dinner/widgets/stepper.dart' as stepper;
import 'package:my_dinner/features/pick_diet/domain/models/picked_diet.dart';
import 'package:my_dinner/features/pick_diet/presentation/provider/diet_picker.dart';
import 'package:my_dinner/features/pick_diet/presentation/widgets/company_card.dart';
import 'package:my_dinner/features/pick_diet/presentation/widgets/days_selector.dart';
import 'package:my_dinner/features/pick_diet/presentation/widgets/diet_offer_card.dart';
import 'package:my_dinner/core/services/injection.dart';
import 'package:my_dinner/widgets/navigation_drawer.dart';

class PickDietPage extends StatefulWidget {
  static ModalRoute<PickDietResponse> route({
    PickDietRequest request,
  }) {
    return MaterialPageRoute<PickDietResponse>(
      builder: (_) => PickDietPage(
        request: request,
      ),
    );
  }

  final PickDietRequest request;

  const PickDietPage({Key key, this.request}) : super(key: key);

  @override
  _PickDietPageState createState() => _PickDietPageState();
}

class _PickDietPageState extends State<PickDietPage> {
  DietPicker _dietPicker;
  final _formKey = GlobalKey<FormState>();

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
    return WillPopScope(
      onWillPop: () async {
        if (Navigator.of(context).canPop()) {
          return true;
        } else {
          return await showCloseAppDialog(context);
        }
      },
      child: Scaffold(
        appBar: _buildAppBar(),
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
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text('Wybierz catering'),
      leading: Navigator.of(context).canPop() ? CloseButton() : null,
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
                        onSelectDiet: _dietPicker.selectCompanyWithDiet,
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
      content: Column(
        children: <Widget>[
          if (_dietPicker.loading) LinearProgressIndicator(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(4.0),
              children: [
                ..._dietPicker.dietOffers.map((diet) {
                  return DietOfferCard(
                    selected: diet == _dietPicker.selectedDiet,
                    dietOffer: diet,
                    onSelect: _dietPicker.selectDiet,
                  );
                }),
                /*
                if (_dietPicker.selectedCompany != null)
                  ..._dietPicker.dietOffers.map((diet) {
                    int calories = diet == _dietPicker.selectedDiet
                        ? _dietPicker.calorie.value
                        : null;
                    return DietOfferCard(
                      calories: calories,
                      selected: diet == _dietPicker.selectedDiet,
                      dietOffer: diet,
                      onSelect: _dietPicker.selectDiet,
                    );
                  }).toList(),
                 */
              ],
            ),
          ),
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
      content: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Pole nie może być puste';
                }
                return null;
              },
              onChanged: _dietPicker.setSetsCount,
              decoration: InputDecoration(labelText: 'Podaj ilość dni'),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                WhitelistingTextInputFormatter.digitsOnly
              ], // Only numbers can be entered
            ),
            TextFormField(
              onChanged: _dietPicker.setRemarks,
              minLines: 2,
              maxLines: 8,
              decoration: InputDecoration(labelText: 'Dodaj uwagi do diety'),
              // Only numbers can be entered
            ),
            SwitchListTile(
              value: _dietPicker.chooseDaysLater,
              onChanged: _dietPicker.setChooseDaysLater,
              title: Text('Wybiore dni później'),
            ),
            DateSelector(),
          ],
        ),
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
                if (_formKey.currentState.validate()) {
                  if (Navigator.of(context).canPop()) {
                    PickedDiet pickedDiet = _dietPicker.complete();
                    Navigator.of(context).pop(PickDietResponse(
                      pickedDiet: pickedDiet,
                    ));
                  } else {
                    Navigator.of(context).push(NewOrderPage.route);
                  }
                }
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

class PickDietRequest {
  final PickedDiet pickedDiet;

  PickDietRequest({this.pickedDiet});
}

class PickDietResponse {
  final PickedDiet pickedDiet;

  PickDietResponse({this.pickedDiet});
}
