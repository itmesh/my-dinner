import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_dinner/features/address/domain/models/address.dart';
import 'package:my_dinner/features/address/domain/models/delivery_hours.dart';
import 'package:my_dinner/features/address/presentation/widgets/address_card.dart';

import 'package:my_dinner/features/my_diet/domain/models/diet.dart';
import 'package:my_dinner/features/new_order/presentation/pages/edit_address_details_page.dart';
import 'package:my_dinner/features/new_order/presentation/pages/edit_diet_page.dart';
import 'package:my_dinner/features/new_order/presentation/pages/edit_profile_page.dart';
import 'package:my_dinner/features/new_order/presentation/widgets/diet_card.dart';
import 'package:my_dinner/features/pick_diet/presentation/pages/companies.dart';
import 'package:my_dinner/features/profile/domain/models/profile.dart';
import 'package:my_dinner/features/profile/presentation/widgets/contact_data_card.dart';

class NewOrderPage extends StatelessWidget {
  static Route<dynamic> get route {
    return MaterialPageRoute(
      builder: (_) => NewOrderPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nowe zamówienie'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildDietInfo(context),
                Container(height: 8.0, color: Colors.black12),
                _buildContactData(context),
                Container(height: 8.0, color: Colors.black12),
                _buildAddressData(context),
                Container(
                  height: 16.0,
                  color: Colors.black12,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(
                  '0,00 zł',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                Expanded(child: SizedBox()),
                Align(
                  alignment: Alignment.centerRight,
                  child: RaisedButton.icon(
                    label: Text('Podsumowanie'),
                    icon: Icon(Icons.playlist_add_check),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactData(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListTile(
          title: Text('Dane kontaktowe',
              style: TextStyle(
                  color: Color(0xFF2196f3), fontWeight: FontWeight.w400)),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 12.0),
          child: Container(
            child: ContactDataCard(
              contactData: Profile(
                name: 'Krzysztof',
                surname: 'Wizner',
                email: 'krzysztofwiz93@gmail.com',
                phoneNumber: 518990713,
              ),
              onEdit: () {
                Navigator.of(context).push(EditProfilePage.route);
              },
            ),
          ),
        )
      ],
    );
  }

  Widget _buildAddressData(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Row(
              children: <Widget>[
                Text('Adres dostawy',
                    style: TextStyle(
                        color: Color(0xFF2196f3), fontWeight: FontWeight.w400)),
                Expanded(
                  child: SizedBox(),
                ),
                OutlineButton(
                  onPressed: () {
                    Navigator.of(context).push(EditAddressDetailsPage.route);
                  },
                  borderSide: BorderSide(
                    color: Color(0xFF2196f3),
                  ),
                  child: Text('Dodaj'),
                ),
              ],
            ),
          ),
          if (addressData.length == 0)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: _buildEmptyCard(context, () {
                Navigator.of(context).push(EditAddressDetailsPage.route);
              }),
            ),
          if (addressData.length == 1)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: _buildSingleAddress(
                context: context,
                address: addressData[0],
                singleItem: true,
              ),
            ),
          if (addressData.length > 1)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                SizedBox(width: 12.0),
                if (addressData.length > 1)
                  ...addressData
                      .map((address) => _buildSingleAddress(
                            context: context,
                            address: address,
                          ))
                      .toList(),
                SizedBox(width: 4.0),
              ]),
            ),
        ],
      ),
    );
  }

  Widget _buildEmptyCard(BuildContext context, GestureTapCallback onPressed) {
    return Card(
      child: InkWell(
        onTap: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Container(
                height: 52.0,
                child: Center(
                  child: Icon(Icons.add),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSingleAddress({
    BuildContext context,
    Address address,
    bool singleItem = false,
  }) {
    AddressCard addressCard = AddressCard(
      onEdit: () {
        Navigator.of(context).push(EditAddressDetailsPage.route);
      },
      address: address,
    );
    if (singleItem) {
      return addressCard;
    } else {
      return Container(
        padding: const EdgeInsets.only(right: 8.0),
        width: MediaQuery.of(context).size.width * 0.8,
        child: addressCard,
      );
    }
  }

  Widget _buildDietInfo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Row(
              children: <Widget>[
                Text('Pakiet pudełek',
                    style: TextStyle(
                        color: Color(0xFF2196f3), fontWeight: FontWeight.w400)),
                Expanded(
                  child: SizedBox(),
                ),
                if (mealsData.isNotEmpty)
                  OutlineButton(
                    onPressed: () {
                      Navigator.of(context).push(Companies.route);
                    },
                    borderSide: BorderSide(
                      color: Color(0xFF2196f3),
                    ),
                    child: Text('Wybierz inny'),
                  ),
              ],
            ),
          ),
          if (mealsData.length == 0)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: _buildEmptyCard(context, () {
                Navigator.of(context).push(Companies.route);
              }),
            ),
          if (mealsData.length == 1)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: _buildSingleDiet(
                context: context,
                diet: mealsData[0],
                singleItem: true,
              ),
            ),
          if (mealsData.length > 1)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                SizedBox(width: 12.0),
                ...mealsData
                    .map((diet) => _buildSingleDiet(
                          context: context,
                          diet: diet,
                        ))
                    .toList(),
                SizedBox(width: 4.0),
              ]),
            ),
        ],
      ),
    );
  }

  Widget _buildSingleDiet({
    BuildContext context,
    Diet diet,
    singleItem = false,
  }) {
    Widget dietCard = DietCard(
      diet: diet,
      onEdit: () {
        Navigator.of(context).push(EditDietPage.route);
      },
    );
    if (singleItem) {
      return dietCard;
    } else {
      return Container(
        padding: const EdgeInsets.only(right: 8.0),
        width: MediaQuery.of(context).size.width * 0.8,
        child: dietCard,
      );
    }
  }

  static List<Address> addressData0 = [];
  static List<Address> addressData1 = [
    Address(
      street: 'Spokojna',
      homeFlatNumber: '8/5',
      deliveryHours: DeliveryHours(
        fromHour: DateTime(0, 0, 0, 8, 0),
        toHour: DateTime(0, 0, 0, 10, 0),
      ),
      city: 'Kraków',
      postalCode: '30-054',
      remarks: 'Pin do bramki to 12344',
    ),
  ];
  static List<Address> addressData2 = List.generate(5, (index) {
    return Address(
      street: 'Spokojna',
      homeFlatNumber: '8/5',
      deliveryHours: DeliveryHours(
        fromHour: DateTime(0, 0, 0, 8, 0),
        toHour: DateTime(0, 0, 0, 10, 0),
      ),
      city: 'Kraków',
      postalCode: '30-054',
      remarks: 'Pin do bramki to 12344',
    );
  }).toList();
  static List<Diet> mealsData0 = [];
  static List<Diet> mealsData1 = [
    Diet(
      address: Address(
        deliveryHours: DeliveryHours(
          fromHour: DateTime(0, 0, 0, 8, 0),
          toHour: DateTime(0, 0, 0, 10, 0),
        ),
      ),
      calories: 3000,
      name: 'Dieta 3000 kalorii',
      dietCounts: 4,
      remarks: 'Nie lubie szczypiorku oraz proszę o rezygnacje z mięsa',
    ),
  ];
  static List<Diet> mealsData2 = List.generate(5, (index) {
    return Diet(
      address: Address(
        deliveryHours: DeliveryHours(
          fromHour: DateTime(0, 0, 0, 8, 0),
          toHour: DateTime(0, 0, 0, 10, 0),
        ),
      ),
      calories: 3000,
      name: 'Dieta 3000 kalorii',
      dietCounts: 4,
      remarks: 'Nie lubie szczypiorku oraz proszę o rezygnacje z mięsa',
    );
  }).toList();

  final List<Address> addressData = addressData2;
  final List<Diet> mealsData = mealsData0;
}
