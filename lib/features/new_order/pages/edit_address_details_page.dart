import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_dinner/features/address/pages/presentation/pages/widgets/address_form.dart';

class EditAddressDetailsPage extends StatelessWidget {
  static ModalRoute<dynamic> get route {
    return MaterialPageRoute(
      builder: (_) => EditAddressDetailsPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(),
        title: Text('Adres dostawy'),
      ),
      body: AddressForm(),
    );
  }
}
