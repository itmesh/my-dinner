import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderDetailsPage extends StatelessWidget {
  static Route<dynamic> routeWithParams(int orderNumber) {
    return MaterialPageRoute(
        builder: (_) => OrderDetailsPage(orderNumber: orderNumber));
  }

  final int orderNumber;

  const OrderDetailsPage({Key key, this.orderNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Szczegóły zamówienia'),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: Center(child: Text('Zamówienie nr $orderNumber')),
          )
        ],
      ),
    );
  }
}
