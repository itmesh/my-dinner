import 'package:flutter/material.dart';
import 'package:my_dinner/features/address/pages/presentation/pages/widgets/address_form.dart';

class AddressDetailsPage extends StatelessWidget {
  static ModalRoute<dynamic> get route {
    return MaterialPageRoute(builder: (_) => AddressDetailsPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Szczegóły dostawy'),
      ),
      body: AddressForm(),
    );
  }
}
