import 'package:flutter/material.dart';
import 'package:my_dinner/features/my_diet/presentation/pages/my_diet_page.dart';
import 'package:my_dinner/features/new_order/presentation/pages/new_order_page.dart';
import 'package:my_dinner/widgets/navigation_drawer.dart';

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
