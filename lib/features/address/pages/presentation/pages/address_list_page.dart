import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_dinner/features/address/pages/domain/entities/address.dart';
import 'package:my_dinner/features/address/pages/domain/entities/delivery_hours.dart';
import 'package:my_dinner/features/address/pages/presentation/pages/address_details_page.dart';
import 'package:my_dinner/features/address/pages/presentation/pages/widgets/address_card.dart';
import 'package:my_dinner/features/my_diet/presentation/pages/my_diet_page.dart';
import 'package:my_dinner/features/new_order/pages/edit_address_details_page.dart';
import 'package:my_dinner/widgets/navigation_drawer.dart';

class AddressListPage extends StatelessWidget {
  static Route<dynamic> get route {
    return MaterialPageRoute(
      builder: (_) => AddressListPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushReplacement(MyDietPage.route);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Adresy'),
        ),
        drawer: NavigationDrawer(),
        body: ListView(children: [
          ...List.generate(
              10,
              (index) => AddressCard(
                    onTap: () {
                      Navigator.of(context).push(AddressDetailsPage.route);
                    },
                    trailingIconType: TrailingIconType.arrow,
                    address: Address(
                      deliveryHours: FakeDeliveryHours(),
                      remarks: 'Jakieś tam uwagi 123',
                      postalCode: '30-054',
                      city: 'Kraków',
                      homeFlatNumber: '6/7',
                      street: 'Spokojna',
                    ),
                  )).toList(),
          SizedBox(height: 88.0),
        ]),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(EditAddressDetailsPage.route);
          },
        ),
      ),
    );
  }
}
