import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  final CompanySelector _companySelector = locator.get();

  @override
  void initState() {
    super.initState();
    _companySelector.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wybierz catering'),
        leading: BackButton(),
      ),
      body: ChangeNotifierProvider(
        create: (context) => _companySelector,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Consumer<CompanySelector>(
            builder: (context, selector, child) {
              if (!selector.isLoaded) return LinearProgressIndicator();
              return ListView(
                children:
                    selector.companies.map((e) => CompanyCard(e)).toList(),
              );
            },
          ),
        ),
      ),
      drawer: NavigationDrawer(),
    );
  }
}
