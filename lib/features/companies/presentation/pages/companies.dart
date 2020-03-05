import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_dinner/features/companies/domain/models/company.dart';
import 'package:my_dinner/features/companies/domain/models/diet_offer.dart';
import 'package:my_dinner/features/companies/presentation/widgets/days_selector.dart';
import 'package:my_dinner/features/companies/presentation/widgets/diet_offer_card.dart';
import 'package:provider/provider.dart';

import 'package:my_dinner/core/services/injection.dart';
import 'package:my_dinner/features/companies/presentation/provider/company_selector.dart';
import 'package:my_dinner/features/companies/presentation/widgets/company_card.dart';
import 'package:my_dinner/widgets/navigation_drawer.dart';

class Companies extends StatefulWidget {
  static ModalRoute<dynamic> get route {
    return MaterialPageRoute(
      builder: (_) => Companies(),
    );
  }

  @override
  _CompaniesState createState() => _CompaniesState();
}

class _CompaniesState extends State<Companies> {
  int currentStep = 0;
  Company selectedCompany;
  DietOffer dietOffer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wybierz catering'),
        leading: CloseButton(),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Stepper(
              currentStep: currentStep,
              onStepTapped: (step) => setState(() => currentStep = step),
              onStepContinue: () => currentStep + 1 < 3
                  ? setState(() => currentStep = currentStep + 1)
                  : {},
              onStepCancel: () => currentStep > 0
                  ? setState(() => currentStep = currentStep - 1)
                  : {},
              controlsBuilder: (
                BuildContext context, {
                VoidCallback onStepContinue,
                VoidCallback onStepCancel,
              }) {
                return SizedBox();
              },
              steps: [
                Step(
                  isActive: currentStep == 0,
                  state:
                      currentStep > 0 ? StepState.complete : StepState.editing,
                  title: Text(
                    'Wybierz\ncatering',
                    textAlign: TextAlign.center,
                  ),
                  content: ChangeNotifierProvider(
                    create: (context) =>
                        locator.get<CompanySelector>()..initialize(),
                    child: Consumer<CompanySelector>(
                      builder: (context, selector, child) {
                        if (!selector.isLoaded)
                          return LinearProgressIndicator();
                        return Column(
                          children: selector.companies
                              .map((e) => CompanyCard(
                                    selected: e == selectedCompany,
                                    company: e,
                                    onSelect: (company) {
                                      setState(() {
                                        selectedCompany = company;
                                        currentStep++;
                                      });
                                    },
                                  ))
                              .toList(),
                        );
                      },
                    ),
                  ),
                ),
                Step(
                    isActive: currentStep == 1,
                    state: currentStep > 1
                        ? StepState.complete
                        : StepState.editing,
                    title: Text(
                      'Wybierz\ndiete',
                      textAlign: TextAlign.center,
                    ),
                    content: Column(children: [
                      if (selectedCompany != null)
                        ...selectedCompany.availDiets
                            .map((e) => DietOfferCard(
                                  dietOffer: e,
                                  onSelect: (value) {
                                    setState(() {
                                      dietOffer = value;
                                      currentStep++;
                                    });
                                  },
                                ))
                            .toList(),
                    ])),
                Step(
                  isActive: currentStep == 2,
                  state:
                      currentStep > 2 ? StepState.complete : StepState.editing,
                  title: Text(
                    'Wybierz\ndni',
                    textAlign: TextAlign.center,
                  ),
                  content: DateSelector(),
                ),
              ],
              type: StepperType.horizontal,
            ),
          ),
          if (currentStep == 2)
            Container(
              height: 56.0,
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      '0,00 zł',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: RaisedButton.icon(
                      textColor: Colors.white,
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.save),
                      label: Text('Zapisz'),
                    ),
                  )
                ],
              ),
            ),
        ],
      ),
      drawer: NavigationDrawer(),
    );
  }
}
