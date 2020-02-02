import 'package:flutter/material.dart';

class MealDetailsPage extends StatelessWidget {
  static ModalRoute<dynamic> get route {
    return MaterialPageRoute(
      builder: (_) => MealDetailsPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(),
        title: Text('Szczegóły posiłku'),
      ),
      body: Center(
        child: Text('Szczegóły posiłku'),
      ),
    );
  }
}
