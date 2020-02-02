import 'package:flutter/material.dart';
import 'package:my_dinner/features/address/pages/domain/entities/address.dart';
import 'package:my_dinner/features/history_orders/domain/diet.dart';
import 'package:my_dinner/features/my_diet/presentation/pages/my_diet_page.dart';
import 'package:my_dinner/features/new_order/pages/new_order_page.dart';
import 'package:my_dinner/features/new_order/widgets/diet_card.dart';
import 'package:my_dinner/widgets/navigation_drawer.dart';

import 'order_details_page.dart';

class OrdersPage extends StatelessWidget {
  static Route<dynamic> get route {
    return MaterialPageRoute(
      builder: (_) => OrdersPage(),
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
          title: Text('Historia zamówień'),
        ),
        drawer: NavigationDrawer(),
        body: ListView(children: [
          ...List.generate(
              10,
              (index) => DietCard(
                    trailingIconType: TrailingIconType.arrow,
                    onTap: () {
                      Navigator.of(context)
                          .push(OrderDetailsPage.routeWithParams(index));
                    },
                    diet: Diet(
                        calories: 4000,
                        name: 'Dieta sportowa',
                        dietCounts: 14,
                        address: Address(),
                        remarks: 'Dieta bardzo dobra ale za słona'),
                  )).toList(),
          SizedBox(
            height: 88.0,
          )
        ]),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => Navigator.of(context).push(NewOrderPage.route),
        ),
      ),
    );
  }
}
