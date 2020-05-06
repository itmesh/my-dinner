import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_dinner/features/address/presentation/pages/address_details_page.dart';
import 'package:my_dinner/features/my_diet/domain/models/diet.dart';

class ScheduledDietCard extends StatelessWidget {
  final DietSet diet;
  final DateTime selectedDay;

  ScheduledDietCard(this.diet, this.selectedDay);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(diet.name),
        subtitle: Text(diet.vendorName),
        trailing: Wrap(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context).push(
                  AddressDetailsPage.routeWithParams(address: diet.address),
                );
              },
            ),
            IconButton(icon: Icon(Icons.cancel), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
