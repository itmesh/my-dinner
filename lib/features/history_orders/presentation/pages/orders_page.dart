import 'package:flutter/material.dart';
import 'package:my_dinner/features/address/domain/models/address.dart';
import 'package:my_dinner/features/my_diet/domain/models/diet.dart';
import 'package:my_dinner/features/my_diet/presentation/pages/my_diet_page.dart';
import 'package:my_dinner/features/new_order/presentation/pages/new_order_page.dart';
import 'package:my_dinner/features/new_order/presentation/widgets/diet_card.dart';
import 'package:my_dinner/features/pick_diet/presentation/pages/diet_selector_page.dart';
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
        Navigator.of(context).pushReplacement(MyDietPage.routeWithParams());
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Historia zamówień'),
        ),
        drawer: NavigationDrawer(),
        body: ListView(children: [
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
