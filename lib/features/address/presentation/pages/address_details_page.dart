import 'package:flutter/material.dart';
import 'package:my_dinner/features/address/domain/models/address.dart';
import 'package:my_dinner/features/address/presentation/widgets/address_form.dart';

class AddressDetailsPage extends StatelessWidget {
  final Address address;

  const AddressDetailsPage({
    Key key,
    this.address,
  }) : super(key: key);

  static ModalRoute<Address> routeWithParams({
    Address address,
    bool canDelete,
  }) {
    return MaterialPageRoute(
      builder: (_) => AddressDetailsPage(
        address: address,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edytuj adres'),
      ),
      body: AddressForm(
        address: address,
      ),
    );
  }
}
